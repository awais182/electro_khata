import 'package:electro_khata/ui/auth/shopkeeper/Signup_screen.dart';
import 'package:electro_khata/ui/intro_screen.dart';
import 'package:electro_khata/widgets/round_btn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/utils.dart';

class ShopProfilePage extends StatefulWidget {
  const ShopProfilePage({super.key});

  @override
  State<ShopProfilePage> createState() => _ShopProfilePageState();
}

final auth = FirebaseAuth.instance;

class _ShopProfilePageState extends State<ShopProfilePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 4,
        shadowColor: Colors.orange,
        backgroundColor: Colors.white,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03, vertical: height * 0.05),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: height * 0.117,
              width: width * 0.25,
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                Icons.person,
                color: Colors.black,
                size: 50,
              ),
            ),
            SizedBox(
              height: height * 0.06,
            ),
            Row(
              children: [
                const Text(
                  'Name:',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                SizedBox(
                  width: width * 0.102,
                ),
                Flexible(
                    child: Text(
                  shopNameController.text,
                ))
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              children: [
                const Text(
                  'Email:',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                SizedBox(
                  width: width * 0.09,
                ),
                Flexible(
                    child: Text(
                  shopEmailController.text,
                ))
              ],
            ),
            SizedBox(
              height: height * 0.09,
            ),
            RoundBTN(
                title: 'Log Out',
                ontap: () {
                  auth.signOut().then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const IntroPage()));
                  }).onError((error, stackTrace) {
                    Utils().toastMessage(error.toString());
                  });
                })
          ],
        ),
      ),
    );
  }
}
