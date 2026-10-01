import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../domain/entities/sell_back.dart';

part 'sell_back_model.freezed.dart';
part 'sell_back_model.g.dart';

/// JSON shape of a [SellBackBook].
@freezed
abstract class SellBackBookModel with _$SellBackBookModel {
  const factory SellBackBookModel({
    required String bookId,
    required String title,
    required String author,
    required int newPriceBdt,
    @Default(0) int coverSeed,
  }) = _SellBackBookModel;

  factory SellBackBookModel.fromJson(Map<String, dynamic> json) =>
      _$SellBackBookModelFromJson(json);
}

/// JSON shape of a [SellBack].
@freezed
abstract class SellBackModel with _$SellBackModel {
  // Deep toJson: the fake API answers the Book inside as JSON.
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory SellBackModel({
    required String id,
    required SellBackBookModel book,
    required BookCondition condition,
    required int quoteBdt,
    required SellBackStatus status,
    required String pickupAddress,
    required DateTime createdAt,
    @Default(0) int flags,
    BookCondition? gradedCondition,
    int? paidBdt,
    String? readerName,
  }) = _SellBackModel;

  factory SellBackModel.fromJson(Map<String, dynamic> json) =>
      _$SellBackModelFromJson(json);
}

extension SellBackBookModelX on SellBackBookModel {
  SellBackBook toEntity() => SellBackBook(
    bookId: bookId,
    title: title,
    author: author,
    newPriceBdt: newPriceBdt,
    coverSeed: coverSeed,
  );
}

extension SellBackModelX on SellBackModel {
  SellBack toEntity() => SellBack(
    id: id,
    book: book.toEntity(),
    condition: condition,
    quoteBdt: quoteBdt,
    status: status,
    pickupAddress: pickupAddress,
    createdAt: createdAt,
    flags: flags,
    gradedCondition: gradedCondition,
    paidBdt: paidBdt,
    readerName: readerName,
  );
}
