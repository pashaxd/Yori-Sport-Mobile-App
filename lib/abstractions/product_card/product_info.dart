import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yori_sport_app/abstractions/box_size.dart';
import '../../test_styles.dart';
import '../buttons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../cart_provider.dart';

class ProductInfo extends StatefulWidget {
  final String productId;

  ProductInfo(
      this.productId, List<String> imgPaths, String name, int description);

  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  List<String> imgPaths = [];
  String name = '';
  int description = 0;
  bool isLoading = true;
  String errorMessage = '';
  Map<String, int> sizes = {};
  String? selectedSize;

  @override
  void initState() {
    super.initState();
    fetchProductInfo();
  }

  void fetchProductInfo() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('things')
          .doc(widget.productId)
          .get();
      if (doc.exists) {
        setState(() {
          imgPaths = List<String>.from(doc['image'] as List<dynamic>);
          name = doc['name'] as String;
          description = doc['description'] as int;
          sizes = Map<String, int>.from(doc['sizes'] as Map<dynamic, dynamic>);
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Продукт не найден';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Ошибка при получении данных: $e';
        isLoading = false;
      });
    }
  }

  void toggleButton(String size) {
    setState(() {
      selectedSize = (selectedSize == size) ? null : size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Image.asset(
          'assets/pictures/logo.png',
          height: 43,
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                imgPaths.isNotEmpty
                    ? CarouselSlider(
                        options: CarouselOptions(
                          height: 400.0,
                          autoPlay: true,
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 1500),
                          enableInfiniteScroll: false,
                          autoPlayInterval: Duration(seconds: 3),
                        ),
                        items: imgPaths.map((path) {
                          return buildCarouselItem(path);
                        }).toList(),
                      )
                    : Center(
                        child: Text(errorMessage.isNotEmpty
                            ? errorMessage
                            : 'Нет изображений')),
                Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: sizes.entries
                              .where((entry) => entry.value > 0)
                              .map((entry) {
                            String size = entry.key;
                            selectedSize ??= size;
                            return BoxSize(
                              size: size,
                              isSelected: selectedSize == size,
                              toggleButton: () => toggleButton(size),
                            );
                          }).toList(),
                        )),
                    SizedBox(width: 5),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              name,
                              style: TextStyles.defaultHeadStyle
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '$description\$',
                              style: TextStyles.defaultHeadStyle,
                            ),
                            SizedBox(height: 10),
                            DefButton(
                                'ADD TO CART',
                                Icons.add_shopping_cart_outlined,
                                (context) => addingToCartFunc()),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }

  void addingToCartFunc() {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.addItem({
      'image': imgPaths[0],
      'name': name,
      'description': description,
      'id': imgPaths[0].hashCode.toString(),
      'sizes': selectedSize
    });
    Navigator.pop(context);
  }

  Widget buildCarouselItem(String imageUrl) {
    return Container(
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Center(child: Text('Ошибка загрузки изображения'));
        },
      ),
    );
  }
}
