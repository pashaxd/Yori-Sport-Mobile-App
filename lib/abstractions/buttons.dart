import 'package:flutter/material.dart';
import 'package:yori_sport_app/test_styles.dart';

class DefButton extends StatelessWidget {
  final String childText;
  final IconData buttonIcon;
  final Function(BuildContext) onPressedButton;

  DefButton(this.childText, this.buttonIcon, this.onPressedButton);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185,
      child: OutlinedButton(
        onPressed: () => onPressedButton(context),
        child: Row(
          children: [
            Icon(buttonIcon, color: Colors.black),
            SizedBox(width: 15),
            Center(child: Text(childText, style: TextStyles.defaultStyle)),
          ],
        ),
      ),
    );
  }
}