import 'package:flutter_riverpod/flutter_riverpod.dart';

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
