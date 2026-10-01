import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/expert.dart';

/// [text] (an Expert's name, or "by" and their name) with a verified tick
/// after it, then [after] when given. Wraps as one line of text.
class ExpertBadge extends StatelessWidget {
  const ExpertBadge({
    super.key,
    required this.expert,
    required this.text,
    this.after,
    this.style,
    this.maxLines,
  });

  final Expert expert;
  final String text;
  final String? after;
  final TextStyle? style;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final size = (style?.fontSize ?? 13) + 2;
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: text),
          if (expert.verified)
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Icon(
                  Icons.verified_rounded,
                  size: size,
                  color: context.palette.accent,
                  semanticLabel: AppL10n.of(context)!.expertVerified,
                ),
              ),
            ),
          if (after != null) TextSpan(text: ' · $after'),
        ],
      ),
      style: style,
      maxLines: maxLines,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
    );
  }
}

extension ExpertKindLabel on ExpertKind {
  String label(AppL10n l10n) => switch (this) {
    ExpertKind.teacher => l10n.expertKindTeacher,
    ExpertKind.scholar => l10n.expertKindScholar,
    ExpertKind.writer => l10n.expertKindWriter,
  };
}
