import 'package:flutter/material.dart';

class PostError extends StatelessWidget {
  const PostError({super.key, required this.error});
  final String error;

  @override
  Widget build(BuildContext context) {
    return Text(error);
  }
}
