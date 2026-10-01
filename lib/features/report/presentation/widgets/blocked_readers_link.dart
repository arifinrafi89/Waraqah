import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../report_routes.dart';

/// "Blocked readers" row for Profile: drop in `const BlockedReadersLink()`.
/// Renders nothing for a Guest.
class BlockedReadersLink extends ConsumerWidget {
  const BlockedReadersLink({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(sessionProvider) == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: Insets.md),
      child: SecondaryButton(
        label: AppL10n.of(context)!.reportBlockedTitle,
        icon: const Icon(Icons.block_rounded, size: 18),
        onPressed: () => context.push(ReportRoutes.blocked),
      ),
    );
  }
}
