import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../auth/auth_routes.dart';

/// A centred note for an empty feed, or a log-in prompt. Scrolls, so pull
/// to refresh still works.
class BitesMessage extends StatelessWidget {
  const BitesMessage({super.key, required this.text, this.logIn = false});

  final String text;
  final bool logIn;

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(Insets.xl),
    children: [
      const SizedBox(height: Insets.xl * 2),
      Icon(Icons.forum_outlined, size: 40, color: context.palette.textFaint),
      const SizedBox(height: Insets.md),
      Text(
        text,
        textAlign: TextAlign.center,
        style: AppFonts.ui(size: 14, color: context.palette.textDim),
      ),
      if (logIn) ...[
        const SizedBox(height: Insets.lg),
        Center(
          child: FilledButton(
            onPressed: () => context.push(AuthRoutes.login),
            child: Text(AppL10n.of(context)!.bitesLogIn),
          ),
        ),
      ],
    ],
  );
}
