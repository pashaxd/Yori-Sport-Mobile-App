import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:yori_sport_app/abstractions/shopping_cart_card.dart';
import 'package:yori_sport_app/features/profile_screen/profile_screen.dart';
import 'package:yori_sport_app/features/shop_screen.dart';
import 'package:yori_sport_app/features/shopping_cart_screen.dart';
import '../abstractions/cart_provider.dart';
import '../test_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  static List<Widget> _widgetOptions = <Widget>[ShopScreen(), ProfileScreen()];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShoppingCartScreen(initialItems: []),
                ),
              );
            },
            icon: SvgPicture.asset(
              cartProvider.items.isEmpty
                  ? 'assets/svgs/cart.svg'
                  : 'assets/svgs/newCart.svg',
              semanticsLabel: 'Shopping Cart',
              width: 25,
            ),
          ),
        ],
        backgroundColor: Colors.grey,
        title: Image.asset('assets/pictures/logo.png', height: 42),
      ),
      body: Center(child: _widgetOptions[_selectedIndex]),
      bottomNavigationBar: Container(
        height: 93,
        child: BottomNavigationBar(
          unselectedLabelStyle: TextStyles.defaultBottomStyle,
          showSelectedLabels: false,
          selectedIconTheme: IconThemeData(size: 25),
          onTap: _onItemTapped,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          iconSize: 20,
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.shopify), label: 'SHOP'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'ME'),
          ],
          selectedItemColor: Colors.black,
        ),
      ),
    );
  }
}
