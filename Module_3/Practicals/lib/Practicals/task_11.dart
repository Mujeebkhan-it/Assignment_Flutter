// Design a counter app with increment and decrement buttons. Use setState to update the
// displayed value as the buttons are pressed.
import 'package:flutter/material.dart';

class Task11 extends StatefulWidget {
  const Task11({super.key});

  @override
  State<Task11> createState() => _Task11State();
}

class _Task11State extends State<Task11> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        title: const Text("Task 2"),
        backgroundColor: Colors.purple[600],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _counter--;
                });
              },
              label: const Text(
                "Decreament",
              ),
              icon: const Icon(
                Icons.remove,
                color: Colors.red,
              ),
            ),
            Text(
              _counter.toString(),
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              label: const Text(
                "Increament",
              ),
              icon: const Icon(
                Icons.add,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
