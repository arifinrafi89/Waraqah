import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import 'report_actions.dart';

/// Takes the offer bar's place on a blocked seller's listing, and the
/// message box's place in a thread with a blocked reader.
class BlockedSellerBar extends ConsumerWidget {
  const BlockedSellerBar({
    super.key,
    required this.readerId,
    required this.name,
    this.inThread = false,
  });

  final String readerId;
  final String name;

  /// In an inbox thread: says messages are off, not offers.
  final bool inThread;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surface,
        border: Border(top: BorderSide(color: palette.border)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            Insets.screen,
            Insets.md,
            Insets.screen,
            Insets.md,
          ),
          child: Row(
            spacing: Insets.md,
            children: [
              Icon(Icons.block_rounded, color: palette.textFaint),
              Expanded(
                child: Text(
                  inThread
                      ? l10n.reportBlockedThread(name)
                      : l10n.reportBlockedNotice(name),
                  style: AppFonts.ui(size: 12.5, color: palette.textDim),
                ),
              ),
              TextButton(
                onPressed: () => ref.unblock(context, readerId, name),
                child: Text(l10n.reportUnblock),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
