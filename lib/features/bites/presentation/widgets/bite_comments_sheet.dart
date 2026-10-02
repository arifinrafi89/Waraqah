import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../l10n/app_localizations.dart';

class BiteComment {
  const BiteComment({
    required this.id,
    required this.author,
    required this.text,
    this.parentId,
  });

  final String id;
  final String author;
  final String text;
  final String? parentId;
}

Future<List<BiteComment>?> showBiteComments(
  BuildContext context,
  List<BiteComment> initial,
) => showModalBottomSheet<List<BiteComment>>(
  context: context,
  isScrollControlled: true,
  builder: (_) => _CommentsSheet(initial: initial),
);

class _CommentsSheet extends StatefulWidget {
  const _CommentsSheet({required this.initial});

  final List<BiteComment> initial;

  @override
  State<_CommentsSheet> createState() => _CommentsSheetState();
}

class _CommentsSheetState extends State<_CommentsSheet> {
  late final List<BiteComment> _comments;
  final _controller = TextEditingController();
  String? _replyTo;

  @override
  void initState() {
    super.initState();
    _comments = [...widget.initial];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _addComment() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _comments.add(
        BiteComment(
          id: 'comment-${DateTime.now().microsecondsSinceEpoch}',
          author: 'You',
          text: text,
          parentId: _replyTo,
        ),
      );
      _controller.clear();
      _replyTo = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final roots = _comments.where((comment) => comment.parentId == null);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        Insets.screen,
        Insets.lg,
        Insets.screen,
        MediaQuery.viewInsetsOf(context).bottom + Insets.lg,
      ),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * .7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.bitesComments,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: Insets.md),
            Expanded(
              child: roots.isEmpty
                  ? Center(child: Text(l10n.bitesNoComments))
                  : ListView(
                      children: [
                        for (final comment in roots) ...[
                          _commentTile(comment, l10n),
                          for (final reply in _comments.where(
                            (item) => item.parentId == comment.id,
                          ))
                            Padding(
                              padding: const EdgeInsets.only(left: Insets.lg),
                              child: _commentTile(reply, l10n),
                            ),
                        ],
                      ],
                    ),
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: _replyTo == null
                    ? l10n.bitesAddComment
                    : l10n.bitesReplyTo,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send_rounded),
                  onPressed: _addComment,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _commentTile(BiteComment comment, AppL10n l10n) => ListTile(
    contentPadding: EdgeInsets.zero,
    title: Text(comment.author),
    subtitle: Text(comment.text),
    trailing: comment.parentId == null
        ? TextButton(
            onPressed: () => setState(() => _replyTo = comment.id),
            child: Text(l10n.bitesReplyTo),
          )
        : null,
  );
}
