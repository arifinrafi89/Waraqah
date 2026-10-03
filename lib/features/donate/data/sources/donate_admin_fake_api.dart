import 'package:dio/dio.dart';

import 'donate_places_store.dart';

/// Staff's fake endpoints for the verified places, merged into
/// `FakeApiInterceptor` by `app/fake_api_routes.dart`. The places
/// themselves are read from `/donate/recipients`.
abstract final class DonateAdminFakeApi {
  /// Body `{id?, name, kind, district, area, story, needs: [{bookId,
  /// wanted}]}`. Answers every place, or `null` when it breaks the rules.
  static const String save = '/admin/donate/places/save';

  /// Body `{id}`. Answers every place left, or `null` for an unknown id.
  static const String remove = '/admin/donate/places/remove';

  static Map<String, Object? Function(RequestOptions)> routes(
    DonatePlacesStore store,
  ) => {
    save: (o) => store.save(DonatePlacesStore.draftOf(_body(o)))
        ? store.allJson()
        : null,
    remove: (o) => store.remove('${_body(o)['id']}') ? store.allJson() : null,
  };

  static Map<String, dynamic> _body(RequestOptions o) =>
      o.data as Map<String, dynamic>? ?? const {};
}
