// Create a navigation drawer that allows switching between three different screens: Home,
// Profile, and Settings

import 'package:flutter/material.dart';

class Task23 extends StatefulWidget {
  const Task23({super.key});

  @override
  State<Task23> createState() => _Task23State();
}

class _Task23State extends State<Task23> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Text(
          'Welcome to Home Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Text(
          'Welcome to Profile Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Screen'),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Text(
          'Welcome to Settings Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Navigation Drawer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              // Close the drawer and navigate to Home
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Task23()),
              );
            },
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              // Close the drawer and navigate to Profile
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              // Close the drawer and navigate to Settings
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
