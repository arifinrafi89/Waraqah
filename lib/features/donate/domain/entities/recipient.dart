import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/book.dart';

part 'recipient.freezed.dart';

enum RecipientKind { library, school, madrasa, orphanage }

/// A place Waraqah has checked that takes donated books: a community
/// library, a school, a madrasa or an orphanage. Only verified places are
/// listed, so every one of them is.
@freezed
abstract class Recipient with _$Recipient {
  const Recipient._();

  const factory Recipient({
    required String id,
    required String name,
    required RecipientKind kind,
    required String district,
    required String area,

    /// Who they are and who reads the books, in a sentence or two.
    required String story,
    required List<RecipientNeed> needs,
  }) = _Recipient;

  int get booksWanted => needs.fold(0, (sum, need) => sum + need.wanted);

  int get booksReceived =>
      needs.fold(0, (sum, need) => sum + min(need.received, need.wanted));

  int get booksStillNeeded => booksWanted - booksReceived;
}

/// One book a recipient asked for: how many copies, and how many donors
/// have sent so far. Donations are of one printed edition, chosen by
/// Waraqah, at [priceBdt] a copy.
@freezed
abstract class RecipientNeed with _$RecipientNeed {
  const RecipientNeed._();

  const factory RecipientNeed({
    required Book book,
    required String editionId,
    required int priceBdt,
    required int wanted,
    required int received,
  }) = _RecipientNeed;

  int get stillNeeded => max(0, wanted - received);

  bool get isMet => stillNeeded == 0;
}
