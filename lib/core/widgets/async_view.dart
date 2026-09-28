import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/app_dimens.dart';
import '../theme/app_theme.dart';
import '../theme/app_typography.dart';
import 'shimmer_box.dart';

/// Renders a Riverpod [AsyncValue] as shimmer / error / data.
///
/// Having one brick own the three states means no feature ever forgets a
/// loading skeleton and every error looks the same.
class AsyncView<T> extends StatelessWidget {
  const AsyncView({
    super.key,
    required this.value,
    required this.skeleton,
    required this.builder,
    required this.errorLabel,
    required this.retryLabel,
    this.onRetry,
  });

  final AsyncValue<T> value;
  final Widget skeleton;
  final Widget Function(T data) builder;
  final String errorLabel;
  final String retryLabel;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return value.when(
      loading: () => ShimmerScope(child: skeleton),
      error: (_, _) => _Error(
        label: errorLabel,
        retryLabel: retryLabel,
        onRetry: onRetry,
      ),
      data: builder,
    );
  }
}

class _Error extends StatelessWidget {
  const _Error({required this.label, required this.retryLabel, this.onRetry});

  final String label;
  final String retryLabel;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Insets.screen,
        vertical: Insets.xl,
      ),
      child: Column(
        spacing: Insets.sm,
        children: [
          Icon(Icons.cloud_off_rounded, color: palette.textFaint, size: 26),
          Text(
            label,
            style: AppFonts.ui(size: 12.5, color: palette.textDim),
            textAlign: TextAlign.center,
          ),
          if (onRetry != null)
            TextButton(
              onPressed: onRetry,
              child: Text(
                retryLabel,
                style: AppFonts.ui(
                  size: 12,
                  weight: FontWeight.w800,
                  color: palette.accent,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
