// Build a to-do list app using Hive or SQLite with functionality to add, update, delete,
// and view tasks.
import 'package:flutter/material.dart';
import 'package:question2/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HoneScreen(),
    );
  }
}