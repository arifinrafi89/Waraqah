import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import 'moderation_empty_view.dart';
import 'moderation_skeleton.dart';

/// One Moderation Center tab: a list loading through [AsyncView], its
/// skeleton and retry, and an empty state when there's nothing to do.
class ModerationTab<T> extends StatelessWidget {
  const ModerationTab({
    super.key,
    required this.value,
    required this.onRetry,
    required this.emptyIcon,
    required this.emptyMessage,
    required this.itemBuilder,
    this.spacing = Insets.md,
  });

  final AsyncValue<List<T>> value;
  final VoidCallback onRetry;
  final IconData emptyIcon;
  final String emptyMessage;
  final Widget Function(T item) itemBuilder;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return AsyncView(
      value: value,
      errorLabel: l10n.commonSomethingWentWrong,
      retryLabel: l10n.commonRetry,
      onRetry: onRetry,
      skeleton: const ModerationSkeleton(),
      builder: (items) => items.isEmpty
          ? ModerationEmptyView(icon: emptyIcon, message: emptyMessage)
          : ListView.separated(
              padding: const EdgeInsets.all(Insets.screen),
              itemCount: items.length,
              separatorBuilder: (_, _) => SizedBox(height: spacing),
              itemBuilder: (_, i) => itemBuilder(items[i]),
            ),
    );
  }
}
