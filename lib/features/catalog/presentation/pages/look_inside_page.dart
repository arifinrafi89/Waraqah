import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../l10n/app_localizations.dart';
import '../../catalog_routes.dart';
import '../providers/book_extras_providers.dart';
import '../widgets/contents_list.dart';
import '../widgets/sample_pages.dart';

/// `/catalog/book/:id/look-inside`: the table of contents and the first few
/// pages, in two tabs.
class LookInsidePage extends ConsumerWidget {
  const LookInsidePage({super.key, required this.bookId});

  final String bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final palette = context.palette;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(Insets.md, 6, Insets.md, 6),
                child: Row(
                  spacing: Insets.md,
                  children: [
                    AppIconButton(
                      icon: Icons.arrow_back_rounded,
                      onPressed: () => context.canPop()
                          ? context.pop()
                          : context.go(CatalogRoutes.bookDetailFor(bookId)),
                    ),
                    Text(l10n.bookLookInside, style: context.texts.titleLarge),
                  ],
                ),
              ),
              TabBar(
                labelColor: palette.text,
                unselectedLabelColor: palette.textFaint,
                indicatorColor: palette.accent,
                dividerColor: palette.border,
                labelStyle: context.texts.titleSmall,
                tabs: [
                  Tab(text: l10n.bookContents),
                  Tab(text: l10n.bookSamplePages),
                ],
              ),
              Expanded(
                child: AsyncView(
                  value: ref.watch(lookInsideProvider(bookId)),
                  errorLabel: l10n.commonSomethingWentWrong,
                  retryLabel: l10n.commonRetry,
                  onRetry: () => ref.invalidate(lookInsideProvider(bookId)),
                  skeleton: const Padding(
                    padding: EdgeInsets.all(Insets.screen),
                    child: ShimmerBox(height: 360, radius: Radii.card),
                  ),
                  builder: (look) => look == null
                      ? Center(child: Text(l10n.bookLookInsideNone))
                      : TabBarView(
                          children: [
                            ContentsList(entries: look.contents),
                            SamplePages(pages: look.samplePages),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
