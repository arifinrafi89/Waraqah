import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_icon_button.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/content_report.dart';
import '../providers/report_providers.dart';
import 'report_actions.dart';
import 'report_labels.dart';

/// The "⋮" menu for a page about someone else's content: report it, and
/// block or unblock the reader behind it when [readerId] is given.
class ReportMenuButton extends ConsumerWidget {
  const ReportMenuButton({
    super.key,
    required this.target,
    this.readerId,
    this.readerName,
  });

  final ReportTarget target;
  final String? readerId;
  final String? readerName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final id = readerId;
    final name = readerName ?? '';
    final blocked = id != null && ref.watch(isBlockedProvider(id));
    return PopupMenuButton<VoidCallback>(
      tooltip: l10n.reportMoreOptions,
      onSelected: (action) => action(),
      itemBuilder: (_) => [
        PopupMenuItem(
          value: () => ref.report(context, target),
          child: _Item(Icons.flag_outlined, l10n.reportTitle(target.kind)),
        ),
        if (id != null)
          PopupMenuItem(
            value: () => blocked
                ? ref.unblock(context, id, name)
                : ref.block(context, id, name),
            child: _Item(
              blocked ? Icons.lock_open_rounded : Icons.block_rounded,
              blocked
                  ? l10n.reportUnblockUser(name)
                  : l10n.reportBlockUser(name),
            ),
          ),
      ],
      child: const AppIconButton(icon: Icons.more_vert_rounded),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(this.icon, this.label);

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) => Row(
    spacing: 12,
    children: [
      Icon(icon, size: 20),
      Flexible(child: Text(label)),
    ],
  );
}
