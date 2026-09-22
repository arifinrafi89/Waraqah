import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/app_palette.dart';

/// Renders [value]'s data, or a centered spinner while it loads, or a short
/// message on error. Every page that reads repository data goes through this
/// so loading and failure look the same everywhere.
class AsyncValueView<T> extends StatelessWidget {
  const AsyncValueView({super.key, required this.value, required this.data});

  final AsyncValue<T> value;
  final Widget Function(T data) data;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    return value.when(
      data: data,
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            "Couldn't load this right now.",
            textAlign: TextAlign.center,
            style: TextStyle(color: palette.textDim),
          ),
        ),
      ),
    );
  }
}
