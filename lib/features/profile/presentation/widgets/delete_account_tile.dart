import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../providers/prefs_providers.dart';
import 'confirm_dialog.dart';

/// Delete account: confirm, end it on the server, then sign out. The
/// router then leaves the signed-in-only page by itself.
class DeleteAccountTile extends ConsumerWidget {
  const DeleteAccountTile({super.key});

  Future<void> _delete(BuildContext context, WidgetRef ref) async {
    final l10n = AppL10n.of(context)!;
    final messenger = ScaffoldMessenger.of(context);
    if (!await confirmDialog(
      context,
      title: l10n.profileDeleteAccount,
      message: l10n.profileDeleteAccountMessage,
      confirm: l10n.profileDeleteConfirm,
    )) {
      return;
    }
    try {
      await ref.read(deleteAccountProvider).call(const NoParams());
      await ref.read(sessionProvider.notifier).signOut();
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.profileAccountDeleted)),
      );
    } catch (_) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.commonSomethingWentWrong)),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final error = Theme.of(context).colorScheme.error;
    return SurfaceCard(
      padding: const EdgeInsets.symmetric(horizontal: Insets.md),
      child: Material(
        color: context.palette.surface,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(Icons.delete_outline_rounded, color: error),
          title: Text(AppL10n.of(context)!.profileDeleteAccount),
          onTap: () => _delete(context, ref),
        ),
      ),
    );
  }
}
