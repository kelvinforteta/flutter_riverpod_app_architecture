import '../dtos/post_dto.dart';

abstract class PostDataSource {
  Future<List<PostDto>> fetchPosts();
}
