import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/book.dart';
import '../../../core/models/profile.dart';
import '../../../core/providers/book_providers.dart';
import '../../../core/providers/profile_providers.dart';
import '../domain/models/post.dart';
import '../domain/repositories/post_repository.dart';
import 'repositories/dummy_post_repository.dart';

final postRepositoryProvider =
    Provider<PostRepository>((ref) => DummyPostRepository());

class PostsNotifier extends AsyncNotifier<List<Post>> {
  @override
  Future<List<Post>> build() => ref.watch(postRepositoryProvider).getPosts();

  Future<void> add(Post post) async {
    final repository = ref.read(postRepositoryProvider);
    state = AsyncValue.data(await repository.addPost(post));
  }
}

final postsProvider =
    AsyncNotifierProvider<PostsNotifier, List<Post>>(PostsNotifier.new);

/// Book-Bites feed: posts plus the author/book lookups it renders with.
final bookBitesFeedProvider = FutureProvider<
    ({List<Post> posts, Map<String, Profile> profiles, Map<String, Book> books})>(
  (ref) async {
    final posts = await ref.watch(postsProvider.future);
    final profiles = {
      for (final p in await ref.watch(profilesProvider.future)) p.id: p,
    };
    final books = {
      for (final b in await ref.watch(booksProvider.future)) b.id: b,
    };
    return (posts: posts, profiles: profiles, books: books);
  },
);
