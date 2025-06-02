import 'package:flutter/material.dart';
import 'summary_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Özetleyici',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SummaryPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
