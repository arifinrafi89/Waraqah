import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../app/router/app_routes.dart';

class P2pMarketplaceAddButton extends StatelessWidget {
  const P2pMarketplaceAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: Insets.screen,
      bottom: 92,
      child: SizedBox(
        width: 64,
        height: 64,
        child: FloatingActionButton(
          onPressed: () => context.pushNamed(RouteNames.p2pAddListing),
          backgroundColor: context.palette.accent,
          foregroundColor: Colors.black,
          elevation: 12,
          shape: const CircleBorder(),
          child: const Icon(Icons.add_rounded, size: 34, color: Colors.black),
        ),
      ),
    );
  }
}
