import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:go_router/go_router.dart';

import 'package:waraqah/app/router/shell_tabs.dart';
import 'package:waraqah/features/home/home_routes.dart';
import 'package:waraqah/app/shell/app_shell.dart';
import 'package:waraqah/app/shell/glass_nav_bar.dart';
import 'package:waraqah/app/shell/glass_nav_rail.dart';
import 'package:waraqah/core/theme/app_theme.dart';
import 'package:waraqah/l10n/app_localizations.dart';

/// The real shell around stub pages, so page content cannot affect the test.
GoRouter _router() => GoRouter(
  initialLocation: HomeRoutes.home,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (_, _, shell) => AppShell(shell: shell),
      branches: [
        for (final path in ShellTabs.paths)
          StatefulShellBranch(
            routes: [GoRoute(path: path, builder: (_, _) => const SizedBox())],
          ),
      ],
    ),
  ],
);

Future<void> _pump(WidgetTester tester) async {
  tester.view.physicalSize = const Size(1400, 900);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(
    ProviderScope(
      child: MaterialApp.router(
        routerConfig: _router(),
        theme: AppTheme.light(),
        supportedLocales: AppL10n.supportedLocales,
        localizationsDelegates: AppL10n.localizationsDelegates,
      ),
    ),
  );
  await tester.pump();
}

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets(
    'android shows the bottom bar, no rail',
    variant: TargetPlatformVariant.only(TargetPlatform.android),
    (tester) async {
      await _pump(tester);
      expect(find.byType(GlassNavBar), findsOneWidget);
      expect(find.byType(GlassNavRail), findsNothing);
    },
  );

  testWidgets(
    'windows shows the rail, no bottom bar',
    variant: TargetPlatformVariant.only(TargetPlatform.windows),
    (tester) async {
      await _pump(tester);
      expect(find.byType(GlassNavRail), findsOneWidget);
      expect(find.byType(GlassNavBar), findsNothing);
    },
  );

  testWidgets(
    'hover explains a rail item',
    variant: TargetPlatformVariant.only(TargetPlatform.windows),
    (tester) async {
      await _pump(tester);
      final mouse = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await mouse.addPointer(location: Offset.zero);
      await mouse.moveTo(
        tester.getCenter(find.byIcon(Icons.menu_book_outlined)),
      );
      await tester.pump(const Duration(seconds: 2));
      expect(find.text('Catalog: browse new books'), findsOneWidget);
    },
  );
}
