// Design a bottom navigation bar with three tabs: News, Messages, and Profile. Change the
// displayed content based on the selected tab.

import 'package:flutter/material.dart';

class Task24 extends StatefulWidget {
  const Task24({super.key});

  @override
  State<Task24> createState() => _Task24State();
}

class _Task24State extends State<Task24> {

  int _selectedIndex = 0;  // To track the selected tab

  // List of widgets to display based on the selected tab
  final List<Widget> _screens = [
    NewsScreen(),
    MessagesScreen(),
    ProfileScreen(),
  ];

  // This method is called when a tab is selected
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;  // Update the selected tab index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Demo'),
      ),
      body: _screens[_selectedIndex],  // Display content based on selected tab
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,  // Highlight the selected tab
        onTap: _onItemTapped,  // Callback to handle tab change
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome to the News Section!',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'You have no new messages.',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'This is your Profile.',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}