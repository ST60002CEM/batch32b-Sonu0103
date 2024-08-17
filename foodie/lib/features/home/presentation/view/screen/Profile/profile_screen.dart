import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../auth/presentation/view/login_view.dart';
import '../../constants.dart';
import '../Cart/order_details_screen.dart';


class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: kprimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Profile Image
            GestureDetector(
              onTap: () {
                // Implement functionality to pick and upload profile image
              },
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey.shade200,
                child: Icon(Icons.camera_alt, size: 40, color: Colors.grey.shade800),
              ),
            ),
            const SizedBox(height: 20),
            // Edit Name
            // TextFormField(
            //   initialValue: 'User Name', // Replace with actual user name
            //   decoration: const InputDecoration(
            //     labelText: 'Name',
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            const SizedBox(height: 30),
            // Orders Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OrderDetailsScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: kprimaryColor,
              ),
              child: const Text('View Orders'),
            ),
            const SizedBox(height: 20),
            // Logout Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginView()),
                      (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.red,
              ),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
