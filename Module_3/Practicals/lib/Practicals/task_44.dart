// Develop a custom AvatarBadge widget that shows a user’s avatar with an optional
// online/offline status indicator.

import 'package:flutter/material.dart';

class Task44 extends StatelessWidget {
  final String avatarUrl; 
  final bool isOnline; 
  final double size; 
  final BorderRadiusGeometry borderRadius; 
  
  Task44({
    required this.avatarUrl,
    this.isOnline = false,
    this.size = 50.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(50.0)),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        ClipRRect(
          borderRadius: borderRadius,
          child: Image.network(
            avatarUrl,
            width: size,
            height: size,
            fit: BoxFit.cover,
          ),
        ),
        

        if (isOnline)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 15.0,
              height: 15.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green, 
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
            ),
          ),
        if (!isOnline)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 15.0,
              height: 15.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red, 
                border: Border.all(
                  color: Colors.white, 
                  width: 2.0,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
