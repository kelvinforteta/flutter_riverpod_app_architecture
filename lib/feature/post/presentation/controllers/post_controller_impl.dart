import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_app_architecture/feature/post/application/services/post_service.dart';
import 'package:flutter_riverpod_app_architecture/feature/post/application/services/post_service_impl.dart';
import 'package:flutter_riverpod_app_architecture/feature/post/domain/models/post.dart';
import 'package:flutter_riverpod_app_architecture/feature/post/presentation/controllers/post_controller.dart';

class PostControllerImpl extends PostController {
  final PostService _postService;

  PostControllerImpl({PostService? postService})
      : _postService = postService ?? PostServiceImpl();

  @override
  FutureOr<List<Post>> build() async {
    return await _postService.getPostListUseCase();
  }

  @override
  Future<void> dispatchGetPostList() async {
    // loading state
    state = const AsyncLoading();
    try {
      final List<Post> posts = await _postService.getPostListUseCase();
      // data state
      state = AsyncData(posts);
    } catch (e) {
      // error state
      state = AsyncError(e.toString(), StackTrace.current);
    }
  }
}

final postControllerProvider =
    AsyncNotifierProvider<PostController, List<Post>>(
        () => PostControllerImpl());
