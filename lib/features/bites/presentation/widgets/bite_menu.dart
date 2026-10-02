import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../l10n/app_localizations.dart';
import '../../bites_routes.dart';
import '../../domain/entities/bite.dart';
import 'bite_actions.dart';

enum _Choice { edit, delete }

/// The ⋮ menu: Edit and Delete on the Reader's own Bites.
class BiteMenu extends ConsumerWidget {
  const BiteMenu({super.key, required this.bite});

  final Bite bite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    if (!bite.isMine) return const SizedBox(height: 48);
    return PopupMenuButton<_Choice>(
      tooltip: l10n.bitesMore,
      onSelected: (choice) => switch (choice) {
        _Choice.edit => context.push(BitesRoutes.composeFor(id: bite.id)),
        _Choice.delete => ref.deleteBite(context, bite),
      },
      itemBuilder: (_) => [
        PopupMenuItem(value: _Choice.edit, child: Text(l10n.bitesEdit)),
        PopupMenuItem(value: _Choice.delete, child: Text(l10n.bitesDelete)),
      ],
    );
  }
}
