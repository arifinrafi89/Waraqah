import 'package:dio/dio.dart';

import '../models/profile_details_model.dart';
import 'profile_fake_store.dart';

/// Profile's fake endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`. Changes answer `null` when refused.
abstract final class ProfileFakeApi {
  /// `{name, phone, photo?}`; the name is empty until first saved.
  static const String profile = '/profile';

  /// Body `{name, phone, photo?}`: answers the saved profile.
  static const String saveProfile = '/profile/save';

  static Map<String, Object? Function(RequestOptions)> routes(
    ProfileFakeStore store,
  ) => {
    profile: (_) => store.details.toJson(),
    saveProfile: (o) =>
        store.save(ProfileDetailsModel.fromJson(_body(o)))?.toJson(),
  };

  static Map<String, dynamic> _body(RequestOptions options) =>
      options.data as Map<String, dynamic>? ?? const {};
}
