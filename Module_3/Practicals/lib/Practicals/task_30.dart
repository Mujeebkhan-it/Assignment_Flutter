// Build a basic profile page where the profile image is centered on the screen using
// Positioned inside a Stack, and other details (like name and bio) are displayed below.

import 'package:flutter/material.dart';

class Task30 extends StatefulWidget {
  const Task30({super.key});

  @override
  State<Task30> createState() => _Task30State();
}

class _Task30State extends State<Task30> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Profile'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment
              .center, // Ensures children are aligned to the center of the Stack
          children: [
            // Profile Image
            Positioned(
              top: 50.0, // Position the image 50px from the top
              child: CircleAvatar(
                radius: 80.0, // Radius of the profile image
                backgroundImage: NetworkImage(
                    'https://png.pngtree.com/png-clipart/20230927/original/pngtree-man-avatar-image-for-profile-png-image_13001882.png'), // Profile Image URL
              ),
            ),
            Positioned(
              top: 220,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Mujeeb Khan',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0), // Add some space between name and bio
                  Text(
                    'Flutter Developer',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
