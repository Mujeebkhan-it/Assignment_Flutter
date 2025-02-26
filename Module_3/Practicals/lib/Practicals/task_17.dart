// Create a registration form with fields for name, email, password, and phone number. Use
// validation to ensure email and password meet specific criteria.

import 'package:flutter/material.dart';

class Task17 extends StatefulWidget {
  const Task17({super.key});

  @override
  State<Task17> createState() => _Task17State();
}

class _Task17State extends State<Task17> {

  final _formKey = GlobalKey<FormState>();  // Key to identify the form
  String name = '';
  String email = '';
  String password = '';
  String phoneNumber = '';

  // Form validation for Name
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  // Form validation for Email
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // Simple email validation
    String emailPattern = r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(emailPattern);
    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // Form validation for Password
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    // Password should be at least 8 characters long and contain at least one number
    if (value.length < 8) {
      return 'Password should be at least 8 characters';
    }
    return null;
  }

  // Form validation for Phone Number
  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    // Simple phone number validation (digits only)
    if (value.length != 10) {
      return 'Please enter a valid 10-digit phone number';
    }
    return null;
  }

  // Submit the form
  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // If the form is valid, display the input data or perform submission logic
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form submitted successfully!')),
      );
    } else {
      // If the form is not valid, display an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in the required fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Form'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,  // Attach the global key to the form
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Name TextFormField
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: validateName,
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              
              // Email TextFormField
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: validateEmail,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),

              // Password TextFormField
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,  // To hide the password
                validator: validatePassword,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              
              // Phone Number TextFormField
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                validator: validatePhoneNumber,
                onChanged: (value) {
                  setState(() {
                    phoneNumber = value;
                  });
                },
              ),
              
              // Submit Button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,  // Button color
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