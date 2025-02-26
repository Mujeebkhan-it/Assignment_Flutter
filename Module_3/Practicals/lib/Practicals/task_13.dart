// Create an app with an Image widget displaying a picture from the network. Add a button
// below the image to change the image source when pressed.
import 'package:flutter/material.dart';

class Task13 extends StatefulWidget {
  const Task13({super.key});

  @override
  State<Task13> createState() => _Task13State();
}

String? var1 =
    "https://static.vecteezy.com/system/resources/previews/015/277/319/non_2x/orange-fruit-3d-icon-png.png";

String? var2 =
    "https://e7.pngegg.com/pngimages/472/197/png-clipart-green-apple-juice-apple-fruit-nutrition-extract-fruit-food-icon-sketch-beautifully-green-apple-natural-foods-food.png";

class _Task13State extends State<Task13> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 13'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Center(
            child: Image.network(
              "$var1",
              height: 150,
              width: 150,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                var1 = var2;
              });
            },
            child: const Text("Change"),
          ),
        ],
      ),
    );
  }
}
