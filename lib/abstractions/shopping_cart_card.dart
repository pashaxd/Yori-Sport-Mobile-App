import 'package:flutter/material.dart';
import 'package:yori_sport_app/test_styles.dart';

class ShoppingCartCard extends StatelessWidget {
  final String cartCardImage;
  final String name;
  final int description;
  final int counter;
  final String size;
  final Function(BuildContext) adding;
  final Function(BuildContext) removing;

  ShoppingCartCard({
    required this.cartCardImage,
    required this.name,
    required this.description,
    required this.adding,
    required this.removing,
    required this.counter,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Card(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(
              cartCardImage,
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.25,
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
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(name, style: TextStyles.defaultStyle),
                    SizedBox(height: 5),
                    Text('$description \$', style: TextStyles.defaultStyle),
                    SizedBox(height: 5),
                    Text(size, style: TextStyles.defaultStyle),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}