import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/theme/app_dimens.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../domain/entities/bite_rules.dart';
import '../bite_counter.dart';
import '../book_tag_field.dart';
import 'quote_card.dart';
import 'quote_card_style.dart';
import 'quote_share.dart';

/// The quote card maker: text (300 characters), an optional Book, four
/// styles, a live preview and Share image.
class QuoteCardForm extends ConsumerStatefulWidget {
  const QuoteCardForm({super.key, this.text = '', this.book});

  final String text;
  final BiteTag? book;

  @override
  ConsumerState<QuoteCardForm> createState() => _QuoteCardFormState();
}

class _QuoteCardFormState extends ConsumerState<QuoteCardForm> {
  late final _text = TextEditingController(text: widget.text);
  late BiteTag? _book = widget.book;
  var _style = QuoteCardStyle.paper;
  final _boundary = GlobalKey();
  bool _sharing = false;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  Future<void> _share() async {
    setState(() => _sharing = true);
    await shareQuoteCard(context, ref, _boundary);
    if (mounted) setState(() => _sharing = false);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final ok = BiteRules.checkQuote(_text.text) == null && !_sharing;
    return ListView(
      padding: const EdgeInsets.all(Insets.screen),
      children: [
        RepaintBoundary(
          key: _boundary,
          child: QuoteCard(text: _text.text.trim(), style: _style, book: _book),
        ),
        const SizedBox(height: Insets.lg),
        SegmentedButton<QuoteCardStyle>(
          showSelectedIcon: false,
          segments: [
            for (final s in QuoteCardStyle.values)
              ButtonSegment(value: s, label: Text(s.label(l10n))),
          ],
          selected: {_style},
          onSelectionChanged: (s) => setState(() => _style = s.single),
        ),
        const SizedBox(height: Insets.lg),
        TextField(
          controller: _text,
          minLines: 2,
          maxLines: 5,
          onChanged: (_) => setState(() {}),
          decoration: InputDecoration(hintText: l10n.quoteHint),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: BiteCounter(text: _text.text, max: BiteRules.maxQuote),
        ),
        BookTagField(tag: _book, onChanged: (b) => setState(() => _book = b)),
        const SizedBox(height: Insets.lg),
        FilledButton.icon(
          icon: const Icon(Icons.ios_share_rounded),
          label: Text(l10n.quoteShare),
          onPressed: ok ? _share : null,
        ),
      ],
    );
  }
}
