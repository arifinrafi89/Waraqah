import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'async_view.dart';
import 'shimmer_box.dart';

/// [AsyncView] for sliver bodies: [builder] returns a sliver, while the
/// shimmer skeleton and the error block are boxes wrapped in a sliver.
class AsyncSliverView<T> extends StatelessWidget {
  const AsyncSliverView({
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
      loading: () => SliverToBoxAdapter(child: ShimmerScope(child: skeleton)),
      error: (_, _) => SliverToBoxAdapter(
        child: AsyncErrorView(
          label: errorLabel,
          retryLabel: retryLabel,
          onRetry: onRetry,
        ),
      ),
      data: builder,
    );
  }
}
