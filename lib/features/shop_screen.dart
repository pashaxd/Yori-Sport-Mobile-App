import 'package:flutter/material.dart';
import 'package:yori_sport_app/abstractions/product_card/product_card.dart';
import 'package:yori_sport_app/assets/test_styles.dart';
import 'package:yori_sport_app/features/menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final ScrollController _scrollController = ScrollController();
  List<Map<String, dynamic>> products = [];

  void _scrollTo(double offset) {
    _scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      CollectionReference things = FirebaseFirestore.instance.collection('things');
      QuerySnapshot snapshot = await things.get();

      if (snapshot.docs.isEmpty) {
        print('Нет доступных продуктов');
        return;
      }

      setState(() {
        products = snapshot.docs.map((doc) {
          var data = doc.data() as Map<String, dynamic>;
          data['id'] = doc.id;
          return data;
        }).toList();
      });
    } catch (e) {
      print('Ошибка при получении данных: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 7),
          Center(child: MenuStatus(scrollTo: _scrollTo)),
          SizedBox(height: 5),
          Expanded(
            child: ListView(
              controller: _scrollController,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'SPORT',
                    style: TextStyles.defaultHeadStyle,
                  ),
                ),
                ...buildProductRows(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildProductRows() {
    List<Widget> rows = [];

    for (int i = 0; i < products.length; i += 2) {
      final product1 = products[i];
      List<String> images1 = List<String>.from(product1['image'] as List<dynamic>);
      String name1 = product1['name'];
      String description1 = product1['description'];
      String id1 = product1['id'];
      if (i + 1 < products.length) {
        final product2 = products[i + 1];
        List<String> images2 = List<String>.from(product2['image'] as List<dynamic>);
        String name2 = product2['name'];
        String description2 = product2['description'];
        String id2 = product2['id'];

        rows.add(buildProductRow(images1, name1, description1, id1, images2, name2, description2, id2));
      } else {

        rows.add(buildProductRow(images1, name1, description1, id1, [], '', '', ''));
      }
    }

    return rows;
  }

   Widget buildProductRow(List<String> images1, String name1, String description1, String id1,
      List<String> images2, String name2, String description2, String id2) {
    return Row(
      children: [
        SizedBox(width: 7),
         ProductCard(
            images1,
            name1,
            description1,
             id1,
          ),

        SizedBox(width: 10),
        if (images2.isNotEmpty)
          Expanded(
            child: ProductCard(
              images2,
              name2,
              description2,
              id2,
            ),
          ),
      ],
    );
  }
}