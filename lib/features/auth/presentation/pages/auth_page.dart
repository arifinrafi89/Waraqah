import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../home/home_routes.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/auth_hero.dart';
import '../widgets/auth_tab_switcher.dart';
import '../widgets/login_panel.dart';
import '../widgets/password_reset_panel.dart';
import '../widgets/signup_panel.dart';

/// Screen 2 — Log In / Sign Up. Sits outside the shell route, so it has no
/// bottom navigation.
class AuthPage extends StatefulWidget {
  const AuthPage({super.key, this.forgotPassword = false});

  final bool forgotPassword;

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late int _tab = widget.forgotPassword ? 2 : 0;

  bool get _isLogin => _tab == 0;
  bool get _isForgot => _tab == 2;

  @override
  void didUpdateWidget(covariant AuthPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.forgotPassword != widget.forgotPassword) {
      _tab = widget.forgotPassword ? 2 : 0;
    }
  }

  /// Opens the app without an account. Sign-up also lands here until the
  /// real sign-up flow is built.
  void _enterApp() => context.go(HomeRoutes.home);

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AuthHero(),
            if (!_isForgot)
              AuthTabSwitcher(
                labels: [l10n.authLogIn, l10n.authSignUp],
                selectedIndex: _tab,
                onSelected: (index) => setState(() => _tab = index),
              ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (_isForgot)
                      const PasswordResetPanel()
                    else if (_isLogin)
                      const LoginPanel()
                    else
                      const SignupPanel(),
                    if (_isForgot)
                      TextButton(
                        onPressed: () => setState(() => _tab = 0),
                        child: Text(l10n.authBackToLogin),
                      )
                    else ...[
                      _footSwitch(l10n),
                      TextButton(
                        onPressed: _enterApp,
                        child: Text(l10n.authContinueAsGuest),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _footSwitch(AppL10n l10n) {
    final palette = context.palette;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 6, 20, 22),
      child: GestureDetector(
        onTap: () => setState(() => _tab = _isLogin ? 1 : 0),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${_isLogin ? l10n.authNewHere : l10n.authHaveAccount} ',
                style: AppFonts.ui(size: 12, color: palette.textFaint),
              ),
              TextSpan(
                text: _isLogin ? l10n.authSignUp : l10n.authLogIn,
                style: AppFonts.ui(
                  size: 12,
                  weight: FontWeight.w800,
                  color: palette.accent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
