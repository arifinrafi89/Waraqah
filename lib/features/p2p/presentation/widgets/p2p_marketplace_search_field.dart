import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../providers/p2p_providers.dart';

class P2pMarketplaceSearchField extends StatelessWidget {
  const P2pMarketplaceSearchField({super.key, required this.ref});

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
      child: AppTextField(
        hint: 'Search second-hand books...',
        icon: Icons.search_rounded,
        radius: 18,
        onChanged: (value) => ref.read(p2pQueryProvider.notifier).select(value),
      ),
    );
  }
}
