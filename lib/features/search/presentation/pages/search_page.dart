import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../core/widgets/book_grid_card.dart';
import '../../../../core/widgets/centered_content.dart';
import '../../../../core/widgets/responsive_book_grid.dart';
import '../../../../core/providers/book_providers.dart';
import '../../../cart/presentation/controllers/cart_controller.dart';
import '../controllers/search_controller.dart';

const _gutter = 18.0;

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  late final _controller = TextEditingController(
    text: ref.read(searchQueryProvider),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _setQuery(String value) {
    ref.read(searchQueryProvider.notifier).state = value;
    if (_controller.text != value) _controller.text = value;
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    final query = ref.watch(searchQueryProvider);
    final results = ref.watch(searchResultsProvider);

    return Scaffold(
      backgroundColor: palette.bg,
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          autofocus: true,
          onChanged: _setQuery,
          style: TextStyle(color: palette.text, fontSize: 15),
          decoration: InputDecoration(
            hintText: 'Search books, authors, genres…',
            hintStyle: TextStyle(color: palette.textFaint),
            prefixIcon: Icon(Icons.search_rounded, color: palette.textDim),
            suffixIcon: query.isEmpty
                ? null
                : IconButton(
                    icon: Icon(Icons.close_rounded, color: palette.textDim),
                    onPressed: () => _setQuery(''),
                  ),
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: CenteredContent(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(_gutter, _gutter, _gutter, 140),
            child: query.isEmpty
                ? _IdleState(palette: palette, onSelectGenre: _setQuery)
                : results.isEmpty
                ? _NoMatchesState(palette: palette, query: query)
                : _ResultsState(palette: palette, results: results),
          ),
        ),
      ),
    );
  }
}

class _IdleState extends ConsumerWidget {
  const _IdleState({required this.palette, required this.onSelectGenre});

  final AppPalette palette;
  final ValueChanged<String> onSelectGenre;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genres = ref.watch(booksProvider).map((b) => b.genre).toSet().toList();
    final chips = palette.chips;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Popular genres',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: palette.textDim,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (var i = 0; i < genres.length; i++)
              InkWell(
                borderRadius: BorderRadius.circular(999),
                onTap: () => onSelectGenre(genres[i]),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: chips[i % chips.length].withValues(alpha: 0.16),
                    border: Border.all(color: chips[i % chips.length]),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    genres[i],
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      color: chips[i % chips.length],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _NoMatchesState extends StatelessWidget {
  const _NoMatchesState({required this.palette, required this.query});

  final AppPalette palette;
  final String query;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Column(
        children: [
          Icon(Icons.search_off_rounded, size: 48, color: palette.textFaint),
          const SizedBox(height: 12),
          Text(
            'No books match "$query"',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: palette.textDim),
          ),
        ],
      ),
    );
  }
}

class _ResultsState extends ConsumerWidget {
  const _ResultsState({required this.palette, required this.results});

  final AppPalette palette;
  final List<Book> results;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${results.length} results',
          style: TextStyle(fontSize: 12.5, color: palette.textDim),
        ),
        const SizedBox(height: 10),
        ResponsiveBookGrid(
          itemCount: results.length,
          itemBuilder: (context, index) {
            final book = results[index];
            final chip = palette.chips[index % palette.chips.length];
            return BookGridCard(
              book: book,
              chip: chip,
              onTap: () => context.pushNamed(
                'book-detail',
                pathParameters: {'id': book.id},
              ),
              onAddToCart: () {
                addToCart(ref, book.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Added to cart')),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
