import 'package:flutter/material.dart';

class LikedScreen extends StatefulWidget {
  const LikedScreen({super.key});

  @override
  State<LikedScreen> createState() => _LikedScreenState();
}

class _LikedScreenState extends State<LikedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.grey,
          title:
          Image.asset(
            '/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/logo.png',
            height: 42,

          )),
    );
  }
}
