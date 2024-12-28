import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yori_sport_app/abstractions/buttons.dart';
import 'package:yori_sport_app/test_styles.dart';
import 'package:yori_sport_app/features/profile_screen/liked.dart';
import 'package:yori_sport_app/features/profile_screen/purchases.dart';
import 'package:yori_sport_app/features/profile_screen/settings.dart';
import 'package:yori_sport_app/features/shop_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }


  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  final TextEditingController _nameController = TextEditingController();

  Future<void> _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (userData.exists) {
        setState(() {
          _nameController.text = userData['name'] ?? '';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    void navigationFunc(Widget navigateTo) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => navigateTo));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
                radius: 45,
                backgroundImage: FirebaseAuth.instance.currentUser?.photoURL !=
                        null
                    ? NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!)
                    : NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Outdoors-man-portrait_%28cropped%29.jpg/1200px-Outdoors-man-portrait_%28cropped%29.jpg')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _nameController.text.isNotEmpty? _nameController.text : FirebaseAuth.instance.currentUser!.email.toString(),
                  style: TextStyles.defaultStyle,
                ),
                IconButton(
                  onPressed: _signOut,
                  icon: Icon(Icons.logout),
                ),
              ],
            ),
            SizedBox(height: 10),
            DefButton(
              'SETTINGS',
              Icons.build_outlined,
              (context) => navigationFunc(Settings1()),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
