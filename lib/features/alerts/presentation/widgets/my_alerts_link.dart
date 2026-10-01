import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../alerts_routes.dart';

/// "My alerts" row for Profile: drop in `const MyAlertsLink()`.
class MyAlertsLink extends StatelessWidget {
  const MyAlertsLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Insets.md),
      child: SecondaryButton(
        label: AppL10n.of(context)!.alertMine,
        icon: const Icon(Icons.notifications_none_rounded, size: 18),
        onPressed: () => context.push(AlertsRoutes.alerts),
      ),
    );
  }
}
