import '../../../../core/domain/entities/user_profile.dart';

/// Immutable domain entity representing an authenticated user session.
class UserSession {
  final UserProfile user;
  final String accessToken;
  final String? refreshToken;
  final DateTime? expiresAt;

  const UserSession({
    required this.user,
    required this.accessToken,
    this.refreshToken,
    this.expiresAt,
  });

  bool get isExpired {
    if (expiresAt == null) return false;
    return DateTime.now().isAfter(expiresAt!);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserSession &&
          runtimeType == other.runtimeType &&
          user == other.user &&
          accessToken == other.accessToken;

  @override
  int get hashCode => user.hashCode ^ accessToken.hashCode;
}

