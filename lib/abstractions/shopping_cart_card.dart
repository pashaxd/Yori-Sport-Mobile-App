import 'package:flutter/material.dart';
import 'package:yori_sport_app/assets/test_styles.dart';

class ShoppingCartCard extends StatelessWidget {
  final String cartCardImage;
  final String name;
  final String description;
  final int counter;
  final Function(BuildContext) adding;
  final Function(BuildContext) removing;

  ShoppingCartCard({
    required this.cartCardImage,
    required this.name,
    required this.description,
    required this.adding,
    required this.removing,
    required this.counter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      width: 500,
      height: 200,
      child: Card(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(
              cartCardImage,
              width: 120,
              height: 170,
              errorBuilder: (context, error, stackTrace) {
                return Center(child: Text('Ошибка загрузки изображения'));
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => adding(context),
                  icon: Icon(Icons.arrow_upward, size: 30),
                ),
                Text(counter.toString(), style: TextStyles.defaultStyle),
                IconButton(
                  onPressed: () => removing(context),
                  icon: Icon(Icons.arrow_downward, size: 30),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(name, style: TextStyles.defaultStyle),
                  SizedBox(height: 5),
                  Text(description, style: TextStyles.defaultStyle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}