import 'package:flutter/material.dart';

class Task36 extends StatefulWidget {
  const Task36({super.key});

  @override
  State<Task36> createState() => _Task36State();
}

class _Task36State extends State<Task36> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to SecondScreen with custom slide transition
            Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return SecondScreen(); // The screen to navigate to
              },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                // Define a slide transition
                var begin = Offset(1.0, 0.0); // Slide from the right
                var end = Offset.zero; // Slide to the original position
                var curve = Curves.easeInOut;
                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(position: offsetAnimation, child: child);
              },
            ));
          },
          child: Text('Go to Second Screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Go back to the previous screen with custom slide transition
            Navigator.of(context).pop();
          },
          child: Text('Go Back'),
        ),
      ),
    );
  }
}
