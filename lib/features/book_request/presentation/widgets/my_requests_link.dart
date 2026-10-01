import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../book_request_routes.dart';

/// "My book requests" row for Profile: drop in `const MyRequestsLink()`.
/// Renders nothing for a Guest.
class MyRequestsLink extends ConsumerWidget {
  const MyRequestsLink({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(sessionProvider) == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: Insets.md),
      child: SecondaryButton(
        label: AppL10n.of(context)!.requestMine,
        icon: const Icon(Icons.manage_search_rounded, size: 18),
        onPressed: () => context.push(BookRequestRoutes.requests),
      ),
    );
  }
}
