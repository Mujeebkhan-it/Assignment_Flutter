// Build a feedback form with TextField widgets for entering name and comments, and a
// DropdownButton for selecting a feedback category.

import 'package:flutter/material.dart';

class Task18 extends StatefulWidget {
  const Task18({super.key});

  @override
  State<Task18> createState() => _Task18State();
}

class _Task18State extends State<Task18> {
  final _formKey = GlobalKey<FormState>(); // Global key for the form state
  String name = '';
  String comments = '';
  String selectedCategory = 'General'; // Default category

  // Categories for the feedback dropdown
  List<String> categories = [
    'General',
    'Bug Report',
    'Feature Request',
    'Compliment'
  ];

  // Form validation for Name
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  // Form validation for Comments
  String? validateComments(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your comments';
    }
    return null;
  }

  // Form validation for Category
  String? validateCategory(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a feedback category';
    }
    return null;
  }

  // Submit the form
  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // If the form is valid, display the submitted data
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Feedback submitted successfully!')),
      );
    } else {
      // If the form is invalid, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in the required fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback Form'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Attach the global key to the form
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Name TextField
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: validateName,
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),

              // Comments TextField
              TextFormField(
                decoration: InputDecoration(labelText: 'Comments'),
                maxLines: 5, // Allow multiple lines of comments
                validator: validateComments,
                onChanged: (value) {
                  setState(() {
                    comments = value;
                  });
                },
              ),

              // DropdownButton for selecting category
              DropdownButtonFormField<String>(
                value: selectedCategory,
                items: categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
                decoration: InputDecoration(labelText: 'Feedback Category'),
                validator: validateCategory,
              ),

              // Submit Button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit Feedback'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Button color
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
