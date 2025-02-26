import 'package:flutter/material.dart';

class MySettingScreen extends StatelessWidget {
  const MySettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.deepPurple[300],
      child: Text(
        "Favourite",
        style: TextStyle(
          fontSize: 26,
        ),
      ),
    );
  }
}
