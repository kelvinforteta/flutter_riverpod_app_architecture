import 'package:flutter_riverpod_app_architecture/feature/post/domain/models/post.dart';

abstract class PostService {
  Future<List<Post>> getPostListUseCase();
}
