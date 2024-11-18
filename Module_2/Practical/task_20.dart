// Write a program that simulates a shopping cart. Define classes for Product, Cart, and Order.
// Allow users to add products to the cart and calculate the total price of the items.

class Product {
  String name;
  double price;
  int quantity;

  Product(this.name, this.price, this.quantity);
  double getTotalPrice() {
    return price * quantity;
  }

  @override
  String toString() {
    return "$name - ${price.toStringAsFixed(2)} x $quantity";
  }
}

class Cart {
  List<Product> products = [];
  void addProduct(Product product) {
    products.add(product);
    print("${product.name} added to the cart.");
  }
  double calculateTotal() {
    double total = 0;
    for (var product in products) {
      total += product.getTotalPrice();
    }
    return total;
  }

  void showCartContents() {
    print("Cart contents:");
    for (var product in products) {
      print(product);
    }
  }
}

class Order {
  Cart cart;

  Order(this.cart);
  void placeOrder() {
    cart.showCartContents();
    double total = cart.calculateTotal();
    print("Total price: ${total.toStringAsFixed(2)}");
    print("Order placed successfully!");
  }
}

void main() {
  Product product1 = Product("Apple", 5, 5);
  Product product2 = Product("Banana", 3, 10);
  Product product3 = Product("Orange", 7, 8);
  Cart cart = Cart();
  cart.addProduct(product1);
  cart.addProduct(product2);
  cart.addProduct(product3);
  Order order = Order(cart);
  order.placeOrder();
}
