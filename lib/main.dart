import 'package:flutter/material.dart';
import 'package:hw_10/pages/home.dart';

void main() {
  runApp(const SixApp());
}

class SixApp extends StatelessWidget {
  const SixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());
  }
}
