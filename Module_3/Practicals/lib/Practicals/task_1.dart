// Task 1:
// Create a simple "Hello World" Flutter app with a Text widget displaying "Hello, Flutter!"
// centered on the screen.

import 'package:flutter/material.dart';

class Task1 extends StatelessWidget {
  const Task1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Hello World'),
      ),
      body: const Center(
        child: Text("Hello, Flutter!"),
      ),
    );
  }
}
