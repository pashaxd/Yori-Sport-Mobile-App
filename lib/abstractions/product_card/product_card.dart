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
        height: MediaQuery.of(context).size.height*0.42,
        width: MediaQuery.of(context).size.height*0.22,
        child: Card(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                imgPaths.isNotEmpty ? imgPaths[0] : '',
                height: MediaQuery.of(context).size.height*0.26,
                width: MediaQuery.of(context).size.height*0.22,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(child: Text('Ошибка загрузки изображения'));
                },
              ),
              Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.01),
                child: Text(
                  name,
                  style: TextStyles.defaultStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.01),
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
