import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/content_report.dart';
import 'report_actions.dart';

/// Long-press [child] to report [target], e.g. someone else's message.
/// Does nothing when not [enabled] (the reader's own).
class ReportOnLongPress extends ConsumerWidget {
  const ReportOnLongPress({
    super.key,
    required this.target,
    required this.child,
    this.enabled = true,
  });

  final ReportTarget target;
  final Widget child;
  final bool enabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!enabled) return child;
    return Semantics(
      onLongPressHint: AppL10n.of(context)!.reportAction,
      child: GestureDetector(
        onLongPress: () => ref.report(context, target),
        child: child,
      ),
    );
  }
}
