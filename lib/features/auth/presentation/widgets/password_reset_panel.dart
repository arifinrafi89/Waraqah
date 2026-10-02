import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/auth_failure.dart';
import '../providers/auth_providers.dart';
import 'auth_failure_text.dart';
import 'otp_form.dart';
import 'reset_contact_form.dart';
import 'reset_password_form.dart';

/// Password reset in three steps: mobile number, code, new password. The
/// server checks the code with the new password; a wrong one goes back to
/// the code step.
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

  /// Runs [action] with the busy flag on, showing any failure.
  Future<void> _run(Future<void> Function() action) async {
    final l10n = AppL10n.of(context)!;
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await action();
    } on AuthFailure catch (failure) {
      _otp = null;
      _error = failure.message(l10n);
    } catch (_) {
      _error = l10n.commonSomethingWentWrong;
    }
    if (mounted) setState(() => _busy = false);
  }

  void _sendOtp() {
    final mobile = _contact.text.trim();
    if (!RegExp(r'^(?:\+?880|0)1[3-9]\d{8}$').hasMatch(mobile)) {
      setState(() => _error = AppL10n.of(context)!.authInvalidMobileNumber);
      return;
    }
    _run(() async {
      await ref.read(sessionProvider.notifier).requestPasswordReset(mobile);
      _savedContact = mobile;
    });
  }

  void _takeOtp(String otp) => setState(() {
    final valid = otp.trim().length == 6;
    _error = valid ? null : AppL10n.of(context)!.authOtpInvalid;
    if (valid) _otp = otp.trim();
  });

  void _reset() {
    if (_password.text.isEmpty) return;
    final l10n = AppL10n.of(context)!;
    _run(() async {
      await ref
          .read(sessionProvider.notifier)
          .resetPassword(
            contact: _savedContact!,
            otp: _otp!,
            password: _password.text,
          );
      _error = l10n.authPasswordReset;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_savedContact == null) {
      return ResetContactForm(
        controller: _contact,
        isBusy: _busy,
        errorText: _error,
        onSubmit: _sendOtp,
      );
    }
    if (_otp == null) {
      return OtpForm(
        contact: _savedContact!,
        isBusy: _busy,
        errorText: _error,
        onSubmit: _takeOtp,
      );
    }
    return ResetPasswordForm(
      controller: _password,
      isBusy: _busy,
      message: _error,
      onSubmit: _reset,
    );
  }
}
