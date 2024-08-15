import 'package:finalproject/features/home/data/model/product_model.dart';
import 'package:finalproject/features/home/presentation/view/constants.dart';
import 'package:finalproject/features/home/presentation/view/screen/Detail/detail_screen.dart';
import 'package:finalproject/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCart extends StatelessWidget {
  final Product product;

  const ProductCart({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context)=>  DetailScreen(product: product),
          ),
        );

      },
      child: Stack(children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kcontentColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Center(
                child: Hero(
                  tag: product.image,
                  child: Image.asset(
                    product.image,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(padding: const EdgeInsets.only(left: 10),
                child: Text(
                  product.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   Text(
                     "\Rs.${product.price}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
        Positioned(
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: kprimaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.favorite_border,color: Colors.white,size: 22,),
              ),
            ),
          ),
        ),
      ],
      ),
    );
  }
}
