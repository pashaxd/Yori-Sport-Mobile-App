import 'package:flutter/material.dart';
import 'package:yori_sport_app/abstractions/product_card/product_info.dart';


import '../../test_styles.dart';

class ProductCard extends StatelessWidget {
  final List<String> imgPaths;
  final String name;
  final int description;
  final String productId;

  ProductCard(this.imgPaths, this.name, this.description, this.productId);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ProductInfo(productId, imgPaths, name, description)),
        );
      },
      child: Container(
        height: 367,
        width: 200,
        child: Card(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                imgPaths.isNotEmpty ? imgPaths[0] : '',
                height: 230,
                width: 190,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(child: Text('Ошибка загрузки изображения'));
                },
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  name,
                  style: TextStyles.defaultStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  '$description\$',
                  style: TextStyles.defaultStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
