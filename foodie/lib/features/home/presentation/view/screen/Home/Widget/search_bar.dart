import 'package:flutter/material.dart';
import 'package:finalproject/features/home/data/model/product_model.dart';
import 'package:finalproject/features/home/presentation/view/screen/Detail/detail_screen.dart';

class MySearchBAR extends StatefulWidget {
  final List<Product> allProducts;

  const MySearchBAR({super.key, required this.allProducts});

  @override
  _MySearchBARState createState() => _MySearchBARState();
}

class _MySearchBARState extends State<MySearchBAR> {
  List<Product> _searchResults = [];

  void _searchProduct(String query) {
    final results = widget.allProducts.where((product) {
      final productName = product.name.toLowerCase();
      final input = query.toLowerCase();
      return productName.contains(input);
    }).toList();

    setState(() {
      _searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: Row(
            children: [
              const Icon(
                Icons.search,
                color: Colors.grey,
                size: 30,
              ),
              const SizedBox(width: 10),
              Flexible(
                flex: 4,
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "Search...",
                    border: InputBorder.none,
                  ),
                  onChanged: _searchProduct,
                ),
              ),
              Container(
                height: 25,
                width: 1.5,
                color: Colors.grey,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.tune,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        _buildSearchResults(context),
      ],
    );
  }

  Widget _buildSearchResults(BuildContext context) {
    if (_searchResults.isEmpty) {
      return Container();
    }

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          final product = _searchResults[index];
          return ListTile(
            leading: Image.asset(
              product.image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(product.name),
            subtitle: Text('\$${product.price.toString()}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(product: product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
