import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/app_style.dart';
import 'package:tictactoe/views/home.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        scaffoldBackgroundColor: AppStyle.scaffoldBackgroundColor,
        appBarTheme: AppBarTheme(color: Colors.transparent, elevation: 0, foregroundColor: Colors.white),
        cardColor: AppStyle.blockColor,
      ),
      home: Home(),
    );
  }
}
