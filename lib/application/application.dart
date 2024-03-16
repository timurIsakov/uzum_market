import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uzum Market',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const SizedBox(),
    );
  }
}
