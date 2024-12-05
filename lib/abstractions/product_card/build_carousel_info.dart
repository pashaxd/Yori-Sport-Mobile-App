import 'package:flutter/material.dart';

Widget buildCarouselItem(String imgPath){
  return Container(
    decoration: BoxDecoration(image: DecorationImage(image: AssetImage(imgPath))),
  );
}