import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/auth_failure.dart';
import '../providers/auth_providers.dart';
import 'login_form.dart';

/// Runs the sign-in and shows its progress and errors.
///
/// There's no navigation here: once the session changes, the router's
/// guard moves the user off the login page by itself.
class LoginPanel extends ConsumerStatefulWidget {
  const LoginPanel({super.key});

  @override
  ConsumerState<LoginPanel> createState() => _LoginPanelState();
}

class _LoginPanelState extends ConsumerState<LoginPanel> {
  bool _busy = false;
  String? _error;

  Future<void> _signIn(String email, String password) async {
    final l10n = AppL10n.of(context)!;
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await ref
          .read(sessionProvider.notifier)
          .signIn(email: email, password: password);
    } on AuthFailure catch (failure) {
      _error = switch (failure) {
        AuthFailure.invalidEmail => l10n.authInvalidEmail,
        AuthFailure.missingPassword => l10n.authMissingPassword,
      };
    } catch (_) {
      _error = l10n.commonSomethingWentWrong;
    }
    if (mounted) setState(() => _busy = false);
  }

  @override
  Widget build(BuildContext context) {
    return LoginForm(
      isBusy: _busy,
      errorText: _error,
      onSubmit: _signIn,
      onGoogle: () async {
        final l10n = AppL10n.of(context)!;
        setState(() {
          _busy = true;
          _error = null;
        });
        try {
          await ref.read(sessionProvider.notifier).signInWithGoogle();
        } catch (_) {
          _error = l10n.commonSomethingWentWrong;
        }
        if (mounted) setState(() => _busy = false);
      },
      onForgotPassword: () => context.go('/login?forgot=1'),
    );
  }
}
