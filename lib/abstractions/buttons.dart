import 'package:flutter/material.dart';
import 'package:yori_sport_app/assets/test_styles.dart';

class DefButton extends StatelessWidget {
  void onPressedButton() {}
  late String childText;
  late IconData buttonIcon;

  DefButton(this.childText, this.buttonIcon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185,
      child: OutlinedButton(
          onPressed: onPressedButton,
          child:  Row(
              children: [
                Icon(buttonIcon,color: Colors.black,),
                SizedBox(width: 15,),
                Center(child: Text(childText,style: TextStyles.defaultStyle,))],
            ),
          ),
    );
  }
}
