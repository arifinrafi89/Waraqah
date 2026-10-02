import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../auth/auth_routes.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../domain/entities/bite.dart';
import '../../domain/entities/bite_rules.dart';
import 'bite_comment_actions.dart';
import 'bite_counter.dart';
import 'reply_banner.dart';

/// The bottom bar: a 300-character comment field, "Replying to …" when
/// replying. Guests get "Log in to comment".
class BiteCommentBar extends ConsumerStatefulWidget {
  const BiteCommentBar({
    super.key,
    required this.biteId,
    required this.replyTo,
    required this.onCancelReply,
  });

  final String biteId;
  final BiteComment? replyTo;
  final VoidCallback onCancelReply;

  @override
  ConsumerState<BiteCommentBar> createState() => _BiteCommentBarState();
}

class _BiteCommentBarState extends ConsumerState<BiteCommentBar> {
  final _text = TextEditingController();
  bool _sending = false;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    setState(() => _sending = true);
    final ok = await ref.commentOnBite(
      context,
      widget.biteId,
      _text.text.trim(),
      parentId: widget.replyTo?.id,
    );
    if (!mounted) return;
    setState(() => _sending = false);
    if (!ok) return;
    _text.clear();
    widget.onCancelReply();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final guest = ref.watch(sessionProvider) == null;
    final ok = BiteRules.checkComment(_text.text) == null && !_sending;
    return Material(
      color: context.palette.surface,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(Insets.md, Insets.sm, 0, 0),
          child: guest
              ? Center(
                  child: TextButton(
                    onPressed: () => context.push(AuthRoutes.login),
                    child: Text(l10n.bitesLogInToComment),
                  ),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.replyTo case final to?)
                      ReplyBanner(
                        name: to.isMine ? l10n.bitesYou : to.authorName,
                        onCancel: widget.onCancelReply,
                      ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _text,
                            minLines: 1,
                            maxLines: 4,
                            onChanged: (_) => setState(() {}),
                            decoration: InputDecoration(
                              hintText: l10n.bitesCommentHint,
                            ),
                          ),
                        ),
                        BiteCounter(
                          text: _text.text,
                          max: BiteRules.maxComment,
                        ),
                        IconButton(
                          tooltip: l10n.bitesSend,
                          icon: const Icon(Icons.send_rounded),
                          onPressed: ok ? _send : null,
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
