import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../l10n/app_localizations.dart';
import '../../bites_routes.dart';
import '../../domain/entities/bite.dart';
import '../../domain/entities/bite_rules.dart';
import 'bite_actions.dart';

enum _Choice { edit, delete, quote }

/// The ⋮ menu: Make a quote card, plus Edit and Delete on the Reader's
/// own Bites.
class BiteMenu extends ConsumerWidget {
  const BiteMenu({super.key, required this.bite});

  final Bite bite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return PopupMenuButton<_Choice>(
      tooltip: l10n.bitesMore,
      onSelected: (choice) => switch (choice) {
        _Choice.edit => context.push(BitesRoutes.composeFor(id: bite.id)),
        _Choice.delete => ref.deleteBite(context, bite),
        _Choice.quote => context.push(
          BitesRoutes.quoteFor(
            text: bite.text.characters.take(BiteRules.maxQuote).toString(),
            bookId: bite.bookId,
          ),
        ),
      },
      itemBuilder: (_) => [
        if (bite.isMine) ...[
          PopupMenuItem(value: _Choice.edit, child: Text(l10n.bitesEdit)),
          PopupMenuItem(value: _Choice.delete, child: Text(l10n.bitesDelete)),
        ],
        PopupMenuItem(value: _Choice.quote, child: Text(l10n.bitesMakeQuote)),
      ],
    );
  }
}
