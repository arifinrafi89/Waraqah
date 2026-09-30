import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/models/book.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../l10n/app_localizations.dart';

/// Copies the book's title, author and From-price so the reader can paste
/// them into any chat. A native share sheet would need a new package, so
/// this sticks to the clipboard for now.
class ShareBookButton extends StatelessWidget {
  const ShareBookButton({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return AppIconButton(
      icon: Icons.ios_share_rounded,
      tooltip: l10n.bookShare,
      onPressed: () async {
        await Clipboard.setData(ClipboardData(text: shareText(book)));
        if (!context.mounted) return;
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(l10n.bookCopied)));
      },
    );
  }

  static String shareText(Book book) =>
      '${book.title} — ${book.author}\n'
      '${Bdt.format(book.fromPriceBdt)} · Waraqah';
}
