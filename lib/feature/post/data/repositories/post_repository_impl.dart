import 'package:flutter_riverpod_app_architecture/feature/post/data/data_sources/post_data_source.dart';
import 'package:flutter_riverpod_app_architecture/feature/post/data/data_sources/post_data_source_impl.dart';
import 'package:flutter_riverpod_app_architecture/feature/post/data/dtos/post_dto.dart';
import 'package:flutter_riverpod_app_architecture/feature/post/domain/models/post.dart';

import 'post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDataSource _postDataSource;
  PostRepositoryImpl({PostDataSource? postDataSource})
      : _postDataSource = postDataSource ?? PostDataSourceImpl();
  @override
  Future<List<Post>> getPosts() async {
    final List<PostDto> postDto = await _postDataSource.fetchPosts();
    return postDto
        .map(
          (post) => Post(
            id: post.id ?? 0,
            title: post.title ?? '',
            body: post.body,
          ),
        )
        .toList();
  }
}
