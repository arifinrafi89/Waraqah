import '../models/post.dart';

abstract class PostRepository {
  List<Post> getPosts();
}
