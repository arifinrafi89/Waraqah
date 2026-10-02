import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/bite_tag_providers.dart';
import '../widgets/bite_compose_skeleton.dart';
import '../widgets/quote/quote_card_form.dart';

/// `/bites/quote?text=&bookId=`: turn a quote into an image to share.
class QuoteCardPage extends ConsumerWidget {
  const QuoteCardPage({super.key, this.text = '', this.bookId});

  final String text;
  final String? bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final bookId = this.bookId;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.quoteTitle)),
      body: bookId == null
          ? QuoteCardForm(text: text)
          : AsyncView(
              value: ref.watch(tagBookProvider(bookId)),
              errorLabel: l10n.commonSomethingWentWrong,
              retryLabel: l10n.commonRetry,
              skeleton: const BiteComposeSkeleton(),
              builder: (book) => QuoteCardForm(
                text: text,
                book: book == null
                    ? null
                    : (id: book.id, title: book.title, author: book.author),
              ),
            ),
    );
  }
}
