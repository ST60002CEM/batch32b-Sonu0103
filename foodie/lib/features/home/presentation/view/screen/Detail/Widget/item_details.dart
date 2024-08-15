import 'package:finalproject/features/home/data/model/product_model.dart';
import 'package:flutter/cupertino.dart';

class ItemDetails extends StatelessWidget {
  final Product product;
  const ItemDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Text(
            product.name,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 25,
            ),
          ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '\Rs.${product.price}',
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 25,
              ),
            ),
        ],
        ),


      ],
    );
  }
}
