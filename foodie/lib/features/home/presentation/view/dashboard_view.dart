import 'package:finalproject/features/auth/presentation/view/login_view.dart';
import 'package:finalproject/features/category/presentation/view/categoy_view.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/new.jpg'),
            ),
            onPressed: () {
              // Implement profile button functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement search functionality
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 10),
                  Text('Search'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              color: Color.fromRGBO(30, 94, 209, 1),
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'The Fastest\nFood Delivery',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            // Implement order now functionality
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                          ),
                          child: Text('Order Now'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/logo2.png',
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryItem('All', 'assets/images/new.jpg'),
                _buildCategoryItem('Burger', 'assets/images/burger.jpg'),
                _buildCategoryItem('Pizza', 'assets/images/pizza.jpg'),
                _buildCategoryItem('Dessert', 'assets/images/dessert.jpg'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Popular',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPopularItem(
                    'Burger', 'Rs.200', 'assets/images/burger.jpg'),
                _buildPopularItem(
                    'Chicken Pizza', 'Rs.300', 'assets/images/pizza.jpg'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Category',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryItem('Chinese', 'assets/images/chinese.jpg'),
                _buildCategoryItem('Indian', 'assets/images/indian.jpg'),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Implement home button functionality
              },
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Implement search button functionality
              },
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                // Implement cart button functionality
              },
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // Implement profile button functionality
              },
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String label, String imagePath) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          height: 80,
          width: 80,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildPopularItem(String label, String price, String imagePath) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          height: 100,
          width: 150,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          'Price: $price',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
