import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class Description extends StatelessWidget {
  final String description;
  const Description({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                color: kprimaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: const Text(
                "Description",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16),
              ),
            ),
            const Text(
              "Category",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 20), // Moved outside of the Row
        Text(
          description,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
