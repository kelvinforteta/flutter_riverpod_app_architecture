import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_app_architecture/feature/post/presentation/controllers/post_controller_impl.dart';

class PostPage extends ConsumerWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postProvider = ref.watch(postControllerProvider);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: postProvider.when(
          data: (data) =>
              Column(children: data.map((e) => Text('${e.title}')).toList()),
          error: (err, stack) => Text('$err'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
