

import 'package:flutter/material.dart';
import 'package:yori_sport_app/features/base.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
