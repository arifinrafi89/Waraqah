import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../providers/profile_providers.dart';
import '../widgets/edit_profile_form.dart';
import '../widgets/edit_profile_skeleton.dart';
import '../widgets/profile_page_scaffold.dart';

/// `/profile/edit`: name, phone and photo. Signed-in only.
class EditProfilePage extends ConsumerWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final sessionName = ref.watch(sessionProvider)?.name ?? '';
    return ProfilePageScaffold(
      title: l10n.profileEditProfile,
      body: AsyncView(
        value: ref.watch(profileProvider),
        errorLabel: l10n.commonSomethingWentWrong,
        retryLabel: l10n.commonRetry,
        onRetry: () => ref.invalidate(profileProvider),
        skeleton: const EditProfileSkeleton(),
        // A name never saved on the server starts from the session's.
        builder: (details) => EditProfileForm(
          initial: details.name.isEmpty
              ? details.copyWith(name: sessionName)
              : details,
        ),
      ),
    );
  }
}
