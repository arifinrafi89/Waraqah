import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import 'auth_divider.dart';

/// Email + password login, with a Google fallback.
///
/// Only collects input; `LoginPanel` does the signing in.
class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.onSubmit,
    required this.onGoogle,
    this.isBusy = false,
    this.errorText,
  });

  final void Function(String email, String password) onSubmit;
  final VoidCallback onGoogle;
  final bool isBusy;
  final String? errorText;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

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
            controller: _email,
          ),
          AppTextField(
            label: l10n.authPassword,
            hint: '••••••••',
            icon: Icons.lock_outline_rounded,
            obscure: true,
            controller: _password,
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
          if (widget.errorText != null)
            Text(
              widget.errorText!,
              style: AppFonts.ui(
                size: 12,
                weight: FontWeight.w700,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          PrimaryButton(
            label: l10n.authLogIn,
            isBusy: widget.isBusy,
            onPressed: () => widget.onSubmit(_email.text, _password.text),
          ),
          AuthDivider(label: l10n.authOrContinueWith),
          SecondaryButton(
            label: l10n.authContinueWithGoogle,
            icon: const GoogleGlyph(),
            onPressed: widget.isBusy ? null : widget.onGoogle,
          ),
        ],
      ),
    );
  }
}
