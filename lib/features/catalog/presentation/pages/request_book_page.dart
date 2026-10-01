import 'package:flutter/material.dart';

import '../../../../core/widgets/coming_soon_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/back_app_bar.dart';

/// `/catalog/request-book`: stand-in until the Request a Book flow lands.
class RequestBookPage extends StatelessWidget {
  const RequestBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          const BackAppBar(),
          Expanded(
            child: ComingSoonView(
              icon: Icons.menu_book_rounded,
              title: l10n.comingSoonTitle,
              message: l10n.searchRequestBookSoon,
              phaseLabel: l10n.searchRequestBook,
            ),
          ),
        ],
      ),
    );
  }
}
