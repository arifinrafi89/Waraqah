import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../auth_routes.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/tags.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/user_role.dart';
import '../providers/auth_providers.dart';

/// The signed-in account's role with a log-out button, or a log-in button
/// for a guest. Shown on the Profile tab.
class SessionActions extends ConsumerWidget {
  const SessionActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final user = ref.watch(sessionProvider);
    if (user == null) {
      return PrimaryButton(
        label: l10n.authLogIn,
        onPressed: () => context.go(AuthRoutes.login),
      );
    }
    return Row(
      spacing: Insets.md,
      children: [
        AccentTag(
          label: roleLabel(l10n, user.role),
          icon: user.role.isStaff
              ? Icons.shield_outlined
              : Icons.person_outline_rounded,
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: SecondaryButton(
              label: l10n.authLogOut,
              icon: const Icon(Icons.logout_rounded, size: 18),
              onPressed: () async {
                await ref.read(sessionProvider.notifier).signOut();
                if (context.mounted) context.go(AuthRoutes.login);
              },
            ),
          ),
        ),
      ],
    );
  }

  static String roleLabel(AppL10n l10n, UserRole role) => switch (role) {
    UserRole.reader => l10n.authRoleReader,
    UserRole.moderator => l10n.authRoleModerator,
    UserRole.catalogManager => l10n.authRoleCatalogManager,
    UserRole.support => l10n.authRoleSupport,
    UserRole.superAdmin => l10n.authRoleSuperAdmin,
  };
}
