import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/inbox_thread.dart';
import '../providers/thread_providers.dart';
import 'offer_sheet.dart';

/// The box at the bottom of a thread. While the book is on sale and no
/// offer is waiting, the buyer also gets "Make an offer".
class Composer extends ConsumerStatefulWidget {
  const Composer({super.key, required this.thread});

  final InboxThread thread;

  @override
  ConsumerState<Composer> createState() => _ComposerState();
}

class _ComposerState extends ConsumerState<Composer> {
  final _text = TextEditingController();
  var _sending = false;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  ThreadNotifier get _thread =>
      ref.read(threadProvider(widget.thread.id).notifier);

  Future<void> _run(Future<void> Function() action, {String? done}) async {
    final messenger = ScaffoldMessenger.of(context);
    final error = AppL10n.of(context)!.commonSomethingWentWrong;
    setState(() => _sending = true);
    try {
      await action();
      if (done != null) messenger.showSnackBar(SnackBar(content: Text(done)));
    } catch (_) {
      messenger.showSnackBar(SnackBar(content: Text(error)));
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  Future<void> _send() async {
    final text = _text.text.trim();
    if (text.isEmpty) return;
    await _run(() async {
      await _thread.send(text);
      _text.clear();
    });
  }

  Future<void> _offer() async {
    final l10n = AppL10n.of(context)!;
    final listing = widget.thread.listing;
    final draft = await showOfferSheet(
      context,
      sellerName: widget.thread.otherName,
      askingBdt: listing.priceBdt,
      negotiable: listing.isNegotiable,
      preferred: listing.handover,
    );
    if (draft == null || !mounted) return;
    await _run(
      () => _thread.makeOffer(draft.amountBdt, draft.handover),
      done: l10n.offerSent(widget.thread.otherName),
    );
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surface,
        border: Border(top: BorderSide(color: palette.border)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          Insets.screen,
          Insets.sm,
          Insets.screen,
          Insets.sm,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: Insets.sm,
          children: [
            if (widget.thread.canMakeOffer)
              SecondaryButton(
                label: l10n.offerMake,
                icon: const Icon(Icons.local_offer_outlined, size: 18),
                onPressed: _sending ? null : _offer,
              ),
            AppTextField(
              hint: l10n.chatHint,
              controller: _text,
              trailing: IconButton(
                tooltip: l10n.chatSend,
                color: palette.accent,
                icon: const Icon(Icons.send_rounded),
                onPressed: _sending ? null : _send,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
