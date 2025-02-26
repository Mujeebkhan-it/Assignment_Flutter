// Build a simple calculator UI with RaisedButton or ElevatedButton widgets for numbers and
// operations. Display the result at the top of the screen.

import 'package:flutter/material.dart';

class Task9 extends StatefulWidget {
  const Task9({super.key});

  @override
  State<Task9> createState() => _Task9State();
}

class _Task9State extends State<Task9> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  double? _ans = 0;

  double? _calculateResult(String num1, String num2, String operation) {
    double? n1 = double.tryParse(num1);
    double? n2 = double.tryParse(num2);

    if (n1 == null || n2 == null) {
      return null;
    }

    switch (operation) {
      case 'Addition':
        return n1 + n2;
      case 'Subtraction':
        return n1 - n2;
      case 'Multiplication':
        return n1 * n2;
      case 'Division':
        if (n2 == 0) {
          return null;
        }
        return n1 / n2;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 201, 147),
      appBar: AppBar(
        title: const Text('Task 9'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: Container(
              color: Colors.grey,
              child: Center(
                child: Text(
                  _ans == null ? "Invalid input" : "$_ans",
                  style: const TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter first number',
                hintText: "Enter a number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter second number',
                hintText: "Enter a number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _ans = _calculateResult(_num1Controller.text,
                          _num2Controller.text, 'Addition');
                      _num1Controller.clear();
                      _num2Controller.clear();
                    });
                  },
                  label: const Text("+"),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _ans = _calculateResult(_num1Controller.text,
                          _num2Controller.text, 'Subtraction');
                      _num1Controller.clear();
                      _num2Controller.clear();
                    });
                  },
                  label: const Text("-"),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _ans = _calculateResult(_num1Controller.text,
                          _num2Controller.text, 'Multiplication');
                      _num1Controller.clear();
                      _num2Controller.clear();
                    });
                  },
                  label: const Text("*"),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _ans = _calculateResult(_num1Controller.text,
                          _num2Controller.text, 'Division');
                      _num1Controller.clear();
                      _num2Controller.clear();
                    });
                  },
                  label: const Text("/"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
