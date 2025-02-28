import 'package:flutter/material.dart';
import 'db_model.dart';
import 'db_service.dart';

class HoneScreen extends StatefulWidget {
  const HoneScreen({super.key});

  @override
  State<HoneScreen> createState() => _HoneScreenState();
}

class _HoneScreenState extends State<HoneScreen> {

  final DatabaseHelper _dbHelper = DatabaseHelper.instance;
  List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final tasks = await _dbHelper.getTasks();
    setState(() {
      _tasks = tasks;
    });
  }

  void _showTaskDialog({Task? task}) {
    final _titleController = TextEditingController(text: task?.title ?? '');
    final _descController = TextEditingController(text: task?.description ?? '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(task == null ? 'Add Task' : 'Edit Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: _titleController, decoration: InputDecoration(labelText: 'Title')),
              TextField(controller: _descController, decoration: InputDecoration(labelText: 'Description')),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                if (_titleController.text.trim().isEmpty) return;

                final newTask = Task(
                  id: task?.id,
                  title: _titleController.text,
                  description: _descController.text,
                  isCompleted: task?.isCompleted ?? false,
                );

                if (task == null) {
                  await _dbHelper.addTask(newTask);
                } else {
                  await _dbHelper.updateTask(newTask);
                }

                Navigator.pop(context);
                _loadTasks();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteTask(int id) async {
    await _dbHelper.deleteTask(id);
    _loadTasks();
  }

  void _toggleComplete(Task task) async {
    task.isCompleted = !task.isCompleted;
    await _dbHelper.updateTask(task);
    _loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To-Do List')),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];
          return ListTile(
            title: Text(task.title, style: TextStyle(decoration: task.isCompleted ? TextDecoration.lineThrough : null)),
            subtitle: Text(task.description ?? ''),
            leading: Checkbox(
              value: task.isCompleted,
              onChanged: (value) => _toggleComplete(task),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon: Icon(Icons.edit), onPressed: () => _showTaskDialog(task: task)),
                IconButton(icon: Icon(Icons.delete), onPressed: () => _deleteTask(task.id!)),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showTaskDialog(),
      ),
    );
  }
}
