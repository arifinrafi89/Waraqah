import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../alerts/alerts_routes.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../profile_routes.dart';
import 'profile_action_tile.dart';

/// Profile's own pages: edit, saved addresses, notifications and settings.
/// Renders nothing for a Guest.
class ProfileAccountLinks extends ConsumerWidget {
  const ProfileAccountLinks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(sessionProvider) == null) return const SizedBox.shrink();
    final l10n = AppL10n.of(context)!;
    return Column(
      children: [
        ProfileActionTile(
          icon: Icons.person_outline_rounded,
          title: l10n.profileEditProfile,
          onTap: () => context.push(ProfileRoutes.edit),
        ),
        ProfileActionTile(
          icon: Icons.location_on_outlined,
          title: l10n.profileSavedAddresses,
          onTap: () => context.push(ProfileRoutes.addresses),
        ),
        ProfileActionTile(
          icon: Icons.notifications_none_rounded,
          title: l10n.profileNotificationCenter,
          onTap: () => context.push(AlertsRoutes.notifications),
        ),
        ProfileActionTile(
          icon: Icons.tune_rounded,
          title: l10n.profileSettings,
          onTap: () => context.push(ProfileRoutes.settings),
        ),
      ],
    );
  }
}
