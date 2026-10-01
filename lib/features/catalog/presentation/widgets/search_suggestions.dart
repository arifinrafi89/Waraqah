import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../providers/search_providers.dart';

/// A scrolling row of titles and Author names for the typed query. Tapping
/// one calls [onPick]. Shows nothing while loading, on error, with no
/// suggestions, or when the only one is what was typed.
class SearchSuggestions extends ConsumerWidget {
  const SearchSuggestions({super.key, required this.onPick});

  final ValueChanged<String> onPick;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(searchQueryProvider).trim().toLowerCase();
    final suggestions = ref.watch(searchSuggestionsProvider).value ?? const [];
    if (suggestions.isEmpty ||
        (suggestions.length == 1 && suggestions.first.toLowerCase() == query)) {
      return const SizedBox();
    }
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
        itemCount: suggestions.length,
        separatorBuilder: (_, _) => const SizedBox(width: Insets.sm),
        itemBuilder: (_, i) => ActionChip(
          avatar: const Icon(Icons.search_rounded, size: 16),
          label: Text(suggestions[i]),
          onPressed: () => onPick(suggestions[i]),
        ),
      ),
    );
  }
}
