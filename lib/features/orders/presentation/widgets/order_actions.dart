import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/order.dart';
import '../providers/order_providers.dart';
import 'return_sheet.dart';
import 'return_status_card.dart';

/// What the reader can do now: cancel before it ships, or ask to return it
/// within 7 days of delivery. Shows how a return request is going.
class OrderActions extends ConsumerWidget {
  const OrderActions({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final request = order.returnRequest;
    final canReturn = order.canRequestReturn(DateTime.now());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: Insets.sm,
      children: [
        if (request != null) ReturnStatusCard(request: request),
        if (order.canCancel)
          SecondaryButton(
            label: l10n.orderCancel,
            icon: const Icon(Icons.close_rounded, size: 18),
            onPressed: () => _cancel(context, ref),
          ),
        if (canReturn) ...[
          SecondaryButton(
            label: l10n.orderReturn,
            icon: const Icon(Icons.assignment_return_outlined, size: 18),
            onPressed: () => _requestReturn(context, ref),
          ),
          Text(
            l10n.orderReturnWindow,
            textAlign: TextAlign.center,
            style: AppFonts.ui(size: 11, color: palette.textFaint),
          ),
        ],
      ],
    );
  }

  Future<void> _cancel(BuildContext context, WidgetRef ref) async {
    final l10n = AppL10n.of(context)!;
    final messenger = ScaffoldMessenger.of(context);
    final notifier = ref.read(orderProvider(order.number).notifier);
    final sure = await showDialog<bool>(
      context: context,
      builder: (dialog) => AlertDialog(
        title: Text(l10n.orderCancelTitle),
        content: Text(l10n.orderCancelBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialog, false),
            child: Text(l10n.orderKeep),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialog, true),
            child: Text(l10n.orderCancel),
          ),
        ],
      ),
    );
    if (sure != true) return;
    await _run(messenger, notifier.cancel, l10n.orderCancelled, l10n);
  }

  Future<void> _requestReturn(BuildContext context, WidgetRef ref) async {
    final l10n = AppL10n.of(context)!;
    final messenger = ScaffoldMessenger.of(context);
    final notifier = ref.read(orderProvider(order.number).notifier);
    final choice = await showReturnSheet(context);
    if (choice == null) return;
    final (reason, note) = choice;
    await _run(
      messenger,
      () => notifier.requestReturn(reason, note),
      l10n.orderReturnSent,
      l10n,
    );
  }

  Future<void> _run(
    ScaffoldMessengerState messenger,
    Future<void> Function() change,
    String done,
    AppL10n l10n,
  ) async {
    var message = done;
    try {
      await change();
    } catch (_) {
      message = l10n.commonSomethingWentWrong;
    }
    messenger.showSnackBar(SnackBar(content: Text(message)));
  }
}
