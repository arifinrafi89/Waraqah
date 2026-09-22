import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_theme.dart';
import '../router/app_routes.dart';

/// Squared floating button that opens the Gemini reading assistant from any tab.
class AiFab extends StatelessWidget {
  const AiFab({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Material(
      color: palette.accent,
      borderRadius: BorderRadius.circular(18),
      elevation: 8,
      shadowColor: Colors.black.withValues(alpha: 0.4),
      child: InkWell(
        onTap: () => context.pushNamed(RouteNames.aiChat),
        borderRadius: BorderRadius.circular(18),
        child: SizedBox(
          width: 52,
          height: 52,
          child: Icon(
            Icons.auto_awesome_rounded,
            color: palette.accentInk,
            size: 23,
          ),
        ),
      ),
    );
  }
}
