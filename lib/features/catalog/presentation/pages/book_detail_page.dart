import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../catalog_routes.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/book_detail_providers.dart';
import '../widgets/add_to_cart_bar.dart';
import '../widgets/book_about_section.dart';
import '../widgets/book_detail_header.dart';
import '../widgets/book_detail_skeleton.dart';
import '../widgets/book_reviews_section.dart';

/// `/catalog/book/:id` — one title with its From-price, summary and reader
/// reviews. Opened over the shell, like the AI chat, so the add-to-cart
/// bar is not hidden behind the bottom nav.
class BookDetailPage extends ConsumerWidget {
  const BookDetailPage({super.key, required this.bookId});

  final String bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final detail = ref.watch(bookDetailProvider(bookId));
    final data = detail.value;
    return Scaffold(
      bottomNavigationBar: data == null ? null : AddToCartBar(book: data.book),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(Insets.md, 6, 0, 10),
              child: AppIconButton(
                icon: Icons.arrow_back_rounded,
                onPressed: () => context.canPop()
                    ? context.pop()
                    : context.go(CatalogRoutes.catalog),
              ),
            ),
            Expanded(
              child: AsyncView(
                value: detail,
                errorLabel: l10n.commonSomethingWentWrong,
                retryLabel: l10n.commonRetry,
                onRetry: () => ref.invalidate(bookDetailProvider(bookId)),
                skeleton: const BookDetailSkeleton(),
                builder: (data) => data == null
                    ? Center(
                        child: Text(
                          l10n.bookDetailNotFound,
                          style: context.texts.bodyMedium,
                        ),
                      )
                    : _Body(data: data),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.data});

  final BookDetailData data;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        Insets.screen,
        0,
        Insets.screen,
        Insets.xl,
      ),
      children: [
        BookDetailHeader(book: data.book),
        const SizedBox(height: Insets.xl + 4),
        BookAboutSection(book: data.book, details: data.details),
        BookReviewsSection(reviews: data.details.reviews),
      ],
    );
  }
}
