import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/press_scale.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../admin_routes.dart';
import '../../domain/entities/admin_section.dart';
import 'admin_section_labels.dart';

/// One hub menu entry: icon, name and hint. Opens the section's page.
class AdminSectionTile extends StatelessWidget {
  const AdminSectionTile(this.section, {super.key});

  final AdminSection section;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final palette = context.palette;
    return PressScale(
      child: SurfaceCard(
        clip: true,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => context.push(AdminRoutes.section(section)),
            child: Padding(
              padding: const EdgeInsets.all(Insets.lg),
              child: Row(
                spacing: Insets.md,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: palette.accentSoft,
                      borderRadius: BorderRadius.circular(Radii.md),
                    ),
                    child: Icon(section.icon, color: palette.accent, size: 22),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 2,
                      children: [
                        Text(
                          section.label(l10n),
                          style: context.texts.titleSmall,
                        ),
                        Text(
                          section.hint(l10n),
                          style: AppFonts.ui(
                            size: 11.5,
                            color: palette.textDim,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.chevron_right_rounded, color: palette.textFaint),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
