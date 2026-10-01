import 'dart:async';

// Sell Back pays into the reader's wallet and stocks Certified Used.
import '../../../p2p/data/sources/p2p_people.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../../wallet/data/sources/wallet_fake_store.dart';
import '../../../wallet/domain/entities/wallet.dart';
import '../../domain/entities/sell_back.dart';
import '../../domain/entities/sell_back_rules.dart';
import '../models/sell_back_model.dart';
import 'certified_used_stock.dart';
import 'sell_back_books.dart';
import 'sell_back_seed.dart';

/// Sell Backs on the fake backend. The signed-in reader is
/// [P2pPeople.me]; the courier picks a book up [pickupDelay] after it's
/// booked.
class SellBackFakeStore {
  SellBackFakeStore(
    this.wallet, {
    DateTime Function()? clock,
    this.pickupDelay = const Duration(seconds: 4),
  }) : now = clock ?? DateTime.now {
    CertifiedUsedStock.reset();
    for (final (readerId, model) in sellBackSeed(now())) {
      _all.add((readerId, model));
    }
  }

  final WalletFakeStore wallet;
  final DateTime Function() now;
  final Duration pickupDelay;
  final List<(String, SellBackModel)> _all = [];

  SellBackModel? create(SellBackDraft draft) {
    final book = SellBackBooks.find(draft.bookId);
    if (book == null ||
        draft.pickupAddress.trim().length < SellBackRules.minAddress) {
      return null;
    }
    final model = SellBackModel(
      id: 'SB-${_all.length + 301}',
      book: book,
      condition: draft.condition,
      flags: draft.flags,
      quoteBdt: SellBackRules.quote(
        book.newPriceBdt,
        draft.condition,
        flags: draft.flags,
      ),
      status: SellBackStatus.scheduled,
      pickupAddress: draft.pickupAddress,
      createdAt: now(),
    );
    _all.add((P2pPeople.me, model));
    // Demo only: the courier collects it.
    Timer(pickupDelay, () {
      final i = _all.indexWhere((e) => e.$2.id == model.id);
      if (_all[i].$2.status != SellBackStatus.scheduled) return;
      _all[i] = (P2pPeople.me, model.copyWith(status: SellBackStatus.pickedUp));
    });
    return model;
  }

  List<SellBackModel> mine() => [
    for (final (reader, model) in _all.reversed)
      if (reader == P2pPeople.me) model,
  ];

  /// Picked up and waiting for staff, oldest first, with who's selling.
  List<SellBackModel> queue() => [
    for (final (reader, model) in _all)
      if (model.status == SellBackStatus.pickedUp)
        model.copyWith(readerName: P2pPeople.find(reader)?.name ?? '?'),
  ];

  /// `false` unless it's waiting to be graded.
  bool grade(String id, BookCondition condition, {required bool accept}) {
    final i = _all.indexWhere(
      (e) => e.$2.id == id && e.$2.status == SellBackStatus.pickedUp,
    );
    if (i < 0) return false;
    final (reader, m) = _all[i];
    if (!accept) {
      _all[i] = (reader, m.copyWith(status: SellBackStatus.returned));
      return true;
    }
    final paid = SellBackRules.quote(
      m.book.newPriceBdt,
      condition,
      flags: m.flags,
    );
    _all[i] = (
      reader,
      m.copyWith(
        status: SellBackStatus.paid,
        gradedCondition: condition,
        paidBdt: paid,
      ),
    );
    // Only the signed-in reader's wallet lives on this fake backend.
    if (reader == P2pPeople.me) {
      wallet.credit(paid, WalletReason.sellBack, note: m.book.title);
    }
    CertifiedUsedStock.publish(
      m.book.bookId,
      SellBackRules.resellPrice(m.book.newPriceBdt, condition),
      condition,
    );
    return true;
  }
}
