import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';

class P2pAddListingCover extends StatelessWidget {
  const P2pAddListingCover({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return AspectRatio(
      aspectRatio: 2,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            colors: [palette.accentSoft, palette.surface2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: palette.surface,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.add_photo_alternate_outlined, size: 34),
              ),
              const SizedBox(height: Insets.sm),
              Text(
                'Add front cover',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
