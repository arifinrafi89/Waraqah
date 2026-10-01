import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/content_width.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/book_request.dart';
import '../../domain/entities/request_rules.dart';
import '../widgets/request_actions.dart';
import '../widgets/request_app_bar.dart';
import '../widgets/request_form.dart';

/// `/request-book`: "Looking for Calculus by Stewart under ৳900". Search
/// and the scanner fill in what the reader looked for.
class NewRequestPage extends ConsumerStatefulWidget {
  const NewRequestPage({super.key, this.title = '', this.bookId});

  final String title;
  final String? bookId;

  @override
  ConsumerState<NewRequestPage> createState() => _NewRequestPageState();
}

class _NewRequestPageState extends ConsumerState<NewRequestPage> {
  late final _title = TextEditingController(text: widget.title);
  final _author = TextEditingController();
  final _maxPrice = TextEditingController();
  final _note = TextEditingController();
  bool _sending = false;

  @override
  void dispose() {
    for (final c in [_title, _author, _maxPrice, _note]) {
      c.dispose();
    }
    super.dispose();
  }

  BookRequestDraft get _draft => BookRequestDraft(
    // A different title is a different book.
    title: _title.text,
    bookId: _title.text == widget.title ? widget.bookId : null,
    author: _author.text,
    maxPriceBdt: int.tryParse(_maxPrice.text.trim()),
    note: _note.text,
  );

  Future<void> _send() async {
    setState(() => _sending = true);
    await ref.sendRequest(context, _draft);
    if (mounted) setState(() => _sending = false);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final badPrice =
        _maxPrice.text.trim().isNotEmpty &&
        int.tryParse(_maxPrice.text.trim()) == null;
    final problem = badPrice
        ? RequestProblem.badPrice
        : RequestRules.check(_draft);
    return Scaffold(
      body: SafeArea(
        child: ContentWidth(
          child: Column(
            children: [
              RequestAppBar(title: l10n.requestTitle),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(
                    Insets.screen,
                    0,
                    Insets.screen,
                    Insets.xl,
                  ),
                  children: [
                    Text(
                      l10n.requestIntro,
                      style: AppFonts.ui(
                        size: 12.5,
                        color: context.palette.textDim,
                      ),
                    ),
                    const SizedBox(height: Insets.lg),
                    RequestForm(
                      title: _title,
                      author: _author,
                      maxPrice: _maxPrice,
                      note: _note,
                      problem: problem,
                      onChanged: (_) => setState(() {}),
                    ),
                    const SizedBox(height: Insets.lg),
                    PrimaryButton(
                      label: l10n.requestSend,
                      icon: Icons.send_rounded,
                      isBusy: _sending,
                      onPressed: problem == null ? _send : null,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
