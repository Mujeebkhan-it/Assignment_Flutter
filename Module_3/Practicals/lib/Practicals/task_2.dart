// Task 2:
// Build a Flutter app with an AppBar that has a title and a FloatingActionButton. Use the
// button to increment a counter displayed in the center of the screen.

import 'package:flutter/material.dart';

class Task2 extends StatefulWidget {
  const Task2({super.key});

  @override
  State<Task2> createState() => _Task2State();
}

class _Task2State extends State<Task2> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task 2"),
      ),
      body: Row(
        children: [
          FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                _counter++;
              });
            },
            label: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 50,
          ),
          Text(
            _counter.toString(),
            style: const TextStyle(fontSize: 25),
          ),
        ],
      ),
    );
  }
}
