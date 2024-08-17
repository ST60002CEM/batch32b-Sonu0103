import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/product_model.dart';

// Define the FavoriteProvider as a ChangeNotifierProvider
final favoriteProvider = ChangeNotifierProvider<FavoriteProvider>((ref) {
  return FavoriteProvider();
});

class FavoriteProvider extends ChangeNotifier {
  final List<Product> _favorite = [];

  List<Product> get favorite => _favorite;

  void toggleFavorite(Product product) {
    if (_favorite.contains(product)) {
      _favorite.remove(product); // If it's already in favorites, remove it
    } else {
      _favorite.add(product); // Otherwise, add it to favorites
    }
    notifyListeners();
  }

  bool isExist(Product product) {
    return _favorite.contains(product);
  }

  void removeFromFavorites(Product product) {
    _favorite.remove(product);
    notifyListeners();
  }
}
