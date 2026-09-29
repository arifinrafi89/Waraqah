import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/screen_app_bar.dart';
import '../widgets/p2p_add_listing_condition.dart';
import '../widgets/p2p_add_listing_cover.dart';
import '../widgets/p2p_add_listing_field.dart';

class P2pAddListingPage extends StatelessWidget {
  const P2pAddListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Scaffold(
      backgroundColor: palette.bg,
      body: SafeArea(
        child: Column(
          children: [
            ScreenAppBar(
              title: 'Sell a Book',
              actions: [
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.close_rounded),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(
                  Insets.screen,
                  0,
                  Insets.screen,
                  Insets.xl,
                ),
                children: [
                  const P2pAddListingCover(),
                  const SizedBox(height: Insets.xl),
                  const P2pAddListingField(
                    label: 'Book title',
                    hint: 'The Pragmatic Programmer',
                  ),
                  const P2pAddListingField(
                    label: 'Author',
                    hint: 'David Thomas',
                  ),
                  const P2pAddListingField(label: 'Price (৳)', hint: '450'),
                  const P2pAddListingCondition(),
                  const P2pAddListingField(
                    label: 'Seller note',
                    hint: 'Minimal markings, original copy',
                  ),
                  const SizedBox(height: Insets.lg),
                  FilledButton.icon(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.check_rounded),
                    label: const Text('Publish listing'),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
