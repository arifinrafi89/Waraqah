import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/inbox_message.dart';

part 'inbox_message_model.freezed.dart';
part 'inbox_message_model.g.dart';

@freezed
abstract class OfferModel with _$OfferModel {
  const factory OfferModel({
    required String id,
    required int amountBdt,
    required OfferHandover handover,
    @Default(OfferStatus.pending) OfferStatus status,
  }) = _OfferModel;

  factory OfferModel.fromJson(Map<String, dynamic> json) =>
      _$OfferModelFromJson(json);
}

@freezed
abstract class InboxMessageModel with _$InboxMessageModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory InboxMessageModel({
    required String id,
    required MessageFrom from,
    required DateTime at,
    String? text,
    OfferModel? offer,
    ThreadEvent? event,
    int? amountBdt,
  }) = _InboxMessageModel;

  factory InboxMessageModel.fromJson(Map<String, dynamic> json) =>
      _$InboxMessageModelFromJson(json);
}

extension InboxMessageModelX on InboxMessageModel {
  InboxMessage toEntity() => InboxMessage(
    id: id,
    from: from,
    at: at,
    text: text,
    offer: switch (offer) {
      final offer? => Offer(
        id: offer.id,
        amountBdt: offer.amountBdt,
        handover: offer.handover,
        status: offer.status,
      ),
      null => null,
    },
    event: event,
    amountBdt: amountBdt,
  );
}
