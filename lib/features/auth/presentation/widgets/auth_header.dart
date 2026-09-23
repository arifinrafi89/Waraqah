import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.auto_stories_rounded,
                color: AppColors.primary,
                size: 28,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Waraqah',
              style: AppTypography.brandTitle.copyWith(
                color: AppColors.primary,
                fontSize: 22,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(title, style: AppTypography.h1),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondaryLight,
          ),
        ),
      ],
    );
  }
}

