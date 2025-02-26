// Make a button with a pulsing effect using TweenAnimationBuilder to change the button size.

import 'package:flutter/material.dart';

class Task35 extends StatefulWidget {
  const Task35({super.key});

  @override
  State<Task35> createState() => _Task35State();
}

class _Task35State extends State<Task35> with SingleTickerProviderStateMixin {

   late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  
 @override
  void initState() {
    super.initState();
    
    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true); // Repeat animation in reverse (pulsing effect)

    // Define the scale animation
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation, // Apply scale animation
      child: GestureDetector(
        onTap: () {
          print("Button tapped!");
        },
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Pulsing Button'),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}