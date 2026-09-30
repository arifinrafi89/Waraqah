import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../donate_routes.dart';

/// "Donate books" row for Profile: drop in `const DonateLink()`.
class DonateLink extends StatelessWidget {
  const DonateLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Insets.md),
      child: SecondaryButton(
        label: AppL10n.of(context)!.giftDonateTitle,
        icon: const Icon(Icons.volunteer_activism_outlined, size: 18),
        onPressed: () => context.push(DonateRoutes.donate),
      ),
    );
  }
}
