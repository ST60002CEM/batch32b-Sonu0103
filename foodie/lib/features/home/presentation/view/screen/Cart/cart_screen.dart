import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:finalproject/features/home/data/provider/cart_provider.dart';
import 'package:finalproject/features/home/presentation/view/constants.dart';
import 'package:finalproject/features/home/presentation/view/screen/nav_bar_screen.dart';


import 'checkout_screen.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartProviderInstance = ref.watch(cartProvider);
    final cartItems = cartProviderInstance.cart;

    Widget productQuantity(IconData icon, int index) {
      return GestureDetector(
        onTap: () {
          if (icon == Icons.add) {
            ref.read(cartProvider).incrementQtn(index);
          } else if (icon == Icons.remove) {
            ref.read(cartProvider).decrementQtn(index);
          }
        },
        child: Icon(icon, size: 20),
      );
    }

    return Scaffold(
      bottomSheet: CheckOutBox(),
      backgroundColor: kcontentColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(15),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BottomNavBar(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  const Text(
                    "My Cart",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Container(),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            height: 120,
                            width: 100,
                            decoration: BoxDecoration(
                              color: kcontentColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(cartItem.image),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cartItem.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                cartItem.category,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "\Rs.${cartItem.price}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: kcontentColor,
                                  border: Border.all(
                                    color: Colors.grey.shade200,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    productQuantity(Icons.add, index),
                                    const SizedBox(width: 10),
                                    Text(
                                      cartItem.quantity.toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    productQuantity(Icons.remove, index),
                                    const SizedBox(width: 10),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              ref.read(cartProvider).removeFromCart(cartItem);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 22,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
