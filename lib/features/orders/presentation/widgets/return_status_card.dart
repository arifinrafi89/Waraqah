import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/order_return.dart';
import 'order_labels.dart';

/// How a return request is going, and why it was asked for.
class ReturnStatusCard extends StatelessWidget {
  const ReturnStatusCard({super.key, required this.request});

  final ReturnRequest request;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Row(
        spacing: Insets.md,
        children: [
          Icon(
            Icons.assignment_return_outlined,
            color: request.status == ReturnStatus.rejected
                ? palette.danger
                : palette.accent,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.returnStatus(request.status),
                  style: context.texts.titleSmall,
                ),
                Text(
                  l10n.returnReason(request.reason),
                  style: AppFonts.ui(size: 11.5, color: palette.textFaint),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
