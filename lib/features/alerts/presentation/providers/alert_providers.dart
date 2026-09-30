import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../data/repositories/alert_repository_impl.dart';
import '../../data/sources/alert_remote_source.dart';
import '../../domain/entities/book_alert.dart';
import '../../domain/repositories/alert_repository.dart';
import '../../domain/usecases/get_alerts.dart';
import '../../domain/usecases/remove_alert.dart';
import '../../domain/usecases/set_alert.dart';

final alertRepositoryProvider = Provider<AlertRepository>(
  (ref) => AlertRepositoryImpl(AlertRemoteSource(ref.watch(dioProvider))),
);

final getAlertsProvider = Provider<GetAlerts>(
  (ref) => GetAlerts(ref.watch(alertRepositoryProvider)),
);

final setAlertProvider = Provider<SetAlert>(
  (ref) => SetAlert(ref.watch(alertRepositoryProvider)),
);

final removeAlertProvider = Provider<RemoveAlert>(
  (ref) => RemoveAlert(ref.watch(alertRepositoryProvider)),
);

/// The signed-in reader's alerts, fired ones first. Empty for a guest.
class AlertsNotifier extends AsyncNotifier<List<BookAlert>> {
  @override
  Future<List<BookAlert>> build() async {
    if (ref.watch(sessionProvider) == null) return const [];
    return ref.read(getAlertsProvider).call(const NoParams());
  }

  Future<void> set(AlertRequest request) async =>
      state = AsyncData(await ref.read(setAlertProvider).call(request));

  Future<void> remove(String alertId) async =>
      state = AsyncData(await ref.read(removeAlertProvider).call(alertId));
}

final alertsProvider = AsyncNotifierProvider<AlertsNotifier, List<BookAlert>>(
  AlertsNotifier.new,
);

/// The alert of one kind on one Edition, if the reader has set it.
final editionAlertProvider =
    Provider.family<BookAlert?, ({AlertKind kind, String editionId})>(
      (ref, key) => ref
          .watch(alertsProvider)
          .value
          ?.where((a) => a.kind == key.kind && a.editionId == key.editionId)
          .firstOrNull,
    );
