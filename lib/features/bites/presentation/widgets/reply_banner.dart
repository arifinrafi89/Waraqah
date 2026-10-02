import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';

/// "Replying to Nabila ✕" above the comment field.
class ReplyBanner extends StatelessWidget {
  const ReplyBanner({super.key, required this.name, required this.onCancel});

  final String name;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return Row(
      children: [
        Expanded(
          child: Text(
            l10n.bitesReplyingTo(name),
            style: AppFonts.ui(size: 12, color: context.palette.textDim),
          ),
        ),
        IconButton(
          tooltip: l10n.bitesCancelReply,
          icon: const Icon(Icons.close_rounded, size: 18),
          onPressed: onCancel,
        ),
      ],
    );
  }
}
