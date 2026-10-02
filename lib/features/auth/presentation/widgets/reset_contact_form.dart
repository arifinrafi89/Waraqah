import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import 'auth_error_text.dart';

/// Password reset, step 1: the mobile number the code goes to.
class ResetContactForm extends StatelessWidget {
  const ResetContactForm({
    super.key,
    required this.controller,
    required this.onSubmit,
    this.isBusy = false,
    this.errorText,
  });

  final TextEditingController controller;
  final VoidCallback onSubmit;
  final bool isBusy;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, Insets.screen, 20, Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 13,
        children: [
          Text(
            l10n.authForgotTitle,
            style: AppFonts.display(size: 24, color: context.palette.text),
          ),
          Text(
            l10n.authForgotMessage,
            style: AppFonts.ui(size: 13, color: context.palette.textDim),
          ),
          AppTextField(
            label: l10n.authMobileNumber,
            hint: l10n.authMobileNumberHint,
            icon: Icons.phone_iphone_outlined,
            controller: controller,
            keyboardType: TextInputType.phone,
          ),
          if (errorText != null) AuthErrorText(errorText!),
          PrimaryButton(
            label: l10n.authSendOtp,
            isBusy: isBusy,
            onPressed: onSubmit,
          ),
        ],
      ),
    );
  }
}
