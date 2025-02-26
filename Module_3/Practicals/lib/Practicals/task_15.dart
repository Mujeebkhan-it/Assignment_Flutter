// Add an Image.asset widget to display an image from your local assets folder. Experiment
// with different BoxFit properties like cover, contain, and fill.
import 'package:flutter/material.dart';

class Task15 extends StatefulWidget {
  const Task15({super.key});

  @override
  State<Task15> createState() => _Task15State();
}

class _Task15State extends State<Task15> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 15'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: SizedBox(
          height: 500,
          width: 500,
          child: Image.asset(
            'assets/images/myimg.jpeg',
            // width: 200,
            // height: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
