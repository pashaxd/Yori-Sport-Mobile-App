import 'package:flutter/material.dart';
import 'package:yori_sport_app/abstractions/product_card/build_carousel_info.dart';
import '../../assets/test_styles.dart';
import '../buttons.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductInfo extends StatelessWidget {
  final List<String> imgPaths;
  final String name;
  final String description;

  ProductInfo(this.imgPaths, this.name, this.description);

  @override
  Widget build(BuildContext context) {
    void addingToCartFunc() {};
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Image.asset(
          '/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/logo.png',
          height: 43,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 400.0,
              autoPlay: true,
              autoPlayAnimationDuration: Duration(milliseconds: 1500),
              enableInfiniteScroll: false,
              autoPlayInterval: Duration(seconds: 3),
            ),
            items: [0, 1, 2].map((i) {
              return buildCarouselItem(imgPaths[i]);
            }).toList(),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  name,
                  style: TextStyles.defaultHeadStyle
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyles.defaultHeadStyle,
                ),
                SizedBox(
                  height: 10,
                ),
                DefButton('ADD TO CART', Icons.add_shopping_cart_outlined,  (context) => addingToCartFunc()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
