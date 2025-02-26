// Use a Stack widget to create an overlay effect, where a centered image has a partially
// transparent overlay with some text.

import 'package:flutter/material.dart';

class Task29 extends StatefulWidget {
  const Task29({super.key});

  @override
  State<Task29> createState() => _Task29State();
}

class _Task29State extends State<Task29> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overlay Effect'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                'https://png.pngtree.com/thumb_back/fh260/background/20220216/pngtree-mobile-app-flash-landscape-image_937181.jpg', // Example image URL
                width: 400.0,
                height: 300.0,
                fit: BoxFit.cover,
              ),
            ),
            
            // The partially transparent overlay
            Container(
              width: 400.0,
              height: 300.0,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5), // Black overlay with 50% opacity
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),

            // The text on top of the overlay
            Positioned(
              child: Text(
                'Overlay Text',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}