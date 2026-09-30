import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../admin_routes.dart';

/// Opens the Admin area from Profile. Renders nothing for a Guest or Reader.
class AdminAreaButton extends ConsumerWidget {
  const AdminAreaButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!ref.watch(isStaffProvider)) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: Insets.md),
      child: SecondaryButton(
        label: AppL10n.of(context)!.adminAreaTitle,
        icon: const Icon(Icons.admin_panel_settings_outlined, size: 18),
        onPressed: () => context.push(AdminRoutes.admin),
      ),
    );
  }
}
