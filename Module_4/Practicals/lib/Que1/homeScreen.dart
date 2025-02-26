import 'package:flutter/material.dart';
import 'package:practicals/Que1/dashboard.dart';
import 'package:practicals/Que1/details.dart';
import 'package:practicals/Que1/products.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget myContainer = MyDashboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 224, 188, 229),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 228, 148, 242),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 60,
                  width: MediaQuery.of(context).size.width - 25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            myContainer = MyHomePage();
                          });
                        },
                        child: Icon(
                          Icons.home,
                          size: 34,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            myContainer = myProducts();
                          });
                        },
                        child: Text(
                          "PRODUCTS",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            myContainer = myDetails();
                          });
                        },
                        child: Text(
                          "DETAILS",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 100,
              child: Container(
                height: MediaQuery.of(context).size.height - 100,
                width: MediaQuery.of(context).size.width,
                child: myContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
