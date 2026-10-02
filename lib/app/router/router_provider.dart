import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/domain/entities/app_user.dart';
import '../../features/auth/presentation/providers/auth_providers.dart';
import 'app_router.dart';

/// The app's single router, wired to the session: signing in or out re-runs
/// the route guards, so guarded pages open or close straight away.
final routerProvider = Provider<GoRouter>((ref) {
  final session = ValueNotifier<AppUser?>(ref.read(sessionProvider));
  // Guards only care who is signed in and their role. A rename re-running
  // them mid-navigation would undo a pop.
  ref.listen(
    sessionProvider.select((user) => (user?.id, user?.role)),
    (_, _) => session.value = ref.read(sessionProvider),
  );
  final router = AppRouter.create(session: session);
  ref.onDispose(() {
    router.dispose();
    session.dispose();
  });
  return router;
});
