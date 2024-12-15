import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yori_sport_app/abstractions/shopping_cart_card.dart';

import '../abstractions/cart_provider.dart';

class ShoppingCartScreen extends StatefulWidget {
  final List<Map<String, dynamic>> initialItems;

  const ShoppingCartScreen({
    Key? key,
    required this.initialItems,
  }) : super(key: key);

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  List<Map<String, dynamic>> items = [];
  Map<String, int> itemCounts = {};

  @override
  void initState() {
    super.initState();
    _initializeItems();
  }

  void _initializeItems() {

    items = List.from(widget.initialItems);
    for (var item in items) {
      itemCounts[item['id']] = 0;
    }
  }

  int getItemCount(String itemId) {
    return itemCounts[itemId] ?? 0;
  }

  void adding(String itemId) {
    setState(() {
      itemCounts[itemId] = (itemCounts[itemId] ?? 0) + 1;
    });
  }

  void removing(String itemId) {
    setState(() {
      if (itemCounts[itemId] != null && itemCounts[itemId]! > 0) {
        itemCounts[itemId] = itemCounts[itemId]! - 1;
        if (itemCounts[itemId] == 0) {
          itemCounts.remove(itemId);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Image.asset(
          '/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/logo.png', // Обновите путь при необходимости
          height: 42,
        ),
      ),
      body: ListView.builder(
        itemCount: cartProvider.items.length,
        itemBuilder: (context, index) {
          final item = cartProvider.items[index];
          return ShoppingCartCard(
            cartCardImage: item['image'],
            name: item['name'],
            description: item['description'],
            adding: (context) => cartProvider.addItem(item),
            removing: (context) => cartProvider.removeItem(item['id']),
            counter: cartProvider.getItemCount(item['id']),
          );
        },
      ),
    );
  }
}