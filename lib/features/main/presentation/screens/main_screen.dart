import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.grey,
    ),
    Container(
      color: Colors.purple,
    ),
    Container(
      color: Colors.orange,
    ),
  ];

  int currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentScreen],
    );
  }
}
