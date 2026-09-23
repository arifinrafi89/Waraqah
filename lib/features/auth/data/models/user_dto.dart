import '../../../../core/domain/entities/user_profile.dart';

/// DTO for serializing and deserializing user profile data from Supabase.
class UserDto {
  final String id;
  final String email;
  final String? fullName;
  final String? avatarUrl;
  final String? phone;
  final String role;
  final DateTime? createdAt;

  const UserDto({
    required this.id,
    required this.email,
    this.fullName,
    this.avatarUrl,
    this.phone,
    this.role = 'user',
    this.createdAt,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'] as String,
      email: json['email'] as String? ?? '',
      fullName: json['full_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      phone: json['phone'] as String?,
      role: json['role'] as String? ?? 'user',
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'full_name': fullName,
      'avatar_url': avatarUrl,
      'phone': phone,
      'role': role,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  UserProfile toDomain() {
    return UserProfile(
      id: id,
      email: email,
      fullName: fullName,
      avatarUrl: avatarUrl,
      phone: phone,
      role: role,
      createdAt: createdAt,
    );
  }

  factory UserDto.fromDomain(UserProfile profile) {
    return UserDto(
      id: profile.id,
      email: profile.email,
      fullName: profile.fullName,
      avatarUrl: profile.avatarUrl,
      phone: profile.phone,
      role: profile.role,
      createdAt: profile.createdAt,
    );
  }
}

