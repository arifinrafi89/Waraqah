import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../auth/auth_routes.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../bites/presentation/providers/bite_providers.dart';
import '../../domain/entities/reader_profile.dart';
import '../providers/reader_providers.dart';

/// Follow / Following. Guests log in first.
class FollowButton extends ConsumerWidget {
  const FollowButton({super.key, required this.reader});

  final ReaderProfile reader;

  Future<void> _toggle(BuildContext context, WidgetRef ref) async {
    if (ref.read(sessionProvider) == null) {
      await context.push(AuthRoutes.login);
      return;
    }
    final messenger = ScaffoldMessenger.of(context);
    final failed = AppL10n.of(context)!.commonSomethingWentWrong;
    try {
      await ref.read(followReaderProvider).call((
        id: reader.id,
        follow: !reader.isFollowing,
      ));
      ref.invalidate(readerProvider);
      ref.invalidate(bitesProvider);
    } catch (_) {
      messenger.showSnackBar(SnackBar(content: Text(failed)));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return reader.isFollowing
        ? OutlinedButton.icon(
            icon: const Icon(Icons.check_rounded),
            label: Text(l10n.readerFollowing),
            onPressed: () => _toggle(context, ref),
          )
        : FilledButton.icon(
            icon: const Icon(Icons.person_add_alt_rounded),
            label: Text(l10n.readerFollow),
            onPressed: () => _toggle(context, ref),
          );
  }
}
