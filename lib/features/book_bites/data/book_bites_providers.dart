import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/post.dart';
import '../domain/repositories/post_repository.dart';
import 'repositories/dummy_post_repository.dart';

final postRepositoryProvider =
    Provider<PostRepository>((ref) => DummyPostRepository());

final postsProvider = StateProvider<List<Post>>(
  (ref) => ref.watch(postRepositoryProvider).getPosts(),
);
