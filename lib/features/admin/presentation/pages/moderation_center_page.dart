import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/screen_app_bar.dart';
import '../../../../l10n/app_localizations.dart';
import '../../admin_routes.dart';

/// The Moderation Center shell with tabs for Listings, Reports, and Disputes.
class ModerationCenterPage extends StatelessWidget {
  const ModerationCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final palette = context.palette;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              ScreenAppBar(
                leading: Row(
                  spacing: Insets.md,
                  children: [
                    AppIconButton(
                      icon: Icons.arrow_back_rounded,
                      tooltip: MaterialLocalizations.of(context)
                          .backButtonTooltip,
                      onPressed: () => context.canPop()
                          ? context.pop()
                          : context.go(AdminRoutes.admin),
                    ),
                    Flexible(
                      child: Text(
                        l10n.moderationCenterTitle,
                        style: context.texts.titleLarge,
                      ),
                    ),
                  ],
                ),
              ),
              TabBar(
                labelColor: palette.text,
                unselectedLabelColor: palette.textFaint,
                indicatorColor: palette.accent,
                dividerColor: palette.border,
                labelStyle: context.texts.titleSmall,
                unselectedLabelStyle: context.texts.titleSmall,
                tabs: [
                  Tab(text: l10n.moderationTabListings),
                  Tab(text: l10n.moderationTabReports),
                  Tab(text: l10n.moderationTabDisputes),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _EmptyTab(message: l10n.moderationEmptyListings),
                    _EmptyTab(message: l10n.moderationEmptyReports),
                    _EmptyTab(message: l10n.moderationEmptyDisputes),
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

class _EmptyTab extends StatelessWidget {
  const _EmptyTab({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Insets.xl),
        child: Text(
          message,
          style: context.texts.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
