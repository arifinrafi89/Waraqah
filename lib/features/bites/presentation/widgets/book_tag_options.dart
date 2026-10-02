import 'package:flutter/material.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';

/// The autocomplete's dropdown: each Book's title and Author.
class BookTagOptions extends StatelessWidget {
  const BookTagOptions({
    super.key,
    required this.books,
    required this.onSelected,
  });

  final Iterable<Book> books;
  final ValueChanged<Book> onSelected;

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.topLeft,
    child: Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(Radii.md),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 300, maxWidth: 420),
        child: ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: [
            for (final book in books)
              ListTile(
                title: Text(book.title, maxLines: 1),
                subtitle: Text(book.author, maxLines: 1),
                onTap: () => onSelected(book),
              ),
          ],
        ),
      ),
    ),
  );
}
