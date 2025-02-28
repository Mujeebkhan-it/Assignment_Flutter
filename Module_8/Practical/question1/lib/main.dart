import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  // Load the saved preference from shared_preferences
  _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('darkMode') ?? false; // Default to false
    });
  }

  // Save the preference to shared_preferences
  _savePreferences(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Task1(
        isDarkMode: _isDarkMode,
        onDarkModeChanged: (bool value) {
          setState(() {
            _isDarkMode = value;
          });
          _savePreferences(value); // Save the updated preference
        },
      ),
    );
  }
}

class Task1 extends StatelessWidget {
  final bool isDarkMode;
  final Function(bool) onDarkModeChanged;

  const Task1({Key? key, required this.isDarkMode, required this.onDarkModeChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Preferences'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Dark Mode: ${isDarkMode ? "Enabled" : "Disabled"}',
                style: TextStyle(fontSize: 24),
              ),
              Switch(
                value: isDarkMode,
                onChanged: (bool value) {
                  onDarkModeChanged(value); // Notify parent widget about the change
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
