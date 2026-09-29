import '../core/network/fake_api_interceptor.dart';
import '../features/catalog/data/sources/book_fake_api.dart';
import '../features/home/data/sources/ayah_fake_api.dart';

/// The composition root's route table for [FakeApiInterceptor]: one line per
/// feature. This is the only place allowed to import both `core/network` and
/// feature fake APIs — `core/` itself must never import a feature.
abstract final class FakeApiRoutes {
  static FakeApiInterceptor interceptor() =>
      FakeApiInterceptor({...BookFakeApi.routes, ...AyahFakeApi.routes});
}
