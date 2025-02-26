// Task 5:
// Create a responsive layout using a Row widget with three Container widgets, each with
// different background colors and widths.

import 'package:flutter/material.dart';

class Task5 extends StatelessWidget {
  const Task5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 5'),
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.amber[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.red[200],
              border: Border.all(
                color: Colors.red,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.teal[200],
              border: Border.all(
                color: Colors.teal,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue[200],
              border: Border.all(
                color: Colors.blue,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.4,
          ),
        ],
      ),
    );
  }
}
