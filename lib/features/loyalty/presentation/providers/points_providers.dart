import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../data/repositories/points_repository_impl.dart';
import '../../data/sources/points_remote_source.dart';
import '../../domain/entities/points_account.dart';
import '../../domain/repositories/points_repository.dart';
import '../../domain/usecases/get_points.dart';

final pointsRepositoryProvider = Provider<PointsRepository>(
  (ref) => PointsRepositoryImpl(PointsRemoteSource(ref.watch(dioProvider))),
);

final getPointsProvider = Provider<GetPoints>(
  (ref) => GetPoints(ref.watch(pointsRepositoryProvider)),
);

/// The signed-in reader's points; an empty account for a guest. Refresh it
/// after an order is placed or cancelled.
final pointsProvider = FutureProvider<PointsAccount>((ref) async {
  if (ref.watch(sessionProvider) == null) return const PointsAccount();
  return ref.watch(getPointsProvider).call(const NoParams());
});
