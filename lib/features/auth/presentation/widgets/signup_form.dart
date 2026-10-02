import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';

/// Registration form for readers.
class SignupForm extends StatefulWidget {
  const SignupForm({
    super.key,
    required this.onSubmit,
    this.isBusy = false,
    this.errorText,
  });

  final void Function(String name, String contact, String password) onSubmit;
  final bool isBusy;
  final String? errorText;

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool _agreed = false;
  final _name = TextEditingController();
  final _contact = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _contact.dispose();
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

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
            controller: _name,
          ),
          AppTextField(
            label: l10n.authEmailOrPhone,
            hint: l10n.authEmailOrPhoneHint,
            icon: Icons.contact_mail_outlined,
            keyboardType: TextInputType.phone,
            controller: _contact,
          ),
          AppTextField(
            label: l10n.authPassword,
            hint: '••••••••',
            icon: Icons.lock_outline_rounded,
            obscure: true,
            controller: _password,
          ),
          AppTextField(
            label: l10n.authConfirmPassword,
            hint: '••••••••',
            icon: Icons.lock_outline_rounded,
            obscure: true,
            controller: _confirm,
          ),
          _terms(context, l10n),
          if (widget.errorText != null) Text(widget.errorText!),
          PrimaryButton(
            label: l10n.authCreateAccount,
            isBusy: widget.isBusy,
            onPressed: _agreed && _password.text == _confirm.text
                ? () =>
                      widget.onSubmit(_name.text, _contact.text, _password.text)
                : null,
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
