// Create a shopping cart app with a list of items and an "Add to Cart" button for each. When
// the button is pressed, update a counter in the AppBar showing the total items in the cart

import 'package:flutter/material.dart';

class Task10 extends StatefulWidget {
  const Task10({super.key});

  @override
  State<Task10> createState() => _Task10State();
}

class _Task10State extends State<Task10> {
  List<String> myList = ["Item1", "Item2", "Item3", "Item4"];
  List<int> cartCounts = [0, 0, 0, 0];

  int counter = 0;

  void addtocart(int index) {
    setState(() {
      cartCounts[index]++;
      counter++;
    });
  }

  void removefromcart(int index) {
    if (cartCounts[index] > 0) {
      setState(() {
        cartCounts[index]--;
        counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Shopping App",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Chip(
              label: Text(
                "$counter",
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: myList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(myList[index]),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      removefromcart(index);
                    },
                  ),
                  Text("${cartCounts[index]}"),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      addtocart(index);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
