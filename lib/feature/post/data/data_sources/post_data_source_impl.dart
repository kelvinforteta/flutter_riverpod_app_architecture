import 'dart:convert';

import 'package:flutter_riverpod_app_architecture/feature/post/data/data_sources/post_data_source.dart';
import 'package:flutter_riverpod_app_architecture/feature/post/data/dtos/post_dto.dart';
import 'package:http/http.dart';

class PostDataSourceImpl implements PostDataSource {
  final Client _client;

  PostDataSourceImpl({Client? client}) : _client = client ?? Client();

  @override
  Future<List<PostDto>> fetchPosts() async {
    try {
      final response = await _client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      final List rawJson = jsonDecode(response.body) as List;
      return rawJson.map((data) => PostDto.fromJson(data)).toList();
    } catch (_) {
      rethrow;
    }
  }
}
