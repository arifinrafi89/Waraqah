import 'package:flutter/material.dart';

import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/screen_app_bar.dart';
import '../../domain/entities/p2p_listing.dart';

class P2pMarketplaceHeader extends StatelessWidget {
  const P2pMarketplaceHeader({super.key, required this.listings});

  final List<P2pListing> listings;

  @override
  Widget build(BuildContext context) {
    return ScreenAppBar(
      title: 'P2P Marketplace',
      subtitle: '${listings.length} listings',
      actions: [
        AppIconButton(icon: Icons.notifications_outlined, onPressed: () {}),
      ],
    );
  }
}
