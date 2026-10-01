import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/content_report.dart';
import 'report_actions.dart';

/// A small flag that reports [target]: for Bites, comments and reviews.
class ReportIconButton extends ConsumerWidget {
  const ReportIconButton({super.key, required this.target});

  final ReportTarget target;

  @override
  Widget build(BuildContext context, WidgetRef ref) => IconButton(
    tooltip: AppL10n.of(context)!.reportAction,
    visualDensity: VisualDensity.compact,
    iconSize: 18,
    color: context.palette.textFaint,
    icon: const Icon(Icons.flag_outlined),
    onPressed: () => ref.report(context, target),
  );
}
