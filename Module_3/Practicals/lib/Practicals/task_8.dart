// Create a screen with ListView.builder to display a list of names. When tapped, each name
// should print "Name tapped" in the console.

import 'package:flutter/material.dart';

class Task8 extends StatefulWidget {
  const Task8({super.key});

  @override
  State<Task8> createState() => _Task8State();
}

class _Task8State extends State<Task8> {
  List<String> myList = ["Mujeeb", "Sachin", "Shahrukh", "Salman"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: myList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: InkWell(
                    onTap: () {
                      print("Name ${myList[index]} tapped");
                    },
                    child: Card(
                      elevation: 12,
                      color: Colors.blue[200],
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: InkWell(
                          child: Text(myList[index]),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
