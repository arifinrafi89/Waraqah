import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../loyalty_routes.dart';

/// "Waraqah points" row for Profile: drop in `const PointsLink()`.
class PointsLink extends StatelessWidget {
  const PointsLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Insets.md),
      child: SecondaryButton(
        label: AppL10n.of(context)!.pointsTitle,
        icon: const Icon(Icons.stars_outlined, size: 18),
        onPressed: () => context.push(LoyaltyRoutes.points),
      ),
    );
  }
}
