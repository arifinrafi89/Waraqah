import '../models/post.dart';

abstract class PostRepository {
  List<Post> getPosts();

  /// Adds [post] to the newest end of the feed and returns the updated list.
  List<Post> addPost(Post post);
}
