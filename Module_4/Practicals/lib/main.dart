import 'package:flutter/material.dart';
import 'package:practicals/Que1/homeScreen.dart';
import 'package:practicals/Que2/q_2.dart';
import 'package:practicals/Que3/bottomNavBar1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Module 4",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Bottomnavbar1(),
    );
  }
}

// flutter run -d chrome --web-renderer html
