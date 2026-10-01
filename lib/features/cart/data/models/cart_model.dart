import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/edition.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../domain/entities/cart.dart';
import '../../domain/entities/cart_line.dart';

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

/// JSON shape of a [CartLine], as the server sends it.
@freezed
abstract class CartLineModel with _$CartLineModel {
  const factory CartLineModel({
    required String id,
    required CartItemKind kind,
    required String itemId,
    required String bookId,
    required String title,
    required String author,
    required int unitPriceBdt,
    required int quantity,
    required int maxQuantity,
    int? listPriceBdt,
    BookFormat? format,
    BookLanguage? language,
    @Default(false) bool isPreorder,
    BookCondition? condition,
    @Default(0) int coverSeed,
  }) = _CartLineModel;

  factory CartLineModel.fromJson(Map<String, dynamic> json) =>
      _$CartLineModelFromJson(json);
}

/// JSON shape of a [Cart]: every cart endpoint answers with this.
@freezed
abstract class CartModel with _$CartModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory CartModel({
    @Default(<CartLineModel>[]) List<CartLineModel> lines,
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
}

extension CartModelX on CartModel {
  Cart toEntity() => Cart(lines: [for (final line in lines) line.toEntity()]);
}

extension CartLineModelX on CartLineModel {
  CartLine toEntity() => CartLine(
    id: id,
    kind: kind,
    itemId: itemId,
    bookId: bookId,
    title: title,
    author: author,
    unitPriceBdt: unitPriceBdt,
    quantity: quantity,
    maxQuantity: maxQuantity,
    listPriceBdt: listPriceBdt,
    format: format,
    language: language,
    isPreorder: isPreorder,
    condition: condition,
    coverSeed: coverSeed,
  );
}
