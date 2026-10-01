import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/book.dart';
import '../../domain/entities/shared_wishlist.dart';

part 'shared_wishlist_model.freezed.dart';
part 'shared_wishlist_model.g.dart';

@freezed
abstract class SharedWishlistModel with _$SharedWishlistModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory SharedWishlistModel({
    required String id,
    required String ownerName,
    required List<Book> books,
  }) = _SharedWishlistModel;

  factory SharedWishlistModel.fromJson(Map<String, dynamic> json) =>
      _$SharedWishlistModelFromJson(json);
}

extension SharedWishlistModelX on SharedWishlistModel {
  SharedWishlist toEntity() =>
      SharedWishlist(id: id, ownerName: ownerName, books: books);
}
