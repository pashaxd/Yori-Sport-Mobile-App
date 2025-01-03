import 'package:flutter/material.dart';
import 'package:yori_sport_app/test_styles.dart';

class MenuStatus extends StatefulWidget {
  final Function(double) scrollTo;

  MenuStatus({super.key, required this.scrollTo});

  @override
  State<MenuStatus> createState() => _MenuStatusState();
}

class _MenuStatusState extends State<MenuStatus> {
  bool isOpen = false;

  void toggleMenu() {
    setState(() {
      isOpen = !isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: toggleMenu,
          icon: Icon(
            isOpen ? Icons.menu_open : Icons.menu_outlined,
            size: 30,
          ),
        ),
        if (isOpen)
          Container(

            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.005),
            child: Row(

              children: [
                TextButton(
                  onPressed: () => widget.scrollTo(0),
                  child: Text(
                    'SPORT',
                    style: TextStyles.defaultStyle,
                  ),
                ),
                TextButton(
                  onPressed: () => widget.scrollTo(1100),
                  child: Text(
                    'WOMENSWEAR',
                    style: TextStyles.defaultStyle,
                  ),
                ),
                TextButton(
                  onPressed: () => widget.scrollTo(1530),
                  child: Text(
                    'SALE',
                    style: TextStyles.defaultStyle,
                  ),
                ),

              ],
            ),
          ),
      ],
    );
  }
}
