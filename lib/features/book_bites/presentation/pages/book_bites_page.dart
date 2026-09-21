import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/providers/book_providers.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../home/presentation/controllers/home_controller.dart';
import '../widgets/post_card.dart';

const _gutter = 18.0;

class BookBitesPage extends ConsumerWidget {
  const BookBitesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).extension<AppPalette>()!;
    final posts = ref.watch(postsProvider);
    final profiles = {for (final p in ref.watch(profilesProvider)) p.id: p};
    final books = {for (final b in ref.watch(booksProvider)) b.id: b};

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
      body: SafeArea(
        bottom: false,
        child: ListView.separated(
          padding: const EdgeInsets.fromLTRB(_gutter, _gutter, _gutter, 140),
          itemCount: posts.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final post = posts[index];
            final author = profiles[post.authorId];
            final taggedBook =
                post.taggedBookIds.isEmpty ? null : books[post.taggedBookIds.first];
            final chip = palette.chips[index % palette.chips.length];
            return PostCard(post: post, author: author, taggedBook: taggedBook, chip: chip);
          },
        ),
      ),
    );
  }
}
