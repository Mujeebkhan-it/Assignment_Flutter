// Custom rating bar

import "package:flutter/material.dart";

class Task41 extends StatefulWidget {
  const Task41({super.key});

  @override
  State<Task41> createState() => _Task41State();
}

class _Task41State extends State<Task41> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RatingWidget(),
      ),
    );
  }
}

class RatingWidget extends StatefulWidget {
  @override
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  int _rating = 0; 

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _rating = index + 1; 
            });
          },
          child: Icon(
            index < _rating ? Icons.star : Icons.star_border,
            color: index < _rating ? Colors.yellow : Colors.grey,
            size: 40.0,
          ),
        );
      }),
    );
  }
}
