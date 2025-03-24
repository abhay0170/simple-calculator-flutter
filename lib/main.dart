import 'package:flutter/material.dart';
import 'package:simple_calculator/homepage.dart';
// import 'package:simple_calculator/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      // theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      home: Homepage(),
    );
  }
}
