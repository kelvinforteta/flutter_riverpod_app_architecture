import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_app_architecture/feature/post/domain/models/post.dart';

abstract class PostController extends AsyncNotifier<List<Post>> {
  Future<void> dispatchGetPostList();
}
