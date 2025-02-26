// Make a toggle switch that changes the app’s background color when turned on or off. Use
// the
// Switch widget to handle the toggle state.
import 'package:flutter/material.dart';

class Task12 extends StatefulWidget {
  const Task12({super.key});

  @override
  State<Task12> createState() => _Task12State();
}

class _Task12State extends State<Task12> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isSwitched ? Colors.blue : Colors.white,
      appBar: AppBar(
        title: const Text('Task 12'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
            });
          },
        ),
      ),
    );
  }
}
