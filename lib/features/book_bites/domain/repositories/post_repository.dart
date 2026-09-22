import '../models/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();

  /// Adds [post] to the newest end of the feed and returns the updated list.
  Future<List<Post>> addPost(Post post);
}
