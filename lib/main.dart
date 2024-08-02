import 'package:cricker_app/Pages_/home_page.dart';
import 'package:cricker_app/themes/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeDataProvider>(
      create: (context) => ThemeDataProvider(),
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: context.watch<ThemeDataProvider>().getTheme,
    );
  }
}
