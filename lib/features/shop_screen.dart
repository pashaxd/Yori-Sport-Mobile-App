import 'package:flutter/material.dart';
import 'package:yori_sport_app/abstractions/product_card/product_card.dart';
import 'package:yori_sport_app/assets/test_styles.dart';
import 'package:yori_sport_app/features/menu.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final ScrollController _scrollController = ScrollController();

  void _scrollTo(double offset) {
    _scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
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
                buildProductRow(
                  ['/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/product_images/mix.png',
                  '/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/zip.png',
                  '/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/pants.png'],
                  '2027 HOLIDAY BUNDLE',
                  '250\$',
                  ['/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/product_images/mix.png',
                    '/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/zip.png',
                    '/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/pants.png'],
                  '2027 HOLIDAY BUNDLE',
                  '250\$',
                ),
                buildProductRow(
                  ['/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/product_images/mix.png',
                    '/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/zip.png',
                    '/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/pants.png'],
                  '2027 HOLIDAY BUNDLE',
                  '250\$',
                  ['/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/product_images/mix.png',
                    '/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/zip.png',
                    '/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/pants.png'],
                  '2027 HOLIDAY BUNDLE',
                  '250\$',
                ),
                buildProductRow(
                  ['/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/product_images/mix.png',
                    '/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/zip.png',
                    '/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/pants.png'],
                  '2027 HOLIDAY BUNDLE',
                  '250\$',
                  ['/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/product_images/mix.png',
                    '/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/zip.png',
                    '/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/pants.png'],
                  '2027 HOLIDAY BUNDLE',
                  '250\$',
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'WOMENSWEAR',
                    style: TextStyles.defaultHeadStyle,
                  ),
                ),
                buildProductRow(
                  ['/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/product_images/mix.png',
                    '/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/zip.png',
                    '/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/pants.png'],
                  '2027 HOLIDAY BUNDLE',
                  '250\$',
                  ['/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/product_images/mix.png',
                    '/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/zip.png',
                    '/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/pants.png'],
                  '2027 HOLIDAY BUNDLE',
                  '250\$',
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'SALE',
                    style: TextStyles.defaultHeadStyle,
                  ),
                ),
                buildProductRow(
                  ['/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/product_images/mix.png',
                    '/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/zip.png',
                    '/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/pants.png'],
                  '2027 HOLIDAY BUNDLE',
                  '250\$',
                  ['/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/product_images/mix.png',
                    '/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/zip.png',
                    '/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/pants.png'],
                  '2027 HOLIDAY BUNDLE',
                  '250\$',
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'MAINLINE',
                    style: TextStyles.defaultHeadStyle,
                  ),
                ),

                   Center(
                     child: ProductCard(
                      ['/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/product_images/mix.png',
                      '/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/zip.png',
                      '/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/pants.png'],
                      '2027 HOLIDAY BUNDLE',
                      '250\$',
                                       ),
                   ),

              ],
            ),
          ),
        ],
      )
    );
  }

  Row buildProductRow(List<String> img1, String name1, String description1,
      List<String> img2, String name2, String description2) {
    return Row(
      children: [
        SizedBox(width: 7),
        ProductCard(
          img1,
          name1,
          description1,
        ),
        SizedBox(width: 10),
        ProductCard(
          img2,
          name2,
          description2,
        ),
      ],
    );
  }
}
