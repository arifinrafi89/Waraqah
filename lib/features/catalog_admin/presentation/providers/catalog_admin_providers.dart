import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../data/repositories/catalog_admin_repository_impl.dart';
import '../../data/sources/catalog_admin_remote_source.dart';
import '../../domain/repositories/catalog_admin_repository.dart';

final catalogAdminRepositoryProvider = Provider<CatalogAdminRepository>(
  (ref) => CatalogAdminRepositoryImpl(
    CatalogAdminRemoteSource(ref.watch(dioProvider)),
  ),
);
