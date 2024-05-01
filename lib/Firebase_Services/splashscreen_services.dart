// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electro_khata/ui/intro_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../ui/customer/bottom_navbar.dart';
// import '../ui/customer/home_screen.dart';
import '../ui/shopkeeper/bottom_navbar.dart';
// import '../ui/shopkeeper/homepage.dart';
import 'my_user.dart';

class SplashServices {
  void isLogin(BuildContext context) async {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      final userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      debugPrint("errorrrr--1111111111");
      if (userData.exists) {
        final myUser = MyUser(
          id: userData['id'],
          name: userData['name'],
          email: userData['email'],
          role: userData['role'],
          phone: userData['phone'],
        );
        debugPrint("errorrrr");
        // Timer(const Duration(seconds: 3),
        //         ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> const IntroPage())));
        if (myUser.role == 'customer') {
          debugPrint("$myUser.role");
          // Navigate to customer home screen
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const UserBottomNavBar()));
        } else if (myUser.role == 'shopkeeper') {
          debugPrint("$myUser.role");
          // Navigate to shopkeeper home screen
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ShopBottomNavBar()));
        }
      } else {
        Timer(
            const Duration(seconds: 3),
            () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const IntroPage())));
      }
    } else {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const IntroPage())));
    }
  }
}
