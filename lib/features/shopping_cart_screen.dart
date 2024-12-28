import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yori_sport_app/abstractions/shopping_cart_card.dart';

import '../abstractions/cart_provider.dart';
import '../test_styles.dart';

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
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Image.asset(
          'assets/pictures/logo.png',
          height: 42,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: cartProvider.items.isEmpty
                ? Center(
              child: Text(
                'YOUR SHOPPING CART IS EMPTY',
                style: TextStyles.defaultStyle,
              ),
            )
                : ListView.builder(
              itemCount: cartProvider.items.length,
              itemBuilder: (context, index) {
                var item = cartProvider.items[index];
                return ShoppingCartCard(
                  cartCardImage: item['image'],
                  name: item['name'],
                  description: item['description'],
                  size: item["sizes"],
                  adding: (context) {
                    cartProvider.addItem(item);
                  },
                  removing: (context) {
                    cartProvider.removeItem(item['id']);
                  },
                  counter: cartProvider.getItemCount(item['id']),
                );
              },
            ),
          ),
          Container(
            width: 300,
            padding: EdgeInsets.only(bottom: 50),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.grey.shade400,
                ),
              ),
              onPressed: () async {
                await _placeOrder(cartProvider);
              },
              child: Text(
                'Total: \$${cartProvider.total.toStringAsFixed(2)}',
                style: TextStyles.defaultStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _placeOrder(CartProvider cartProvider) async {
    try {

      await FirebaseFirestore.instance.collection('orders').add({
        'items': cartProvider.items,
        'total': cartProvider.total,
        'timestamp': FieldValue.serverTimestamp(),

      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Order placed successfully!')),
      );


      cartProvider.notifyListeners();
    } catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to place order: $e')),
      );
    }
  }
}