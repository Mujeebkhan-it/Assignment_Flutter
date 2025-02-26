// Design a custom button with an icon positioned above the text. Use Stack to overlay the
// icon slightly on top of the text.

import 'package:flutter/material.dart';

class Task32 extends StatelessWidget {
  const Task32({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advance UI'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 50.0,
            left: 150.0,
            child: GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Button Pressed!')),
                );
              },
              child: Container(
                width: 200.0,
                height: 100.0,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),

                // Stack to overlay the icon on top of the text
              ),
            ),
          ),
          Positioned(
            top: 75.0,
            left: 230.0,
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 34.0,
            ),
          ),
          Positioned(
            top: 85.0,
            left: 190.0,
            child: Text(
              "Some Text",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
