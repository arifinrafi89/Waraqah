import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../data/repositories/reader_repository_impl.dart';
import '../../data/sources/reader_remote_source.dart';
import '../../domain/entities/reader_profile.dart';
import '../../domain/repositories/reader_repository.dart';
import '../../domain/usecases/follow_reader.dart';
import '../../domain/usecases/get_reader.dart';

final readerRepositoryProvider = Provider<ReaderRepository>(
  (ref) => ReaderRepositoryImpl(ReaderRemoteSource(ref.watch(dioProvider))),
);

final followReaderProvider = Provider(
  (ref) => FollowReader(ref.watch(readerRepositoryProvider)),
);

/// A Reader's page, by id (`me` for the signed-in Reader). Reloads when
/// someone signs in or out.
final readerProvider = FutureProvider.family<ReaderProfile, String>((ref, id) {
  ref.watch(sessionProvider.select((u) => u?.id));
  return GetReader(ref.watch(readerRepositoryProvider))(id);
});
