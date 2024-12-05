import 'package:flutter/material.dart';
import 'package:yori_sport_app/abstractions/buttons.dart';
import 'package:yori_sport_app/assets/test_styles.dart';
import 'package:yori_sport_app/features/shop_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 45,
            backgroundImage: AssetImage(
                '/Users/a1/StudioProjects/yori_sport_app/lib/assets/pictures/lildrugavatar.png'),
          ),
          SizedBox(height: 10),
          Text(
            'LILDRUGHILL',
            style: TextStyles.defaultStyle,
          ),
          SizedBox(height: 20),

          DefButton('SETTINGS',Icons.personal_injury_outlined ),
          SizedBox(height: 10),
          DefButton('PURCHASES',Icons.backpack_outlined ),
          SizedBox(height: 10),DefButton('LIKED',Icons.heart_broken_outlined),

        ]),
      ),
    );
  }
}
