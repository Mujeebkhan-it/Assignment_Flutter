import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  double get totalPrice => cartItems.fold(
      0, (previousValue, item) => previousValue + item.price * item.quantity);

  void addItem(CartItem item) {
    var existingItem = cartItems.firstWhereOrNull((e) => e.id == item.id);
    if (existingItem != null) {
      existingItem.quantity++;
    } else {
      cartItems.add(item);
    }
  }

  void removeItem(CartItem item) {
    cartItems.removeWhere((e) => e.id == item.id);
  }
}

class CartItem {
  final String id;
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}
