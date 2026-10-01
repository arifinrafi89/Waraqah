// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_wishlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SharedWishlistModel _$SharedWishlistModelFromJson(Map<String, dynamic> json) =>
    _SharedWishlistModel(
      id: json['id'] as String,
      ownerName: json['ownerName'] as String,
      books: (json['books'] as List<dynamic>)
          .map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SharedWishlistModelToJson(
  _SharedWishlistModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'ownerName': instance.ownerName,
  'books': instance.books.map((e) => e.toJson()).toList(),
};
