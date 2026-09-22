import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import 'auth_divider.dart';

/// Email + password login, with a Google fallback.
class LoginForm extends StatelessWidget {
  const LoginForm({super.key, required this.onSubmit});

  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final palette = context.palette;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, Insets.screen, 20, Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 13,
        children: [
          AppTextField(
            label: l10n.authEmail,
            hint: l10n.authEmailHint,
            icon: Icons.mail_outline_rounded,
            keyboardType: TextInputType.emailAddress,
          ),
          AppTextField(
            label: l10n.authPassword,
            hint: '••••••••',
            icon: Icons.lock_outline_rounded,
            obscure: true,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              l10n.authForgotPassword,
              style: AppFonts.ui(
                size: 11.5,
                weight: FontWeight.w800,
                color: palette.accent,
              ),
            ),
          ),
          PrimaryButton(label: l10n.authLogIn, onPressed: onSubmit),
          AuthDivider(label: l10n.authOrContinueWith),
          SecondaryButton(
            label: l10n.authContinueWithGoogle,
            icon: const GoogleGlyph(),
            onPressed: onSubmit,
          ),
        ],
      ),
    );
  }
}
