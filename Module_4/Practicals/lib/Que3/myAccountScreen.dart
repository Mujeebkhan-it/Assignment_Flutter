import 'package:flutter/material.dart';

class MyProfilescreen extends StatelessWidget {
  const MyProfilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: const Color.fromARGB(255, 219, 121, 249),
      child: Text(
        "Account",
        style: TextStyle(
          fontSize: 26,
        ),
      ),
    );
  }
}
