import 'package:flutter/material.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final String image;
  final String category;




  Product(
      {required this.name,
        required this.description,
        required this.price,
        required this.image,
        required this.category,

      });
}
final List<Product> products = [
  Product(name: 'Food_1',
      description: 'this is very healthy and good food',
      price: 150,
      image: 'assets/images/food_1.png',
      category: 'salad',
  ),

  Product(name: 'Food_2',
      description: 'this is very healthy and good food',
      price: 150,
      image: 'assets/images/food_2.png',
      category: 'food',
      ),
  Product(name: 'Food_3',
      description: 'this is very healthy and good food',
      price: 150,
      image: 'assets/images/food_3.png',
      category: 'salad',
      ),
  Product(name: 'Food_4',
      description: 'this is very healthy and good food',
      price: 150,
      image: 'assets/images/food_4.png',
      category: 'salad',
      ),
  Product(name: 'Food_5',
      description: 'this is very healthy and good food',
      price: 150,
      image: 'assets/images/food_5.png',
      category: 'salad',
      ),
  Product(name: 'Food_6',
      description: 'this is very healthy and good food',
      price: 150,
      image: 'assets/images/food_6.png',
      category: 'salad',
      ),

];
