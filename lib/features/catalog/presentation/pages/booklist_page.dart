import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/not_found_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/booklist_providers.dart';
import '../widgets/add_list_to_cart_bar.dart';
import '../widgets/back_app_bar.dart';
import '../widgets/book_list_skeleton.dart';
import '../widgets/booklist_body.dart';
import '../widgets/booklist_labels.dart';
import '../widgets/my_booklist_actions.dart';

/// `/catalog/booklist/:id`: the list's title, kind, note and New total, a
/// row per Book with its three prices, and "Add whole list to cart". A
/// Reader's own list can also be renamed, deleted and filled.
class BooklistPage extends ConsumerWidget {
  const BooklistPage({super.key, required this.booklistId});

  final String booklistId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final isBangla = Localizations.localeOf(context).languageCode == 'bn';
    return SafeArea(
      bottom: false,
      child: AsyncView(
        value: ref.watch(booklistProvider(booklistId)),
        errorLabel: l10n.commonSomethingWentWrong,
        retryLabel: l10n.commonRetry,
        onRetry: () => ref.invalidate(booklistProvider(booklistId)),
        skeleton: const Column(
          children: [
            BackAppBar(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Insets.screen),
                child: BookListSkeleton(),
              ),
            ),
          ],
        ),
        builder: (list) => list == null
            ? Column(
                children: [
                  const BackAppBar(),
                  Expanded(
                    child: NotFoundView(
                      label: l10n.commonNotFound,
                      backLabel: l10n.commonBack,
                      onBack: BackAppBar.goBack(context),
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  BackAppBar(
                    title: list.title(isBangla),
                    subtitle: list.kind.label(l10n),
                    actions: [
                      if (list.isMine)
                        PopupMenuButton<bool>(
                          onSelected: (delete) => delete
                              ? ref.deleteBooklist(context, list)
                              : ref.renameBooklist(context, list),
                          itemBuilder: (_) => [
                            PopupMenuItem(
                              value: false,
                              child: Text(l10n.booklistRename),
                            ),
                            PopupMenuItem(
                              value: true,
                              child: Text(l10n.booklistDelete),
                            ),
                          ],
                        ),
                    ],
                  ),
                  Expanded(child: BooklistBody(booklist: list)),
                  Padding(
                    padding: EdgeInsets.only(bottom: Sizes.navClearance),
                    child: AddListToCartBar(books: list.books),
                  ),
                ],
              ),
      ),
    );
  }
}
