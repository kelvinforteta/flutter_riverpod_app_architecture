import 'package:flutter_riverpod_app_architecture/feature/post/application/services/post_service.dart';
import 'package:flutter_riverpod_app_architecture/feature/post/data/repositories/post_repository.dart';
import 'package:flutter_riverpod_app_architecture/feature/post/data/repositories/post_repository_impl.dart';
import 'package:flutter_riverpod_app_architecture/feature/post/domain/models/post.dart';

class PostServiceImpl implements PostService {
  final PostRepository _postRepository;

  PostServiceImpl({PostRepository? postRepository})
      : _postRepository = postRepository ?? PostRepositoryImpl();
  @override
  Future<List<Post>> getPostListUseCase() async {
    try {
      return await _postRepository.getPosts();
    } catch (e) {
      throw Exception('Error fetching post');
    }
  }
}
