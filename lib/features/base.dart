import 'package:flutter/material.dart';
import 'package:yori_sport_app/features/profile_screen.dart';
import 'package:yori_sport_app/features/shop_screen.dart';

import '../assets/test_styles.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  static const List<Widget> _widgetOptions = <Widget>[ShopScreen(),ProfileScreen()];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              '/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/logo.png',
              height: 42,
            ),
          ])),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: TextStyles.defaultBottomStyle,
        showSelectedLabels: false,
        selectedIconTheme: IconThemeData(size: 35),
        onTap: _onItemTapped,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        iconSize: 30,
        elevation: 5.0,
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopify),
            label: 'SHOP',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'ME'),
        ],
        selectedItemColor: Colors.black,
      ),
    );
  }
}
