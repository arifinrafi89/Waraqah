import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/book_question.dart';

/// A sheet for writing a question or an answer. It stays open until
/// [onPost] succeeds, showing why the text doesn't fit if it doesn't.
/// Answers `true` once posted.
Future<bool?> showPostSheet(
  BuildContext context, {
  required String title,
  required String hint,
  required int maxLength,
  required Future<void> Function(String text) onPost,
}) => showModalBottomSheet<bool>(
  context: context,
  isScrollControlled: true,
  showDragHandle: true,
  builder: (_) =>
      _PostForm(title: title, hint: hint, maxLength: maxLength, onPost: onPost),
);

class _PostForm extends StatefulWidget {
  const _PostForm({
    required this.title,
    required this.hint,
    required this.maxLength,
    required this.onPost,
  });

  final String title;
  final String hint;
  final int maxLength;
  final Future<void> Function(String text) onPost;

  @override
  State<_PostForm> createState() => _PostFormState();
}

class _PostFormState extends State<_PostForm> {
  final _text = TextEditingController();
  String? _error;
  var _busy = false;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        Insets.screen,
        0,
        Insets.screen,
        Insets.xl + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: Insets.md,
        children: [
          Text(widget.title, style: context.texts.titleMedium),
          TextField(
            controller: _text,
            autofocus: true,
            maxLines: 4,
            maxLength: widget.maxLength,
            decoration: InputDecoration(
              hintText: widget.hint,
              border: const OutlineInputBorder(),
            ),
          ),
          if (_error != null)
            Text(
              _error!,
              style: AppFonts.ui(size: 12, color: context.palette.danger),
            ),
          PrimaryButton(label: l10n.bookPost, isBusy: _busy, onPressed: _post),
        ],
      ),
    );
  }

  Future<void> _post() async {
    final l10n = AppL10n.of(context)!;
    setState(() => _busy = true);
    try {
      await widget.onPost(_text.text);
      if (mounted) Navigator.pop(context, true);
    } catch (e) {
      setState(
        () => _error = switch (e) {
          PostRejected(problem: PostProblem.tooShort) => l10n.bookPostTooShort,
          PostRejected(problem: PostProblem.tooLong) => l10n.bookPostTooLong,
          _ => l10n.commonSomethingWentWrong,
        },
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }
}
