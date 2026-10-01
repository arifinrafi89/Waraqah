import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../p2p/presentation/providers/p2p_providers.dart';
import '../../domain/entities/inbox_thread.dart';
import '../providers/thread_providers.dart';

/// "How was the deal with Talha?" Tap a star, add a few words if you like,
/// and send. Sent once; it shows on their seller page.
class RatingForm extends ConsumerStatefulWidget {
  const RatingForm({super.key, required this.thread});

  final InboxThread thread;

  @override
  ConsumerState<RatingForm> createState() => _RatingFormState();
}

class _RatingFormState extends ConsumerState<RatingForm> {
  final _comment = TextEditingController();
  var _stars = 0;
  var _sending = false;

  @override
  void dispose() {
    _comment.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    final messenger = ScaffoldMessenger.of(context);
    final l10n = AppL10n.of(context)!;
    final thread = widget.thread;
    setState(() => _sending = true);
    try {
      await ref
          .read(threadProvider(thread.id).notifier)
          .rate(_stars, _comment.text);
      ref.invalidate(sellerProvider(thread.otherId));
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.chatRated(thread.otherName))),
      );
    } catch (_) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.commonSomethingWentWrong)),
      );
      if (mounted) setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: Insets.sm,
      children: [
        Text(
          l10n.chatRateTitle(widget.thread.otherName),
          style: context.texts.titleSmall,
        ),
        Row(
          children: [
            for (var i = 1; i <= 5; i++)
              IconButton(
                tooltip: l10n.chatRateStars(i),
                visualDensity: VisualDensity.compact,
                color: palette.accent,
                icon: Icon(
                  i <= _stars ? Icons.star_rounded : Icons.star_outline_rounded,
                ),
                onPressed: () => setState(() => _stars = i),
              ),
          ],
        ),
        if (_stars > 0) ...[
          AppTextField(hint: l10n.chatRateHint, controller: _comment),
          PrimaryButton(
            label: l10n.chatRateSend,
            isBusy: _sending,
            onPressed: _sending ? null : _send,
          ),
        ],
      ],
    );
  }
}
