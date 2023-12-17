import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_app_architecture/feature/post/presentation/post_page.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  //needed to ensure binding was initialized
  WidgetsFlutterBinding.ensureInitialized();

  // this was added to allow the App
  // Title show up on Windows App
  await WindowManager.instance.ensureInitialized();
  windowManager.waitUntilReadyToShow().then((_) async {
    await windowManager.setTitle('Flutter Riverpod Architecture');
    await windowManager.center(animate: true);
  });

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Riverpod Architecture',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PostPage(),
    );
  }
}
