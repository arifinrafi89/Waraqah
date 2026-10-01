import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/book_request.dart';

part 'wanted_book_model.freezed.dart';
part 'wanted_book_model.g.dart';

/// JSON shape of a [WantedBook] and a [BookDemand].
@freezed
abstract class WantedBookModel with _$WantedBookModel {
  const factory WantedBookModel({
    required String requestId,
    required String readerName,
    required String title,
    required String listingId,
    required DateTime createdAt,
    int? maxPriceBdt,
  }) = _WantedBookModel;

  factory WantedBookModel.fromJson(Map<String, dynamic> json) =>
      _$WantedBookModelFromJson(json);
}

@freezed
abstract class BookDemandModel with _$BookDemandModel {
  const factory BookDemandModel({
    required String title,
    required int requests,
  }) = _BookDemandModel;

  factory BookDemandModel.fromJson(Map<String, dynamic> json) =>
      _$BookDemandModelFromJson(json);
}

extension WantedBookModelX on WantedBookModel {
  WantedBook toEntity() => WantedBook(
    requestId: requestId,
    readerName: readerName,
    title: title,
    listingId: listingId,
    createdAt: createdAt,
    maxPriceBdt: maxPriceBdt,
  );
}

extension BookDemandModelX on BookDemandModel {
  BookDemand toEntity() => BookDemand(title: title, requests: requests);
}
