import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationPreferences {
  const NotificationPreferences({
    this.push = true,
    this.orders = true,
    this.promotions = false,
  });

  final bool push;
  final bool orders;
  final bool promotions;

  NotificationPreferences copyWith({
    bool? push,
    bool? orders,
    bool? promotions,
  }) => NotificationPreferences(
    push: push ?? this.push,
    orders: orders ?? this.orders,
    promotions: promotions ?? this.promotions,
  );
}

class NotificationPreferencesNotifier
    extends Notifier<NotificationPreferences> {
  @override
  NotificationPreferences build() => const NotificationPreferences();

  void setPush(bool value) => state = state.copyWith(push: value);
  void setOrders(bool value) => state = state.copyWith(orders: value);
  void setPromotions(bool value) => state = state.copyWith(promotions: value);
}

final notificationPreferencesProvider =
    NotifierProvider<NotificationPreferencesNotifier, NotificationPreferences>(
      NotificationPreferencesNotifier.new,
    );

class PrivacyPreferences {
  const PrivacyPreferences({
    this.profileVisible = true,
    this.activityVisible = true,
  });

  final bool profileVisible;
  final bool activityVisible;

  PrivacyPreferences copyWith({bool? profileVisible, bool? activityVisible}) =>
      PrivacyPreferences(
        profileVisible: profileVisible ?? this.profileVisible,
        activityVisible: activityVisible ?? this.activityVisible,
      );
}

class PrivacyPreferencesNotifier extends Notifier<PrivacyPreferences> {
  @override
  PrivacyPreferences build() => const PrivacyPreferences();

  void setProfileVisible(bool value) =>
      state = state.copyWith(profileVisible: value);

  void setActivityVisible(bool value) =>
      state = state.copyWith(activityVisible: value);
}

final privacyPreferencesProvider =
    NotifierProvider<PrivacyPreferencesNotifier, PrivacyPreferences>(
      PrivacyPreferencesNotifier.new,
    );
