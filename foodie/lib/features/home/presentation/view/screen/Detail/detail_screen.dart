import 'package:finalproject/features/home/data/model/product_model.dart';
import 'package:finalproject/features/home/presentation/view/constants.dart';
import 'package:finalproject/features/home/presentation/view/screen/Detail/Widget/add_to_cart.dart';
import 'package:finalproject/features/home/presentation/view/screen/Detail/Widget/description.dart';
import 'package:finalproject/features/home/presentation/view/screen/Detail/Widget/detail_app_bar.dart';
import 'package:finalproject/features/home/presentation/view/screen/Detail/Widget/image_slider.dart';
import 'package:finalproject/features/home/presentation/view/screen/Detail/Widget/item_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage =0;
  // int currentSlide = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcontentColor,
      // for add to cart
      floatingActionButton: AddToCart(product: widget.product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              //   for back button and favorite,
                const DetailAppBar(),
              //   FOR detail image

                MyImageSlider(
                    image: widget.product.image,
                    onChange: (index){
                      setState(() {
                        currentImage = index;
                      });
                    },
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                        (index) => AnimatedContainer(
                      duration: const Duration(microseconds: 300),
                      width: currentImage == index ? 15 : 8,
                      height: 8,
                      margin: const EdgeInsets.only(right: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentImage == index
                              ? Colors.black
                              : Colors.transparent,
                          border: Border.all(
                            color: Colors.black,
                          )),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                    bottom: 100,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    //   for product price,name
                      ItemDetails(product: widget.product),
                      const SizedBox(height: 20),
                    //   for description
                      Description(description: widget.product.description)


                    ],

                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
