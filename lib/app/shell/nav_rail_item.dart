import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';

/// One icon-only rail button; hovering shows "Label: explanation".
class NavRailItem extends StatelessWidget {
  const NavRailItem({
    super.key,
    required this.icon,
    required this.label,
    required this.hint,
    required this.isActive,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final String hint;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Tooltip(
      message: hint,
      child: Semantics(
        label: label,
        button: true,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isActive ? palette.accent : Colors.transparent,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(
              icon,
              size: 22,
              color: isActive ? palette.accentInk : palette.textFaint,
            ),
          ),
        ),
      ),
    );
  }
}
