// Add a fade-in animation to an image using FadeInImage when it’s loaded from a network source.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Task33 extends StatefulWidget {
  const Task33({super.key});

  @override
  State<Task33> createState() => _Task33State();
}

class _Task33State extends State<Task33> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: FadeInImage.assetNetwork(
            image: 'https://thumbs.dreamstime.com/b/cheerful-smiling-young-male-model-wearing-white-shirt-summer-scenery-cheerful-smiling-young-male-model-127286219.jpg', 
            placeholder: 'assets/images/myimg.jpeg', 
            fadeInDuration: const Duration(seconds: 1), 
          ),
        ),
      ),
    );
  }
}
