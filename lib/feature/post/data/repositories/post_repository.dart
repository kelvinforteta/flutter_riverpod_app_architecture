import '../../domain/models/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
}
