import 'dart:async';

// A handled sale reserves and sells marketplace Listings, refunds into the
// reader's wallet, and moderators' decisions go into their audit log.
import '../../../checkout/domain/entities/payment_method.dart';
import '../../../moderation/data/sources/moderation_fake_store.dart';
// Buyers and sellers hear when a sale moves on.
import '../../../notifications/data/sources/notification_fake_store.dart';
import '../../../notifications/data/sources/notification_sale_sends.dart';
import '../../../p2p/data/sources/p2p_fake_store.dart';
import '../../../p2p/data/sources/p2p_people.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../../wallet/data/sources/wallet_fake_store.dart';
import '../../domain/entities/handled_sale.dart';
import '../models/earnings_model.dart';
import '../models/handled_sale_model.dart';
import 'fake_sale.dart';
import 'handled_sale_seed.dart';
import 'sale_changes.dart';

/// Waraqah-handled sales on the fake backend. The signed-in reader is
/// [P2pPeople.me]; the demo's other sellers send a book [sendDelay] after
/// it's paid for.
class HandledSaleFakeStore {
  HandledSaleFakeStore(
    this.p2p,
    this.wallet, {
    this.moderation,
    this.notifications,
    DateTime Function()? clock,
    this.sendDelay = const Duration(seconds: 4),
  }) : now = clock ?? DateTime.now {
    for (final sale in handledSaleSeed(now())) {
      sales[sale.id] = sale;
      if (sale.status != SaleStatus.completed) {
        p2p.setStatus(
          sale.listingId,
          P2pListingStatus.reserved,
          buyerId: sale.buyerId,
        );
      }
    }
    payouts.addAll(payoutSeed(now()));
  }

  static const String me = P2pPeople.me;

  final P2pFakeStore p2p;
  final WalletFakeStore wallet;
  final ModerationFakeStore? moderation;
  final NotificationFakeStore? notifications;
  final DateTime Function() now;
  final Duration sendDelay;
  final Map<String, FakeSale> sales = {};
  final List<PayoutModel> payouts = [];
  final SaleChanges live = SaleChanges();
  int _ids = 200;

  String nameOf(String id) => P2pPeople.find(id)?.name ?? '?';

  String titleOf(FakeSale s) => p2p.find(s.listingId)?.title ?? '';

  /// The sale as [viewerId] sees it.
  Map<String, dynamic> json(FakeSale s, [String viewerId = me]) {
    final buying = s.buyerId == viewerId;
    final listing = p2p.find(s.listingId);
    return HandledSaleModel(
      id: s.id,
      listingId: s.listingId,
      title: listing?.title ?? '',
      coverSeed: listing?.coverSeed ?? 0,
      role: buying ? SaleRole.buyer : SaleRole.seller,
      otherName: nameOf(buying ? s.sellerId : s.buyerId),
      priceBdt: s.priceBdt,
      deliveryBdt: s.buyerPaysBdt - s.priceBdt,
      feeBdt: s.feeBdt,
      status: s.status,
      method: s.method,
      createdAt: s.createdAt,
      disputeReason: s.disputeReason,
      disputeNote: s.disputeNote,
      disputePhotos: s.disputePhotos,
    ).toJson();
  }

  /// `null` unless the Listing is on sale by someone else and the money
  /// can be held (no cash on delivery).
  FakeSale? buy(String listingId, PaymentMethod method) {
    final listing = p2p.find(listingId);
    if (listing == null ||
        listing.status != P2pListingStatus.live ||
        listing.sellerId == me ||
        !method.isPrepaid) {
      return null;
    }
    final sale = FakeSale(
      id: 'HS-${++_ids}',
      listingId: listingId,
      buyerId: me,
      sellerId: listing.sellerId,
      priceBdt: listing.priceBdt,
      method: method,
      createdAt: now(),
    );
    sales[sale.id] = sale;
    p2p.setStatus(listingId, P2pListingStatus.reserved, buyerId: me);
    // Demo only: the other reader hands the book to the courier.
    Timer(sendDelay, () {
      if (sale.status != SaleStatus.paid) return;
      sale.status = SaleStatus.sent;
      notifications?.saleSent(me, sale.id, titleOf(sale));
      live.sale(sale.id);
    });
    return sale;
  }
}
