//Custom progress bar
import 'package:flutter/material.dart';

class Task42 extends StatelessWidget {
  const Task42({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ProgressBar(percentage: 70),
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  final double percentage;

  // Constructor to receive the percentage input
  ProgressBar({required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 300, 
          height: 20, 
          decoration: BoxDecoration(
            color: Colors.grey[300],  
            borderRadius: BorderRadius.circular(10),  
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 3 * percentage,  
              height: 20,
              decoration: BoxDecoration(
                color: Colors.blue,  
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          '${percentage.toStringAsFixed(0)}%',  
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}