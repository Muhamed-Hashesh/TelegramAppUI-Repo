import 'package:flutter/material.dart';
import 'package:telegram_clone_app/views/root_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telegram App',
      debugShowCheckedModeBanner: false,
      routes: {
        'root_app': (context) => const RootApp(),
      },
      initialRoute: 'root_app',
    );
  }
}
