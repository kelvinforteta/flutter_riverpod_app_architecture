import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_app_architecture/feature/post/presentation/controllers/post_controller_impl.dart';
import 'package:flutter_riverpod_app_architecture/feature/post/presentation/states/post_data.dart';
import 'package:flutter_riverpod_app_architecture/feature/post/presentation/states/post_error.dart';
import 'package:flutter_riverpod_app_architecture/feature/post/presentation/states/post_loading.dart';

class PostPage extends ConsumerWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postProvider = ref.watch(postControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: postProvider.when(
          data: (data) => Column(
              children: data
                  .map((e) => PostData(
                        title: e.title,
                        body: e.body ?? '',
                      ))
                  .toList()),
          error: (err, stack) {
            return PostError(error: err.toString());
          },
          loading: () => const PostLoading(),
        ),
      ),
    );
  }
}
