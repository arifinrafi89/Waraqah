import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../inbox/presentation/widgets/inbox_actions.dart';
import '../../domain/entities/p2p_listing.dart';

/// "Message" on a marketplace tile: opens the conversation with the seller
/// (guests log in first). On the reader's own listing it just says so.
class P2pMarketplaceMessageButton extends ConsumerWidget {
  const P2pMarketplaceMessageButton({super.key, required this.listing});

  final P2pListing listing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final mine = listing.isMine;
    return TextButton.icon(
      onPressed: mine ? null : () => ref.openChat(context, listing),
      style: TextButton.styleFrom(
        backgroundColor: palette.accentSoft,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        foregroundColor: palette.accent,
        disabledForegroundColor: palette.textDim,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      icon: Icon(
        mine ? Icons.storefront_outlined : Icons.message_outlined,
        size: 16,
      ),
      label: Text(mine ? l10n.usedYourListing : l10n.usedMessage),
    );
  }
}
