import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../p2p_routes.dart';

class P2pMarketplaceAddButton extends StatefulWidget {
  const P2pMarketplaceAddButton({super.key});

  @override
  State<P2pMarketplaceAddButton> createState() =>
      _P2pMarketplaceAddButtonState();
}

class _P2pMarketplaceAddButtonState extends State<P2pMarketplaceAddButton> {
  bool _pushing = false;

  Future<void> _onTap() async {
    if (_pushing) return;
    setState(() => _pushing = true);
    await context.push(P2pRoutes.addListing);
    if (mounted) setState(() => _pushing = false);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: Insets.screen,
      bottom: 92,
      child: SizedBox(
        width: 64,
        height: 64,
        child: FloatingActionButton(
          onPressed: _pushing ? null : _onTap,
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
