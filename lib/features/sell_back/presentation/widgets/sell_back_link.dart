import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../sell_back_routes.dart';

/// "Sell Back to Waraqah" row for Profile: drop in `const SellBackLink()`.
/// Renders nothing for a Guest.
class SellBackLink extends ConsumerWidget {
  const SellBackLink({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(sessionProvider) == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: Insets.md),
      child: SecondaryButton(
        label: AppL10n.of(context)!.sellBackTitle,
        icon: const Icon(Icons.swap_horiz_rounded, size: 18),
        onPressed: () => context.push(SellBackRoutes.sellBack),
      ),
    );
  }
}
