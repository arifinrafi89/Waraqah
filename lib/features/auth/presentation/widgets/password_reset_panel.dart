import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/auth_providers.dart';
import 'otp_form.dart';

class PasswordResetPanel extends ConsumerStatefulWidget {
  const PasswordResetPanel({super.key});

  @override
  ConsumerState<PasswordResetPanel> createState() => _PasswordResetPanelState();
}

class _PasswordResetPanelState extends ConsumerState<PasswordResetPanel> {
  final _contact = TextEditingController();
  final _password = TextEditingController();
  String? _savedContact;
  String? _otp;
  bool _busy = false;
  String? _error;

  @override
  void dispose() {
    _contact.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _sendOtp() async {
    final mobile = _contact.text.trim();
    if (!RegExp(r'^(?:\+?880|0)1[3-9]\d{8}$').hasMatch(mobile)) {
      setState(() => _error = AppL10n.of(context)!.authInvalidMobileNumber);
      return;
    }
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await ref.read(sessionProvider.notifier).requestPasswordReset(mobile);
      if (mounted) setState(() => _savedContact = mobile);
    } catch (_) {
      if (mounted) {
        setState(() => _error = AppL10n.of(context)!.commonSomethingWentWrong);
      }
    }
    if (mounted) {
      setState(() => _busy = false);
    }
  }

  Future<void> _verifyOtp(String otp) async {
    if (otp.trim().length != 6) {
      setState(() => _error = AppL10n.of(context)!.authOtpInvalid);
      return;
    }
    setState(() {
      _busy = true;
      _error = null;
    });
    if (mounted) {
      setState(() {
        _otp = otp.trim();
        _busy = false;
      });
    }
  }

  Future<void> _reset() async {
    if (_savedContact == null || _otp == null || _password.text.isEmpty) return;
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await ref
          .read(sessionProvider.notifier)
          .resetPassword(
            contact: _savedContact!,
            otp: _otp!,
            password: _password.text,
          );
      if (mounted) {
        setState(() => _error = AppL10n.of(context)!.authPasswordReset);
      }
    } catch (_) {
      if (mounted) {
        setState(() => _error = AppL10n.of(context)!.commonSomethingWentWrong);
      }
    }
    if (mounted) setState(() => _busy = false);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    if (_savedContact == null) {
      return _contactForm(context, l10n);
    }
    if (_otp == null) {
      return OtpForm(
        contact: _savedContact!,
        isBusy: _busy,
        errorText: _error,
        onSubmit: _verifyOtp,
      );
    }
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
            controller: _password,
          ),
          if (_error != null)
            Text(
              _error!,
              style: AppFonts.ui(size: 12, color: context.palette.accent),
            ),
          PrimaryButton(
            label: l10n.authResetPassword,
            isBusy: _busy,
            onPressed: _reset,
          ),
        ],
      ),
    );
  }

  Widget _contactForm(BuildContext context, AppL10n l10n) => Padding(
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
          controller: _contact,
          keyboardType: TextInputType.phone,
        ),
        if (_error != null)
          Text(
            _error!,
            style: AppFonts.ui(
              size: 12,
              weight: FontWeight.w700,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        PrimaryButton(
          label: l10n.authSendOtp,
          isBusy: _busy,
          onPressed: _sendOtp,
        ),
      ],
    ),
  );
}
