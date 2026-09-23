import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../controllers/catalog_controller.dart';
import '../widgets/book_card.dart';

class CatalogPage extends ConsumerWidget {
  const CatalogPage({super.key});

  static const _categories = [
    'All',
    'Islamic Studies',
    'History',
    'Self-Help',
    'Biography',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booksAsync = ref.watch(catalogControllerProvider);
    final selectedCategory = ref.watch(catalogCategoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Waraqah Books', style: AppTypography.brandTitle),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: AppTextField(
                hint: 'Search titles, authors, ISBNs...',
                prefixIcon: const Icon(Icons.search, size: 20),
                onChanged: (val) =>
                    ref.read(catalogControllerProvider.notifier).updateSearchQuery(val),
              ),
            ),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, i) {
                  final cat = _categories[i];
                  final isSelected = (selectedCategory == null && cat == 'All') ||
                      selectedCategory == cat;
                  return ChoiceChip(
                    label: Text(cat),
                    selected: isSelected,
                    selectedColor: AppColors.primary.withOpacity(0.15),
                    onSelected: (_) {
                      ref
                          .read(catalogControllerProvider.notifier)
                          .selectCategory(cat == 'All' ? null : cat);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: booksAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, _) => Center(child: Text('Error: $err')),
                data: (books) {
                  if (books.isEmpty) {
                    return const EmptyStateView(
                      icon: Icons.search_off_rounded,
                      title: 'No books found',
                      description: 'Try adjusting your search or category filter.',
                    );
                  }
                  return RefreshIndicator(
                    onRefresh: () =>
                        ref.read(catalogControllerProvider.notifier).refresh(),
                    child: ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: books.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final book = books[index];
                        return BookCard(
                          book: book,
                          onTap: () => context.push('/book/${book.id}'),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
