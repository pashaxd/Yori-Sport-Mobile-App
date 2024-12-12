

import 'package:flutter/material.dart';
import 'package:yori_sport_app/features/base.dart';

class Purchases extends StatefulWidget {
  const Purchases({super.key});

  @override
  State<Purchases> createState() => _SettingsState();
}

class _SettingsState extends State<Purchases> {
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
