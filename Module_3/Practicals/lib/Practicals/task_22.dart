// Develop a three-screen app with a home, details, and settings screen. Use
// Navigator.pushNamed for navigation, and pass data between screens.

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to details screen and pass data
            Navigator.pushNamed(
              context,
              '/details',
              arguments: 'Hello from Home Screen!',
            );
          },
          child: const Text('Go to Details Screen'),
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the data passed from the Home Screen
    final String data = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Received data: $data',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to settings screen
                Navigator.pushNamed(context, '/settings');
              },
              child: const Text('Go to Settings Screen'),
            ),
          ],
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
      body: Center(
        child: Text(
          'Settings go here!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
