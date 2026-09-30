import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/order.dart';
import '../providers/order_admin_providers.dart';
import 'order_labels.dart';

/// A waiting return for staff: the order, the reason and the reader's note,
/// with Reject and Approve.
class AdminReturnTile extends ConsumerWidget {
  const AdminReturnTile({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final request = order.returnRequest!;
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          Text(
            order.number,
            style: AppFonts.numeric(size: 14, color: palette.text),
          ),
          Text(
            l10n.returnReason(request.reason),
            style: context.texts.titleSmall,
          ),
          if (request.note.isNotEmpty)
            Text(
              '"${request.note}"',
              style: AppFonts.ui(size: 12, color: palette.textDim),
            ),
          const SizedBox(height: Insets.sm),
          Row(
            spacing: Insets.sm,
            children: [
              Expanded(
                child: SecondaryButton(
                  label: l10n.adminOrderReject,
                  onPressed: () => _decide(context, ref, approve: false),
                ),
              ),
              Expanded(
                child: PrimaryButton(
                  label: l10n.adminOrderApprove,
                  onPressed: () => _decide(context, ref, approve: true),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _decide(
    BuildContext context,
    WidgetRef ref, {
    required bool approve,
  }) async {
    final l10n = AppL10n.of(context)!;
    final messenger = ScaffoldMessenger.of(context);
    var message = approve
        ? l10n.adminOrderReturnApproved
        : l10n.adminOrderReturnRejected;
    try {
      await ref
          .read(allOrdersProvider.notifier)
          .decideReturn(order, approve: approve);
    } catch (_) {
      message = l10n.commonSomethingWentWrong;
    }
    messenger.showSnackBar(SnackBar(content: Text(message)));
  }
}
