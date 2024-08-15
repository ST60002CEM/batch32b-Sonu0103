

import 'package:finalproject/features/home/data/model/product_model.dart';
import 'package:finalproject/features/home/presentation/view/screen/Home/Widget/category.dart';
import 'package:finalproject/features/home/presentation/view/screen/Home/Widget/product_cart.dart';
import 'package:finalproject/features/home/presentation/view/screen/Home/Widget/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'Widget/home_app_bar.dart';
import 'Widget/image_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),
              const CustomAppBar(),

              const SizedBox(height: 20),
    //           for search bar
              const MySearchBAR(),
              const SizedBox(height: 20),
              ImageSlider(currentSlide: currentSlider,
                  onChange: (value){
                setState(() {
                  currentSlider = value;

              },
                );
              },
              ),
              const SizedBox(height: 20),
    //           for category selection
              const Categories(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Explore menu for you',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black54,
                    ),
                  ),
                  // SizedBox(width: 10,)
                ],
              ),
    //           for food item
              GridView.builder(
               physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.78,
                    crossAxisSpacing: 20,mainAxisSpacing: 20,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index){
                    return ProductCart(
                      product: products[index],
                    );
                  })
    ]
          ),
        ),
      ),
    );
  }
}



