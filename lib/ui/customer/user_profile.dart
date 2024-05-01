import 'package:electro_khata/ui/auth/customer/Signup_screen.dart';
import 'package:electro_khata/ui/intro_screen.dart';
import 'package:electro_khata/widgets/round_btn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/utils.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

final auth = FirebaseAuth.instance;

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
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
                  width: width * 0.055,
                ),
                Text(customerNameController.text)
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
                  width: width * 0.08,
                ),
                Flexible(
                    child: Text(
                  customerEmailController.text,
                ))
              ],
            ),
            SizedBox(
              height: height * 0.03,
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
