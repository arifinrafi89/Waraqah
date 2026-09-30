import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/book_alert.dart';

part 'book_alert_model.freezed.dart';
part 'book_alert_model.g.dart';

@freezed
abstract class BookAlertModel with _$BookAlertModel {
  const factory BookAlertModel({
    required String id,
    required AlertKind kind,
    required String bookId,
    required String editionId,
    required String bookTitle,
    required int currentPriceBdt,
    required bool isTriggered,
    int? targetPriceBdt,
  }) = _BookAlertModel;

  factory BookAlertModel.fromJson(Map<String, dynamic> json) =>
      _$BookAlertModelFromJson(json);
}

extension BookAlertModelX on BookAlertModel {
  BookAlert toEntity() => BookAlert(
    id: id,
    kind: kind,
    bookId: bookId,
    editionId: editionId,
    bookTitle: bookTitle,
    currentPriceBdt: currentPriceBdt,
    isTriggered: isTriggered,
    targetPriceBdt: targetPriceBdt,
  );
}
