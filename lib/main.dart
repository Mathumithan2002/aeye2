import 'package:aeye/screens/HomePage.dart';
import 'package:flutter/material.dart';

// Import your screen here

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // This is your custom screen
    );
  }
}
