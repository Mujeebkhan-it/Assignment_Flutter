import 'package:flutter/material.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.deepOrange[200],
      child: Text(
        "Home",
        style: TextStyle(
          fontSize: 26,
        ),
      ),
    );
  }
}
