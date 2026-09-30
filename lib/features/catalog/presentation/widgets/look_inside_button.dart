import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../catalog_routes.dart';
import '../providers/book_extras_providers.dart';

/// "Look inside" under the book's header, shown only for books that have
/// contents or sample pages.
class LookInsideButton extends ConsumerWidget {
  const LookInsideButton({super.key, required this.bookId});

  final String bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(lookInsideProvider(bookId)).value == null) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(top: Insets.lg),
      child: SecondaryButton(
        label: AppL10n.of(context)!.bookLookInside,
        icon: const Icon(Icons.menu_book_outlined, size: 18),
        onPressed: () => context.push(CatalogRoutes.lookInsideFor(bookId)),
      ),
    );
  }
}
