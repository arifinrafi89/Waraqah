import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_surface.dart';
import '../controllers/auth_controller.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Account', style: AppTypography.brandTitle)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: user != null
              ? _buildAuthenticatedView(context, ref, user)
              : _buildUnauthenticatedView(context),
        ),
      ),
    );
  }

  Widget _buildAuthenticatedView(BuildContext context, WidgetRef ref, user) {
    return Column(
      children: [
        AppSurface(
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.primary.withOpacity(0.1),
                child: Text(
                  user.fullName?.isNotEmpty == true
                      ? user.fullName![0].toUpperCase()
                      : user.email[0].toUpperCase(),
                  style: AppTypography.h2.copyWith(color: AppColors.primary),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.fullName ?? 'Waraqah Reader',
                      style: AppTypography.h3,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      user.email,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondaryLight,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: user.isAdmin
                            ? AppColors.secondary.withOpacity(0.2)
                            : AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        user.isAdmin ? 'ADMIN' : 'MEMBER',
                        style: AppTypography.label.copyWith(
                          color: user.isAdmin
                              ? AppColors.secondary
                              : AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        AppButton(
          text: 'Sign Out',
          variant: AppButtonVariant.outline,
          onPressed: () {
            ref.read(authControllerProvider.notifier).signOut();
          },
        ),
      ],
    );
  }

  Widget _buildUnauthenticatedView(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.account_circle_outlined,
          size: 72,
          color: AppColors.textMutedLight,
        ),
        const SizedBox(height: 16),
        Text('Join Waraqah', style: AppTypography.h2),
        const SizedBox(height: 8),
        Text(
          'Sign in to list books for resale, message sellers, and place orders.',
          textAlign: TextAlign.center,
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondaryLight,
          ),
        ),
        const SizedBox(height: 32),
        AppButton(text: 'Sign In', onPressed: () => context.push('/login')),
        const SizedBox(height: 12),
        AppButton(
          text: 'Create Account',
          variant: AppButtonVariant.outline,
          onPressed: () => context.push('/register'),
        ),
      ],
    );
  }
}
