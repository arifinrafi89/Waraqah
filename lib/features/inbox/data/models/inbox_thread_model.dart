import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../domain/entities/inbox_change.dart';
import '../../domain/entities/inbox_thread.dart';
import 'inbox_message_model.dart';

part 'inbox_thread_model.freezed.dart';
part 'inbox_thread_model.g.dart';

@freezed
abstract class ThreadListingModel with _$ThreadListingModel {
  const factory ThreadListingModel({
    required String id,
    required String title,
    required int priceBdt,
    required P2pListingStatus status,
    @Default(0) int coverSeed,
    @Default(false) bool isNegotiable,
    @Default(HandoverMethod.meetInPerson) HandoverMethod handover,
  }) = _ThreadListingModel;

  factory ThreadListingModel.fromJson(Map<String, dynamic> json) =>
      _$ThreadListingModelFromJson(json);
}

/// JSON shape of an [InboxThread], from the signed-in reader's side.
@freezed
abstract class InboxThreadModel with _$InboxThreadModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory InboxThreadModel({
    required String id,
    required ThreadRole role,
    required String otherId,
    required String otherName,
    required ThreadListingModel listing,
    @Default(false) bool dealHere,
    @Default(0) int unread,
    @Default(<InboxMessageModel>[]) List<InboxMessageModel> messages,
  }) = _InboxThreadModel;

  factory InboxThreadModel.fromJson(Map<String, dynamic> json) =>
      _$InboxThreadModelFromJson(json);
}

@freezed
abstract class InboxChangeModel with _$InboxChangeModel {
  const factory InboxChangeModel({
    required int seq,
    required String threadId,
    required String listingId,
  }) = _InboxChangeModel;

  factory InboxChangeModel.fromJson(Map<String, dynamic> json) =>
      _$InboxChangeModelFromJson(json);
}

extension InboxThreadModelX on InboxThreadModel {
  InboxThread toEntity() => InboxThread(
    id: id,
    role: role,
    otherId: otherId,
    otherName: otherName,
    listing: ThreadListing(
      id: listing.id,
      title: listing.title,
      priceBdt: listing.priceBdt,
      status: listing.status,
      coverSeed: listing.coverSeed,
      isNegotiable: listing.isNegotiable,
      handover: listing.handover,
    ),
    dealHere: dealHere,
    unread: unread,
    messages: [for (final message in messages) message.toEntity()],
  );
}

extension InboxChangeModelX on InboxChangeModel {
  InboxChange toEntity() =>
      InboxChange(seq: seq, threadId: threadId, listingId: listingId);
}
