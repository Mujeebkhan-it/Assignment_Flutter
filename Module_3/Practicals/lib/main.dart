import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicals/Practicals/task_36.dart';
import 'package:practicals/Practicals/task_20.dart';
import 'package:practicals/Practicals/task_21.dart';
import 'package:practicals/Practicals/task_22.dart';
import 'package:practicals/Practicals/task_23.dart';
import 'package:practicals/Practicals/task_24.dart';
import 'package:practicals/Practicals/task_25.dart';
import 'package:practicals/Practicals/task_27.dart';
import 'package:practicals/Practicals/task_28.dart';
import 'package:practicals/Practicals/task_29.dart';
import 'package:practicals/Practicals/task_30.dart';
import 'package:practicals/Practicals/task_31.dart';
import 'package:practicals/Practicals/task_32.dart';
import 'package:practicals/Practicals/task_33.dart';
import 'package:practicals/Practicals/task_34.dart';
import 'package:practicals/Practicals/task_35.dart';
import 'package:practicals/Practicals/task_38.dart';
import 'package:practicals/Practicals/task_41.dart';
import 'package:practicals/Practicals/task_42.dart';
import 'package:practicals/Practicals/task_43.dart';
import 'package:practicals/Practicals/task_44.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Practicals',
      home: Task36(),
    );
    //  title: 'Three Screen App',
    // initialRoute: '/',
    // routes: {
    //   '/': (context) => HomeScreen(),
    //   '/details': (context) => DetailsScreen(),
    //   '/settings': (context) => SettingsScreen(),
    // },
    // );
    // return GetMaterialApp(
    //   home: ShoppingCartPage(),
    // );
  }
}

// flutter run -d chrome --web-renderer html
