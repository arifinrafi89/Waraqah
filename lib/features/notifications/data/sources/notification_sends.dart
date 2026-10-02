import '../../../p2p/data/models/p2p_listing_model.dart';
import '../../../p2p/data/sources/p2p_people.dart';
import '../../domain/entities/notification_kind.dart';
import '../models/app_notification_model.dart';
import 'notification_fake_store.dart';

/// One call per event, for the fake backends that send notifications
/// (orders, moderation, alerts, book requests). Sales and Sell Back are in
/// `NotificationSaleSends`.
/// Each fills the kind's params; the app writes the words.
extension NotificationSends on NotificationFakeStore {
  static const _me = P2pPeople.me;

  void orderChanged(String number, String status) => send(
    _me,
    NotificationKind.orderStatus,
    params: {'number': number, 'status': status},
    target: notificationTo(NotificationTargetKind.order, number),
  );

  void returnDecided(String number, {required bool approved}) => send(
    _me,
    NotificationKind.returnDecided,
    params: {'number': number, 'approved': '$approved'},
    target: notificationTo(NotificationTargetKind.order, number),
  );

  /// [decision] is `approve`, `requestChanges` or `reject`.
  void listingDecided(
    P2pListingModel listing,
    String decision,
    String? reason,
  ) => send(
    listing.sellerId,
    NotificationKind.listingDecided,
    params: {'title': listing.title, 'decision': decision, 'reason': ?reason},
    target: notificationTo(NotificationTargetKind.listing, listing.id),
  );

  /// A warning, or a ban once [strikes] reach [max].
  void warned(String readerId, int strikes, int max) => strikes >= max
      ? banned(readerId)
      : send(
          readerId,
          NotificationKind.moderationWarning,
          params: {'strikes': '$strikes', 'max': '$max'},
          target: notificationTo(NotificationTargetKind.myListings),
        );

  void banned(String readerId) => send(readerId, NotificationKind.banned);

  void alertTriggered(String bookId, String title, {required bool inStock}) =>
      send(
        _me,
        NotificationKind.alertTriggered,
        params: {
          'title': title,
          'reason': inStock ? 'backInStock' : 'priceDrop',
        },
        target: notificationTo(NotificationTargetKind.book, bookId),
      );

  /// Tells each seller who has a copy that a reader asked for [title].
  void bookWanted(Iterable<String> sellerIds, String title) {
    for (final seller in sellerIds) {
      send(
        seller,
        NotificationKind.bookWanted,
        params: {'title': title},
        target: notificationTo(NotificationTargetKind.myListings),
      );
    }
  }
}

/// A target for [kind], with an [id] where the page needs one.
NotificationTargetModel notificationTo(
  NotificationTargetKind kind, [
  String id = '',
]) => NotificationTargetModel(kind: kind, id: id);
