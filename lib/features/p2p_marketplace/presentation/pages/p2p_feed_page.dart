import 'package:flutter/material.dart';

import '../../../../core/theme/app_typography.dart';

class P2pFeedPage extends StatelessWidget {
  const P2pFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Used Books Resale', style: AppTypography.brandTitle),
      ),
      body: Center(
        child: Text('P2P Marketplace Feed', style: AppTypography.h3),
      ),
    );
  }
}
