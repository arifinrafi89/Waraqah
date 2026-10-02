import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/auth_failure.dart';
import '../providers/auth_providers.dart';
import 'auth_failure_text.dart';
import 'otp_form.dart';
import 'signup_form.dart';

class SignupPanel extends ConsumerStatefulWidget {
  const SignupPanel({super.key});

  @override
  ConsumerState<SignupPanel> createState() => _SignupPanelState();
}

class _SignupPanelState extends ConsumerState<SignupPanel> {
  String? _contact;
  bool _busy = false;
  String? _error;

  Future<void> _requestOtp(String name, String contact, String password) async {
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await ref
          .read(sessionProvider.notifier)
          .requestSignUpOtp(
            name: name,
            contact: contact.trim(),
            password: password,
          );
      if (mounted) setState(() => _contact = contact.trim());
    } on AuthFailure catch (failure) {
      if (mounted) setState(() => _error = _message(failure));
    } catch (_) {
      if (mounted) {
        setState(() => _error = AppL10n.of(context)!.commonSomethingWentWrong);
      }
    }
    if (mounted) setState(() => _busy = false);
  }

  Future<void> _verify(String otp) async {
    if (_contact == null) return;
    if (otp.trim().length != 6) {
      setState(() => _error = AppL10n.of(context)!.authOtpInvalid);
      return;
    }
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await ref
          .read(sessionProvider.notifier)
          .verifySignUpOtp(contact: _contact!, otp: otp.trim());
    } on AuthFailure catch (failure) {
      if (mounted) setState(() => _error = _message(failure));
    } catch (_) {
      if (mounted) {
        setState(() => _error = AppL10n.of(context)!.commonSomethingWentWrong);
      }
    }
    if (mounted) setState(() => _busy = false);
  }

  String _message(AuthFailure failure) => failure.message(AppL10n.of(context)!);

  @override
  Widget build(BuildContext context) => _contact == null
      ? SignupForm(isBusy: _busy, errorText: _error, onSubmit: _requestOtp)
      : OtpForm(
          contact: _contact!,
          isBusy: _busy,
          errorText: _error,
          onSubmit: _verify,
        );
}
