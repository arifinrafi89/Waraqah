import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/screen_app_bar.dart';
import '../../../admin/admin_routes.dart';
import '../../../admin/domain/entities/admin_section.dart';

/// A catalog tool page's top bar: back (to Admin → Catalog when opened
/// straight from a link) and [title].
class AdminPageBar extends StatelessWidget {
  const AdminPageBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ScreenAppBar(
      leading: Row(
        spacing: Insets.md,
        children: [
          AppIconButton(
            icon: Icons.arrow_back_rounded,
            tooltip: MaterialLocalizations.of(context).backButtonTooltip,
            onPressed: () => context.canPop()
                ? context.pop()
                : context.go(AdminRoutes.section(AdminSection.catalog)),
          ),
          Flexible(child: Text(title, style: context.texts.titleLarge)),
        ],
      ),
    );
  }
}
