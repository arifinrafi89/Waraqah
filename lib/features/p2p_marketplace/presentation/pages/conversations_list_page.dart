import 'package:flutter/material.dart';

import '../../../../core/theme/app_typography.dart';

class ConversationsListPage extends StatelessWidget {
  const ConversationsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Messages', style: AppTypography.brandTitle)),
      body: Center(child: Text('Chat Conversations', style: AppTypography.h3)),
    );
  }
}
