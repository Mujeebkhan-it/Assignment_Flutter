import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Notes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NotesScreen(),
    );
  }
}

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  TextEditingController _noteController = TextEditingController();
  String _savedNote = "No note saved.";

  @override
  void initState() {
    super.initState();
    _loadNote();
  }

  // Function to load the saved note from SharedPreferences
  Future<void> _loadNote() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedNote = prefs.getString('saved_note') ?? "No note saved.";
    });
  }

  // Function to save the note to SharedPreferences
  Future<void> _saveNote() async {
    String note = _noteController.text;
    if (note.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('saved_note', note);
      setState(() {
        _savedNote = note;
      });
      _noteController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Note cannot be empty')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Notes App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _noteController,
              decoration: const InputDecoration(
                hintText: 'Enter your note here',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveNote,
              child: const Text('Save Note'),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Saved Note: $_savedNote',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
