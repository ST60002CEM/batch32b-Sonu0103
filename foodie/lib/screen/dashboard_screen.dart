import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 10),
                  Text('Search'),
                ],
              ),
            ),
            SizedBox(height: 40),
            Container(
              alignment: Alignment.centerLeft,
              color: Color.fromRGBO(30, 94, 209, 1),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    'The Fastest\nFood Delivery',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Implement order now functionality
                    },
                    child: Text('Order Now'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/new.jpg',
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                    Text('All'),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/new.jpg',
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                    Text('Burger'),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/new.jpg',
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                    Text('Pizza'),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/new.jpg',
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                    Text('Dessert'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Popular',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/new.jpg',
                  height: 100,
                  width: 150,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/new.jpg',
                  height: 100,
                  width: 150,
                  fit: BoxFit.cover,
                ),
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
}

