// Create a shopping cart where the total price is updated in real-time using Getx as items
// are added or removed.

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicals/Controllers/controller_38.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: ShoppingCartPage(),
    );
  }
}

class ShoppingCartPage extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final product = productList[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(product.image),
                  ),
                  title: Text(product.name),
                  subtitle: Text('${product.price.toStringAsFixed(2)} /- Rs'),
                  trailing: IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      cartController.addItem(CartItem(
                        id: product.id,
                        name: product.name,
                        price: product.price,
                      ));
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() {
              return Column(
                children: [
                  Text(
                    'Total: ${cartController.totalPrice.toStringAsFixed(2)} /- Rs Only',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Get.snackbar('Checkout', 'Proceeding to checkout...');
                    },
                    child: Text('Checkout'),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}

final List<Product> productList = [
  Product(
    id: '1',
    name: 'Laptop',
    price: 990,
    image: 'https://media.sketchfab.com/models/51eca7b2e5884c4087f3499e523d5184/thumbnails/8f42c093b1a3447d80964fabf450de8f/b9bab2a7f6254f799a01f62c2f587e7d.jpeg',
  ),
  Product(
    id: '2',
    name: 'Headphones',
    price: 899.99,
    image: 'https://media.cgtrader.com/variants/CGmf8bVUEqCj6w6L1Bekp2SN/508c09fe26e63b93baec6d888aa2950650a509b5e04f2f03a4f2af52a04363ea/beats-headphones-3d-model-max-obj.jpg',
  ),
  Product(
    id: '3',
    name: 'Phone',
    price: 699.99,
    image: 'https://media.cgtrader.com/variants/CGmf8bVUEqCj6w6L1Bekp2SN/508c09fe26e63b93baec6d888aa2950650a509b5e04f2f03a4f2af52a04363ea/beats-headphones-3d-model-max-obj.jpg',
  ),
];

class Product {
  final String id;
  final String name;
  final double price;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });
}
