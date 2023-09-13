import 'package:flutter/material.dart';

void main() {
  runApp(const SLACommonApp());
}

class SLACommonApp extends StatelessWidget {
  const SLACommonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      showSemanticsDebugger: false,
      home: Scaffold(
        backgroundColor: Colors.pink,
      ),
    );
  }
}
