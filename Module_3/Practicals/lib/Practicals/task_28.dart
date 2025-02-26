// Design a product listing page using ListView with horizontal scrolling, showing product
// images, names, and prices.

import 'package:flutter/material.dart';

class Task28 extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3i2HT3NJKgZwPgi9jpytNakPTJJoxoIr9-A&s',
      'name': 'Product 1',
      'price': '\$20.00',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3i2HT3NJKgZwPgi9jpytNakPTJJoxoIr9-A&s',
      'name': 'Product 2',
      'price': '\$35.00',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3i2HT3NJKgZwPgi9jpytNakPTJJoxoIr9-A&s',
      'name': 'Product 3',
      'price': '\$45.00',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3i2HT3NJKgZwPgi9jpytNakPTJJoxoIr9-A&s',
      'name': 'Product 4',
      'price': '\$55.00',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3i2HT3NJKgZwPgi9jpytNakPTJJoxoIr9-A&s',
      'name': 'Product 5',
      'price': '\$65.00',
    },
  ];

  Task28({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal, // Enable horizontal scrolling
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.network(
                    products[index]['image']!,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    products[index]['name']!,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    products[index]['price']!,
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


