import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';

/// Password reset, step 3: the new password, then the result.
class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({
    super.key,
    required this.controller,
    required this.onSubmit,
    this.isBusy = false,
    this.message,
  });

  final TextEditingController controller;
  final VoidCallback onSubmit;
  final bool isBusy;
  final String? message;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, Insets.screen, 20, Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 13,
        children: [
          AppTextField(
            label: l10n.authPassword,
            hint: '••••••••',
            icon: Icons.lock_outline_rounded,
            obscure: true,
            controller: controller,
          ),
          if (message != null)
            Text(
              message!,
              style: AppFonts.ui(size: 12, color: context.palette.accent),
            ),
          PrimaryButton(
            label: l10n.authResetPassword,
            isBusy: isBusy,
            onPressed: onSubmit,
          ),
        ],
      ),
    );
  }
}
