import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/product_model.dart';

// Define the CartProvider as a ChangeNotifierProvider
final cartProvider = ChangeNotifierProvider<CartProvider>((ref) {
  return CartProvider();
});

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];

  List<Product> get cart => _cart;

  void toggleFavorite(Product product) {
    if (_cart.contains(product)) {
      for (Product element in _cart) {
        element.quantity++;
      }
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  void incrementQtn(int index) {
    _cart[index].quantity++;
    notifyListeners();
  }

  void decrementQtn(int index) {
    if (_cart[index].quantity > 1) {
      _cart[index].quantity--;
      notifyListeners();
    }
  }

  double totalPrice() {
    double total = 0.0;
    for (Product element in _cart) {
      total += element.price * element.quantity;
    }
    return total;
  }


  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}