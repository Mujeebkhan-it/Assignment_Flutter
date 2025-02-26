import 'package:flutter/material.dart';

class Task_4 extends StatefulWidget {
  const Task_4({super.key});

  @override
  State<Task_4> createState() => _Task_4State();
}

class _Task_4State extends State<Task_4> {
  void displayDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: const Text("Congratulations"),
      content: const Text("logged in successfully"),
      actions: [
        ElevatedButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          label: const Text("Thank You"),
          icon: const Icon(Icons.done, color: Colors.green),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => alert);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 113, 70, 213),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          Positioned(
            right: -50,
            top: 50,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 113, 70, 213),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          const Positioned(
            top: 100,
            left: 170,
            right: 100,
            child: Text(
              "Welcome Back",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          const Positioned(
            top: 120,
            left: 110,
            right: 80,
            child: Image(
              image: AssetImage("assets/images/login2.png"),
              height: 250,
              width: 400,
            ),
          ),
          Positioned(
            top: 350,
            left: 50,
            right: 50,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Username",
                  iconColor: const Color.fromARGB(255, 113, 70, 213),
                  fillColor: Colors.purple[300],
                  icon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 420,
            left: 50,
            right: 50,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  iconColor: const Color.fromARGB(255, 113, 70, 213),
                  fillColor: Colors.purple[300],
                  icon: const Icon(Icons.password),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 85,
            right: 50,
            top: 500,
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 113, 70, 213),
                  ),
                ),
                onPressed: () {
                  displayDialog(context);
                },
                child: const Text(
                  "LOGIN",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Positioned(
            top: 650,
            // left: 10,
            // right: 10,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey[300],
              ),
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Container(
                margin: const EdgeInsets.only(left: 110, top: 25),
                child: const Text(
                  "Don't have an account? Sign Up",
                  style: TextStyle(color: Colors.purple, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
