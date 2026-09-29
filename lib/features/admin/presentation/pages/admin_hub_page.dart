import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/content_width.dart';
import '../../../../core/widgets/screen_app_bar.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../auth/presentation/widgets/session_actions.dart';
import '../../../profile/profile_routes.dart';
import '../../domain/entities/admin_section.dart';
import '../widgets/admin_section_tile.dart';

/// The Admin area's home: the viewer's Role and the sections it may open.
class AdminHubPage extends ConsumerWidget {
  const AdminHubPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    // Null only for the moment between signing out and the guard leaving.
    final role = ref.watch(sessionProvider)?.role;
    return Scaffold(
      body: SafeArea(
        child: ContentWidth(
          child: Column(
            children: [
              ScreenAppBar(
                title: l10n.adminAreaTitle,
                subtitle: role == null
                    ? null
                    : SessionActions.roleLabel(l10n, role),
                actions: [
                  AppIconButton(
                    icon: Icons.close_rounded,
                    tooltip: MaterialLocalizations.of(context)
                        .closeButtonTooltip,
                    onPressed: () => context.canPop()
                        ? context.pop()
                        : context.go(ProfileRoutes.profile),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(
                    Insets.screen,
                    0,
                    Insets.screen,
                    Insets.xl,
                  ),
                  children: [
                    for (final section in AdminSection.values)
                      if (role != null && section.canOpen(role))
                        Padding(
                          padding: const EdgeInsets.only(bottom: Insets.md),
                          child: AdminSectionTile(section),
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
