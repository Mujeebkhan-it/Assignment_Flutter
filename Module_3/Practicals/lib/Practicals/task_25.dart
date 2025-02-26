// Build a to-do list app where users can add tasks. Use ListView.builder to display the list of
// tasks and allow each task to be removed with a swipe gesture.

import 'package:flutter/material.dart';

class Task25 extends StatefulWidget {
  const Task25({super.key});

  @override
  State<Task25> createState() => _Task25State();
}

class _Task25State extends State<Task25> {
  List<String> _tasks = [];

  // TextEditingController for adding tasks
  final TextEditingController _controller = TextEditingController();

  // Method to add a new task
  void _addTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _tasks.add(_controller.text);
        _controller.clear();
      });
    }
  }

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
        title: Text('To-Do List'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          // Input field to add tasks
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Enter a new task',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addTask,
                ),
              ],
            ),
          ),

          // ListView.builder to display tasks
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(_tasks[index]),
                  onDismissed: (direction) {
                    // Remove the task when dismissed
                    _removeTask(index);

                    // Show a snack bar when the task is removed
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Task removed')),
                    );
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  child: ListTile(
                    title: Text(_tasks[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
