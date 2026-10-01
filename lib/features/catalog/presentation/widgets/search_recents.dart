import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/recent_searches_provider.dart';

/// The Reader's recent searches, or the search hint when there are none.
/// Tapping an entry calls [onPick].
class SearchRecents extends ConsumerWidget {
  const SearchRecents({super.key, required this.onPick});

  final ValueChanged<String> onPick;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final recents = ref.watch(recentSearchesProvider);
    if (recents.isEmpty) {
      return Center(
        child: Text(l10n.searchHint, style: context.texts.bodyMedium),
      );
    }
    final notifier = ref.read(recentSearchesProvider.notifier);
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
      children: [
        Row(
          children: [
            Expanded(
              child: Text(l10n.searchRecent, style: context.texts.titleSmall),
            ),
            TextButton(
              onPressed: notifier.clear,
              child: Text(l10n.searchRecentClear),
            ),
          ],
        ),
        for (final query in recents)
          ListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            leading: Icon(
              Icons.history_rounded,
              size: 18,
              color: context.palette.textFaint,
            ),
            title: Text(query, style: context.texts.bodyMedium),
            trailing: IconButton(
              tooltip: l10n.searchRecentRemove(query),
              icon: const Icon(Icons.close_rounded, size: 18),
              onPressed: () => notifier.remove(query),
            ),
            onTap: () => onPick(query),
          ),
      ],
    );
  }
}
