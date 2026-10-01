import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../handled_sale_routes.dart';

/// "Waraqah-handled sales" row for Profile: drop in `const SalesLink()`.
/// Renders nothing for a Guest.
class SalesLink extends ConsumerWidget {
  const SalesLink({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(sessionProvider) == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: Insets.md),
      child: SecondaryButton(
        label: AppL10n.of(context)!.usedSalesTitle,
        icon: const Icon(Icons.verified_user_outlined, size: 18),
        onPressed: () => context.push(HandledSaleRoutes.sales),
      ),
    );
  }
}
