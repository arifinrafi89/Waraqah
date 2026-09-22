import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/auth_hero.dart';
import '../widgets/auth_tab_switcher.dart';
import '../widgets/login_form.dart';
import '../widgets/signup_form.dart';

/// Screen 2 — Log In / Sign Up. Sits outside the shell route, so it has no
/// bottom navigation.
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  int _tab = 0;

  bool get _isLogin => _tab == 0;

  /// Auth itself lands in the auth phase; for now entering the app is enough
  /// to demo the flow.
  void _enterApp() => context.go(AppRoutes.home);

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AuthHero(),
            AuthTabSwitcher(
              labels: [l10n.authLogIn, l10n.authSignUp],
              selectedIndex: _tab,
              onSelected: (index) => setState(() => _tab = index),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (_isLogin)
                      LoginForm(onSubmit: _enterApp)
                    else
                      SignupForm(onSubmit: _enterApp),
                    _footSwitch(l10n),
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
