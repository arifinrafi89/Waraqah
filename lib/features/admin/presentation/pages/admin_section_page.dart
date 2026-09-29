import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/coming_soon_view.dart';
import '../../../../core/widgets/screen_app_bar.dart';
import '../../../../l10n/app_localizations.dart';
import '../../admin_routes.dart';
import '../../domain/entities/admin_section.dart';
import '../widgets/admin_section_labels.dart';

/// Placeholder for an Admin section that isn't built yet. Its owner replaces
/// this with the real page in [AdminRoutes].
class AdminSectionPage extends StatelessWidget {
  const AdminSectionPage(this.section, {super.key});

  final AdminSection section;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return Scaffold(
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
                      section.label(l10n),
                      style: context.texts.titleLarge,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ComingSoonView(
                icon: section.icon,
                title: l10n.comingSoonTitle,
                message: l10n.adminComingSoon,
                phaseLabel: l10n.adminAreaTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
