// Design a search bar using TextField and display suggestions below as the user types. Filter
// suggestions based on input.

import 'package:flutter/material.dart';

class Task19 extends StatefulWidget {
  const Task19({super.key});

  @override
  State<Task19> createState() => _Task19State();
}

class _Task19State extends State<Task19> {

  // List of predefined items to search from
  final List<String> _allItems = [
    'Apple',
    'Banana',
    'Grapes',
    'Mango',
    'Orange',
    'Pineapple',
    'Strawberry',
    'Watermelon',
    'Blueberry',
    'Raspberry',
  ];

  // The filtered list of items based on the search query
  List<String> _filteredItems = [];

  // Controller for the TextField
  TextEditingController _searchController = TextEditingController();

  // Function to filter items based on user input
  void _filterSearchResults(String query) {
    List<String> results = [];
    if (query.isEmpty) {
      results = _allItems;
    } else {
      results = _allItems.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
    }
    setState(() {
      _filteredItems = results;
    });
  }

  @override
  void initState() {
    super.initState();
    // Initialize with all items when the page loads
    _filteredItems = _allItems;
    // Set up a listener for TextField to trigger filtering as the user types
    _searchController.addListener(() {
      _filterSearchResults(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose(); // Dispose controller when not needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search with Suggestions'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Search bar (TextField)
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search for fruits',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            
            SizedBox(height: 20), // Spacer between search bar and suggestions

            // Display filtered suggestions below the search bar
            Expanded(
              child: ListView.builder(
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredItems[index]),
                    onTap: () {
                      // Action when an item is tapped, e.g., showing the item details
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('You selected ${_filteredItems[index]}')),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}