import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../shelves_routes.dart';

/// Profile's way to the shelves. Nothing for a Guest.
class ShelvesLink extends ConsumerWidget {
  const ShelvesLink({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(sessionProvider) == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: Insets.md),
      child: SecondaryButton(
        label: AppL10n.of(context)!.shelfProfileLink,
        icon: const Icon(Icons.shelves, size: 18),
        onPressed: () => context.push(ShelvesRoutes.shelves),
      ),
    );
  }
}
