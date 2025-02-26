// Create a two-screen app. The first screen should have a button that navigates to the second
// screen. Display a welcome message on the second screen.

import 'package:flutter/material.dart';

class Task21 extends StatefulWidget {
  const Task21({super.key});

  @override
  State<Task21> createState() => _Task21State();
}

class _Task21State extends State<Task21> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the second screen when the button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            );
          },
          child: const Text('Go to Second Screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: const Text(
          'Welcome to the Second Screen!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}