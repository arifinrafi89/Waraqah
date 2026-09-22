import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';

/// Registration form. The optional student ID is what unlocks the campus P2P
/// marketplace later.
class SignupForm extends StatefulWidget {
  const SignupForm({super.key, required this.onSubmit});

  final VoidCallback onSubmit;

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool _agreed = false;

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
            label: l10n.authFullName,
            hint: l10n.authNameHint,
            icon: Icons.person_outline_rounded,
          ),
          AppTextField(
            label: l10n.authEmail,
            hint: l10n.authEmailHint,
            icon: Icons.mail_outline_rounded,
            keyboardType: TextInputType.emailAddress,
          ),
          AppTextField(
            label: '${l10n.authStudentId} ${l10n.authOptional}',
            hint: l10n.authStudentIdHint,
            icon: Icons.badge_outlined,
          ),
          AppTextField(
            label: l10n.authPassword,
            hint: '••••••••',
            icon: Icons.lock_outline_rounded,
            obscure: true,
          ),
          AppTextField(
            label: l10n.authConfirmPassword,
            hint: '••••••••',
            icon: Icons.lock_outline_rounded,
            obscure: true,
          ),
          _terms(context, l10n),
          PrimaryButton(
            label: l10n.authCreateAccount,
            onPressed: _agreed ? widget.onSubmit : null,
          ),
        ],
      ),
    );
  }

  Widget _terms(BuildContext context, AppL10n l10n) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: Insets.sm,
    children: [
      SizedBox(
        width: 20,
        height: 20,
        child: Checkbox(
          value: _agreed,
          activeColor: context.palette.accent,
          onChanged: (value) => setState(() => _agreed = value ?? false),
        ),
      ),
      Expanded(
        child: Text(
          l10n.authAgreeTerms,
          style: AppFonts.ui(
            size: 11,
            height: 1.4,
            color: context.palette.textDim,
          ),
        ),
      ),
    ],
  );
}
