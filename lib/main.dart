import 'package:flutter/material.dart';
import 'package:sla_common/sla_common.dart';

void main() {
  runApp(const SLACommonApp());
}

class SLACommonApp extends StatelessWidget {
  const SLACommonApp({super.key});

  @override
  Widget build(BuildContext context) {
    var sd = Calculator();
    return const MaterialApp(
      showSemanticsDebugger: false,
      home: Scaffold(
        backgroundColor: Colors.pink,
      ),
    );
  }
}
