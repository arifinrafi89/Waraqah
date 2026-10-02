import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_prefs.freezed.dart';

/// The kinds of notification a Reader can mute, one switch each.
/// Moderation warnings belong to none: they always arrive.
enum NotificationGroup {
  /// Orders and returns.
  orders,

  /// Listings, handled sales, Sell Back and book requests.
  usedBooks,

  /// Price and stock alerts.
  alerts,

  /// Likes, comments and follows on Bites.
  community,
}

/// The Reader's account settings, kept on the server.
@freezed
abstract class ProfilePrefs with _$ProfilePrefs {
  const factory ProfilePrefs({
    @Default(<NotificationGroup>{}) Set<NotificationGroup> muted,

    /// Whether other readers can open the Reader's page.
    @Default(true) bool profileVisible,

    /// Whether shelves and reading progress show to others.
    @Default(true) bool activityVisible,
  }) = _ProfilePrefs;
}
