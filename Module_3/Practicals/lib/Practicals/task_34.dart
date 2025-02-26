// Create a button that, when pressed, expands or collapses a section of content using the
// AnimatedContainer widget.

import 'package:flutter/material.dart';

class Task34 extends StatefulWidget {
  const Task34({super.key});

  @override
  State<Task34> createState() => _Task34State();
}

class _Task34State extends State<Task34> {

  bool _isExpanded = false;

  // Function to toggle the expansion state
  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _toggleExpansion,
          child: Text(_isExpanded ? 'Collapse' : 'Expand'),
        ),
        SizedBox(height: 10),
        AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          height: _isExpanded ? 200 : 0, // Toggle the height
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(10),
          child: _isExpanded
              ? Text(
                  'This is the expanded content. You can put more widgets here!',
                  style: TextStyle(color: Colors.white),
                )
              : null, // No content when collapsed
        ),
      ],
    );
  }
}