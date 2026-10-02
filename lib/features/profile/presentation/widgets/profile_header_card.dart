import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../readers/presentation/providers/reader_providers.dart';
import '../../../readers/readers_routes.dart';
import '../../profile_routes.dart';
import '../providers/profile_providers.dart';
import 'profile_header.dart';

/// [ProfileHeader] for whoever is using the app: the session's name and
/// email (or phone), the saved photo, and an edit button for a Reader.
class ProfileHeaderCard extends ConsumerWidget {
  const ProfileHeaderCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final user = ref.watch(sessionProvider);
    final profile = ref.watch(profileProvider).value;
    final page = user == null ? null : ref.watch(readerProvider('me')).value;
    return ProfileHeader(
      name: user?.name ?? l10n.authGuestName,
      contact: user?.email ?? l10n.authGuestNote,
      photo: profile?.photo,
      onEdit: user == null ? null : () => context.push(ProfileRoutes.edit),
      onOpen: user == null
          ? null
          : () => context.push(ReadersRoutes.readerFor('me')),
      // ponytail: Books read stays a placeholder until shelves (Plan C).
      stats: {
        l10n.profileBooksRead: '14',
        l10n.profileBitesPosted: '${page?.biteCount ?? '–'}',
        l10n.profileListings: '${page?.liveListingCount ?? '–'}',
      },
    );
  }
}
