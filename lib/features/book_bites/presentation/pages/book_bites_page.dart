import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_palette.dart';
import '../../../../core/widgets/async_value_view.dart';
import '../../data/book_bites_providers.dart';
import '../widgets/post_card.dart';

const _gutter = 18.0;

class BookBitesPage extends ConsumerWidget {
  const BookBitesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    final feed = ref.watch(bookBitesFeedProvider);

    return Scaffold(
      backgroundColor: palette.bg,
      appBar: AppBar(title: const Text('Book-Bites')),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 76),
        child: FloatingActionButton(
          onPressed: () => context.pushNamed('book-bites-create'),
          child: const Icon(Icons.add),
        ),
      ),
      body: AsyncValueView(
        value: feed,
        data: (feed) => SafeArea(
          bottom: false,
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(_gutter, _gutter, _gutter, 140),
            itemCount: feed.posts.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final post = feed.posts[index];
              final author = feed.profiles[post.authorId];
              final taggedBook = post.taggedBookIds.isEmpty
                  ? null
                  : feed.books[post.taggedBookIds.first];
              final chip = palette.chips[index % palette.chips.length];
              return PostCard(post: post, author: author, taggedBook: taggedBook, chip: chip);
            },
          ),
        ),
      ),
    );
  }
}
