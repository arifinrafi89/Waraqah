import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../l10n/app_localizations.dart';
import 'bite_draft.dart';

Future<BiteDraft?> showBiteComposer(
  BuildContext context, {
  BiteDraft? initial,
}) => showModalBottomSheet<BiteDraft>(
  context: context,
  isScrollControlled: true,
  builder: (_) => _BiteComposer(initial: initial),
);

class _BiteComposer extends StatefulWidget {
  const _BiteComposer({this.initial});

  final BiteDraft? initial;

  @override
  State<_BiteComposer> createState() => _BiteComposerState();
}

class _BiteComposerState extends State<_BiteComposer> {
  late final TextEditingController _text;
  late final TextEditingController _bookSearch;
  BiteBookOption? _book;
  bool _spoiler = false;
  bool _showSuggestions = false;

  @override
  void initState() {
    super.initState();
    _text = TextEditingController(text: widget.initial?.text);
    _bookSearch = TextEditingController(text: widget.initial?.book?.title);
    _book = widget.initial?.book;
    _spoiler = widget.initial?.isSpoiler ?? false;
  }

  @override
  void dispose() {
    _text.dispose();
    _bookSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final suggestions = biteBookOptions
        .where(
          (book) =>
              book.title.toLowerCase().contains(_bookSearch.text.toLowerCase()),
        )
        .toList();
    return Padding(
      padding: EdgeInsets.fromLTRB(
        Insets.screen,
        Insets.lg,
        Insets.screen,
        MediaQuery.viewInsetsOf(context).bottom +
            MediaQuery.viewPaddingOf(context).bottom +
            Sizes.navClearance,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: Insets.md,
          children: [
            TextField(
              controller: _text,
              autofocus: true,
              maxLines: 5,
              maxLength: 500,
              decoration: InputDecoration(
                hintText: l10n.bitesComposerHint,
                helperText: l10n.bitesMaxChars,
              ),
            ),
            TextField(
              controller: _bookSearch,
              onChanged: (_) => setState(() {
                _showSuggestions = true;
                _book = null;
                _spoiler = false;
              }),
              decoration: InputDecoration(
                labelText: l10n.bitesTagBook,
                hintText: l10n.bitesSearchBooks,
                prefixIcon: const Icon(Icons.menu_book_outlined),
                suffixIcon: _book == null
                    ? null
                    : const Icon(Icons.check_circle_outline_rounded),
              ),
            ),
            if (_showSuggestions && _bookSearch.text.isNotEmpty) ...[
              for (final book in suggestions)
                ListTile(
                  dense: true,
                  title: Text(book.title),
                  onTap: () => setState(() {
                    _book = book;
                    _bookSearch.text = book.title;
                    _showSuggestions = false;
                  }),
                ),
            ],
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              value: _spoiler,
              title: Text(l10n.bitesSpoiler),
              subtitle: Text(l10n.bitesSpoilerHint),
              onChanged: _book == null
                  ? null
                  : (value) => setState(() => _spoiler = value ?? false),
            ),
            FilledButton(
              onPressed: _text.text.trim().isEmpty || _text.text.length > 500
                  ? null
                  : () => Navigator.pop(
                      context,
                      BiteDraft(
                        text: _text.text.trim(),
                        book: _book,
                        isSpoiler: _spoiler,
                      ),
                    ),
              child: Text(
                widget.initial == null ? l10n.bitesPost : l10n.bitesEdit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
