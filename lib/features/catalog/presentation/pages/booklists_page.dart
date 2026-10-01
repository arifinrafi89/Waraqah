import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../domain/entities/booklist.dart';
import '../providers/booklist_providers.dart';
import '../widgets/back_app_bar.dart';
import '../widgets/book_list_skeleton.dart';
import '../widgets/booklist_labels.dart';
import '../widgets/booklist_tile.dart';
import '../widgets/my_booklist_actions.dart';

/// `/catalog/booklists`: the Reader's own lists with "New list" (a Guest is
/// asked to log in), then Staff's lists grouped by kind.
class BooklistsPage extends ConsumerWidget {
  const BooklistsPage({super.key});

  static const _staffKinds = [
    BooklistKind.classList,
    BooklistKind.examPrep,
    BooklistKind.bookClub,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final signedIn = ref.watch(sessionProvider) != null;
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          BackAppBar(title: l10n.booklistTitle),
          Expanded(
            child: AsyncView(
              value: ref.watch(booklistsProvider),
              errorLabel: l10n.commonSomethingWentWrong,
              retryLabel: l10n.commonRetry,
              onRetry: () => ref.invalidate(booklistsProvider),
              skeleton: const Padding(
                padding: EdgeInsets.symmetric(horizontal: Insets.screen),
                child: BookListSkeleton(),
              ),
              builder: (lists) {
                final mine = [if (signedIn) ...lists.where((b) => b.isMine)];
                return ListView(
                  padding: EdgeInsets.fromLTRB(
                    Insets.screen,
                    0,
                    Insets.screen,
                    Sizes.navClearance,
                  ),
                  children: [
                    SectionHeader(
                      title: l10n.booklistMine,
                      actionLabel: l10n.booklistNew,
                      actionIcon: Icons.add_rounded,
                      onAction: () => ref.newBooklist(context),
                    ),
                    if (mine.isEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: Insets.md),
                        child: Text(
                          signedIn
                              ? l10n.booklistMineEmpty
                              : l10n.booklistGuestHint,
                          style: context.texts.bodyMedium,
                        ),
                      ),
                    for (final b in mine) BooklistTile(booklist: b),
                    for (final kind in _staffKinds)
                      if (lists.any((b) => b.kind == kind && !b.isMine)) ...[
                        const SizedBox(height: Insets.md),
                        SectionHeader(title: kind.group(l10n)),
                        for (final b in lists)
                          if (b.kind == kind && !b.isMine)
                            BooklistTile(booklist: b),
                      ],
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
