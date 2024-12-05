import 'package:flutter/material.dart';
import 'package:yori_sport_app/abstractions/product_card/product_info.dart';
import 'package:yori_sport_app/assets/test_styles.dart';

class ProductCard extends StatefulWidget {
  final List<String> imgPaths;
  final String name;
  final String description;

  ProductCard(this.imgPaths, this.name, this.description);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductInfo(
                  widget.imgPaths, widget.name, widget.description)),
        );
      },
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.imgPaths[0],
              height: 240,
              width: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.name,
                style: TextStyles.defaultStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                widget.description,
                style: TextStyles.defaultStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
