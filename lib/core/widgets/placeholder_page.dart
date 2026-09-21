import 'package:flutter/material.dart';

import '../theme/app_palette.dart';

/// Themed blank page for a feature not yet built, wired directly into
/// [AppRouter] as the stub destination until its real feature module lands.
class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    return Scaffold(
      backgroundColor: palette.bg,
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: palette.textDim,
          ),
        ),
      ),
    );
  }
}
