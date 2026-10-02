import 'package:dio/dio.dart';

import '../models/profile_details_model.dart';
import '../models/profile_prefs_model.dart';
import 'profile_fake_api.dart';

/// Talks to Profile's endpoints, answered for now by the fake API. A refused
/// change (`null`) is an error, shown by the page.
class ProfileRemoteSource {
  ProfileRemoteSource(this._dio);

  final Dio _dio;

  Future<ProfileDetailsModel> profile() async => ProfileDetailsModel.fromJson(
    _refused(
      (await _dio.get<Map<String, dynamic>>(ProfileFakeApi.profile)).data,
    ),
  );

  Future<ProfileDetailsModel> saveProfile(ProfileDetailsModel details) async =>
      ProfileDetailsModel.fromJson(
        _refused(
          (await _dio.post<Map<String, dynamic>>(
            ProfileFakeApi.saveProfile,
            data: details.toJson(),
          )).data,
        ),
      );

  Future<ProfilePrefsModel> prefs() async => ProfilePrefsModel.fromJson(
    _refused((await _dio.get<Map<String, dynamic>>(ProfileFakeApi.prefs)).data),
  );

  Future<ProfilePrefsModel> savePrefs(ProfilePrefsModel prefs) async =>
      ProfilePrefsModel.fromJson(
        _refused(
          (await _dio.post<Map<String, dynamic>>(
            ProfileFakeApi.savePrefs,
            data: prefs.toJson(),
          )).data,
        ),
      );

  Future<void> deleteAccount() async {
    final response = await _dio.post<Map<String, dynamic>>(
      ProfileFakeApi.deleteAccount,
    );
    _refused(response.data);
  }

  static T _refused<T>(T? data) =>
      data ?? (throw StateError('The server refused the change.'));
}
