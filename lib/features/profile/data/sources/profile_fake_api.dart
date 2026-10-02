import 'package:dio/dio.dart';

import '../models/profile_details_model.dart';
import '../models/profile_prefs_model.dart';
import '../models/saved_address_model.dart';
import 'address_fake_store.dart';
import 'geo/bd_geo.dart';
import 'profile_fake_store.dart';

/// Profile's fake endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`. Changes answer `null` when refused.
abstract final class ProfileFakeApi {
  /// `{name, phone, photo?}`; the name is empty until first saved.
  static const String profile = '/profile';

  /// Body `{name, phone, photo?}`: answers the saved profile.
  static const String saveProfile = '/profile/save';

  /// The saved addresses, default first.
  static const String addresses = '/addresses';

  /// Body: an address; no `id` adds it. Answers the addresses.
  static const String saveAddress = '/addresses/save';

  /// Body `{id}`: answers the addresses.
  static const String deleteAddress = '/addresses/delete';

  /// Body `{id}`: answers the addresses.
  static const String defaultAddress = '/addresses/default';

  /// Every division, its districts and their upazilas.
  static const String geo = '/geo';

  /// `{muted: [group…], profileVisible, activityVisible}`.
  static const String prefs = '/profile/prefs';

  /// Body: the settings. Answers them saved.
  static const String savePrefs = '/profile/prefs/save';

  /// Ends the account. Under `/auth` on the real server; answered here
  /// because Profile's Settings asks for it.
  static const String deleteAccount = '/auth/delete';

  static Map<String, Object? Function(RequestOptions)> routes(
    ProfileFakeStore store,
    AddressFakeStore addresses,
  ) => {
    profile: (_) => store.details.toJson(),
    saveProfile: (o) =>
        store.save(ProfileDetailsModel.fromJson(_body(o)))?.toJson(),
    ProfileFakeApi.addresses: (_) => addresses.json(),
    saveAddress: (o) => addresses.save(SavedAddressModel.fromJson(_body(o)))
        ? addresses.json()
        : null,
    deleteAddress: (o) => addresses.delete(_id(o)) ? addresses.json() : null,
    defaultAddress: (o) =>
        addresses.makeDefault(_id(o)) ? addresses.json() : null,
    geo: (_) => BdGeo.toJson(),
    prefs: (_) => store.prefs.toJson(),
    savePrefs: (o) =>
        (store.prefs = ProfilePrefsModel.fromJson(_body(o))).toJson(),
    // ponytail: one shared "me", so nothing is wiped; the app signs out.
    deleteAccount: (_) => {'ok': true},
  };

  static Map<String, dynamic> _body(RequestOptions options) =>
      options.data as Map<String, dynamic>? ?? const {};

  static String _id(RequestOptions options) =>
      _body(options)['id'] as String? ?? '';
}
