// Make a simple task manager app with a form to add tasks. Use CheckboxListTile widgets to
// mark tasks as completed.

import 'package:flutter/material.dart';

class Task20 extends StatefulWidget {
  const Task20({super.key});

  @override
  State<Task20> createState() => _Task20State();
}

// Task class to store task details
class Task {
  String name;
  bool isCompleted;

  Task({required this.name, this.isCompleted = false});
}

class _Task20State extends State<Task20> {
  List<Task> tasks = [];

  // Controller for TextFormField to add tasks
  final TextEditingController _taskController = TextEditingController();

  // Function to add a new task
  void _addTask() {
    final taskText = _taskController.text;
    if (taskText.isNotEmpty) {
      setState(() {
        tasks.add(Task(name: taskText, isCompleted: false));
      });
      _taskController.clear(); // Clear input field
    }
  }

  // Function to toggle task completion status
  void _toggleTaskCompletion(int index) {
    setState(() {
      tasks[index].isCompleted = !tasks[index].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Input field to add a task
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                labelText: 'Enter task',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            // Button to add a task
            ElevatedButton(
              onPressed: _addTask,
              child: const Text('Add Task'),
            ),
            const SizedBox(height: 20),

            // Display tasks
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(tasks[index].name),
                    value: tasks[index].isCompleted,
                    onChanged: (_) => _toggleTaskCompletion(index),
                    controlAffinity: ListTileControlAffinity.leading,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
