import 'package:flutter/material.dart';
import 'package:flutter_riverpod_app_architecture/feature/post/data/data_sources/post_data_source_impl.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  void getData() async {
    final data = await PostDataSourceImpl().fetchPosts();
    print('data: ${data[0].title}');
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
