import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/content_width.dart';
import '../../../../core/widgets/screen_app_bar.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../admin/admin_routes.dart';
import '../widgets/moderation_tabs.dart';

/// `/admin/moderation`: Listings to approve, Reports, Disputes and the
/// audit log, in one place with one strike system.
class ModerationCenterPage extends StatelessWidget {
  const ModerationCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final palette = context.palette;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: SafeArea(
          child: ContentWidth(
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
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
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
                    Tab(text: l10n.moderationTabLog),
                  ],
                ),
                const Expanded(child: ModerationTabs()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
