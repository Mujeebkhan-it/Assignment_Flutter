// Implement a custom-styled list using ListTile widgets with leading icons, titles, and trailing
// icons (like a delete button).

import 'package:flutter/material.dart';

class Task27 extends StatefulWidget {
  const Task27({super.key});

  @override
  State<Task27> createState() => _Task27State();
}

class _Task27State extends State<Task27> {
  // Sample list of tasks (data)
  List<String> _tasks = [
    'Buy groceries',
    'Walk the dog',
    'Complete Flutter project'
  ];

  // Method to remove a task from the list
  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Styled List'),
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            elevation: 4.0,
            child: ListTile(
              leading: Icon(Icons.check_circle_outline,
                  color: Colors.green), // Leading icon
              title: Text(
                _tasks[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete,
                    color: Colors.red), // Trailing delete icon
                onPressed: () => _removeTask(index),
              ),
              onTap: () {
                // Handle on tap if you want to add any action
                print('Tapped on: ${_tasks[index]}');
              },
            ),
          );
        },
      ),
    );
  }
}
