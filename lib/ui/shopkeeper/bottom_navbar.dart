import 'package:electro_khata/ui/shopkeeper/shop_profile.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

class ShopBottomNavBar extends StatefulWidget {
  const ShopBottomNavBar({super.key});

  @override
  State<ShopBottomNavBar> createState() => _ShopBottomNavBarState();
}

class _ShopBottomNavBarState extends State<ShopBottomNavBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    ShopHomePage(),
    ShopProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}
