import 'package:flutter/material.dart';
class BoxSize extends StatelessWidget {
  final String size;
  final bool isSelected;
  late void Function() toggleButton;

  BoxSize({
    Key? key,
    required this.size,
    required this.isSelected,
    required this.toggleButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: toggleButton,
          child: Container(
            height: 48,
            width: 60,
            decoration: BoxDecoration(

              color: isSelected ? Colors.black : Colors.white,
              border: Border.all(
                color: isSelected ? Colors.black : Colors.grey,
              ),
              borderRadius:
                  BorderRadius.circular(8), // Optional: Rounded corners
            ),
            child: Center(
              child: Text(
                size,
                style: TextStyle(
                  fontFamily: 'Yori',
                  fontSize: 20,
                  fontWeight: FontWeight.w200,
                  color: isSelected
                      ? Colors.grey
                      : Colors.black, // Change text color based on selection
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
