import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/post.dart';
import '../domain/repositories/post_repository.dart';
import 'repositories/dummy_post_repository.dart';

final postRepositoryProvider =
    Provider<PostRepository>((ref) => DummyPostRepository());

class PostsNotifier extends Notifier<List<Post>> {
  @override
  List<Post> build() => ref.watch(postRepositoryProvider).getPosts();

  void add(Post post) {
    state = ref.read(postRepositoryProvider).addPost(post);
  }
}

final postsProvider =
    NotifierProvider<PostsNotifier, List<Post>>(PostsNotifier.new);
