import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/bite_tag_providers.dart';
import 'book_tag_options.dart';

/// A tagged Book: its id, title and Author (empty when unknown).
typedef BiteTag = ({String id, String title, String author});

/// "Tag a book": catalog autocomplete (top 5, title and Author). The chosen
/// Book shows as a chip the Reader can remove.
class BookTagField extends ConsumerWidget {
  const BookTagField({super.key, required this.tag, required this.onChanged});

  final BiteTag? tag;
  final ValueChanged<BiteTag?> onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    if (tag case final tag?) {
      return Align(
        alignment: Alignment.centerLeft,
        child: InputChip(
          avatar: const Icon(Icons.menu_book_rounded, size: 18),
          label: Text(tag.title, overflow: TextOverflow.ellipsis),
          deleteButtonTooltipMessage: l10n.bitesRemoveTag,
          onDeleted: () => onChanged(null),
        ),
      );
    }
    return Autocomplete<Book>(
      optionsBuilder: (value) =>
          ref.read(searchTagBooksProvider).call(value.text),
      displayStringForOption: (book) => book.title,
      onSelected: (book) =>
          onChanged((id: book.id, title: book.title, author: book.author)),
      optionsViewBuilder: (_, onSelected, books) =>
          BookTagOptions(books: books, onSelected: onSelected),
      fieldViewBuilder: (_, controller, focus, _) => TextField(
        controller: controller,
        focusNode: focus,
        decoration: InputDecoration(
          labelText: l10n.bitesTagBook,
          hintText: l10n.bitesTagHint,
          prefixIcon: const Icon(Icons.search_rounded),
        ),
      ),
    );
  }
}
