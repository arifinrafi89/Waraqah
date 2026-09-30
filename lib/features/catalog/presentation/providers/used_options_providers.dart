import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../data/repositories/used_options_repository_impl.dart';
import '../../data/sources/used_options_source.dart';
import '../../domain/entities/used_options.dart';
import '../../domain/repositories/used_options_repository.dart';
import '../../domain/usecases/get_used_options.dart';

final usedOptionsRepositoryProvider = Provider<UsedOptionsRepository>(
  (ref) => UsedOptionsRepositoryImpl(UsedOptionsSource(ref.watch(dioProvider))),
);

final getUsedOptionsProvider = Provider<GetUsedOptions>(
  (ref) => GetUsedOptions(ref.watch(usedOptionsRepositoryProvider)),
);

/// Used copies of one book, by book id.
final usedOptionsProvider = FutureProvider.family<UsedOptions, String>(
  (ref, bookId) => ref.watch(getUsedOptionsProvider).call(bookId),
);
