// Create a bottom navigation bar to switch between multiple pages (e.g., Home, Profile, Settings).
import 'package:flutter/material.dart';
import 'package:practicals/Que3/myAccountScreen.dart';
import 'package:practicals/Que3/myFavScreen.dart';
import 'package:practicals/Que3/myHomeScreen.dart';

class Bottomnavbar1 extends StatefulWidget {
  const Bottomnavbar1({super.key});

  @override
  State<Bottomnavbar1> createState() => _Bottomnavbar1State();
}

class _Bottomnavbar1State extends State<Bottomnavbar1> {
  List<Widget> myList = [MyHomeScreen(), MyProfilescreen(), MySettingScreen()];
  int? _selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Bar'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Center(
          child: Text(
            "${myList[_selectedindex!]}",
            style: TextStyle(
              fontSize: 26,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[200],
        selectedItemColor: Colors.pinkAccent[200],
        unselectedItemColor: Colors.white,
        currentIndex: _selectedindex!,
        onTap: (value) {
          setState(() {
            _selectedindex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
