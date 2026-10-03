import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/presentation/widgets/book_picker_sheet.dart';
import '../../domain/entities/donate_place_draft.dart';
import '../providers/donate_admin_providers.dart';

/// The Books a place asks for, each with how many copies, and Add books
/// from the catalog.
class PlaceNeedsEditor extends ConsumerWidget {
  const PlaceNeedsEditor({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final needs = ref.watch(placeDraftProvider(id)).requireValue.needs;
    final notifier = ref.read(placeDraftProvider(id).notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: Insets.sm,
      children: [
        Text(l10n.adminDonateNeeds, style: context.texts.titleSmall),
        for (final need in needs) _NeedRow(id: id, need: need),
        SecondaryButton(
          label: l10n.adminDonateAddBooks,
          icon: const Icon(Icons.add_rounded, size: 18),
          onPressed: () => showBookPickerSheet(
            context,
            picked: [for (final n in needs) n.bookId],
            onPick: notifier.pick,
          ),
        ),
      ],
    );
  }
}

class _NeedRow extends ConsumerWidget {
  const _NeedRow({required this.id, required this.need});

  final String id;
  final PlaceNeedDraft need;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final notifier = ref.read(placeDraftProvider(id).notifier);
    final title = need.title.isNotEmpty
        ? need.title
        : ref.watch(placeBookProvider(need.bookId)).value?.title ?? '…';
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
              Text(l10n.adminDonateCopies(need.wanted)),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.remove_rounded),
          onPressed: need.wanted <= 1
              ? null
              : () => notifier.setCopies(need.bookId, need.wanted - 1),
        ),
        IconButton(
          icon: const Icon(Icons.add_rounded),
          onPressed: need.wanted >= PlaceRules.maxCopies
              ? null
              : () => notifier.setCopies(need.bookId, need.wanted + 1),
        ),
        IconButton(
          tooltip: l10n.adminDonateRemove,
          icon: const Icon(Icons.close_rounded),
          onPressed: () => notifier.pick(need.bookId, false),
        ),
      ],
    );
  }
}
