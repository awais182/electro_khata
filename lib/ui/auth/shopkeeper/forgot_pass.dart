// import 'package:electro_khata/ui/auth/customer/login_screen.dart';
import 'package:electro_khata/ui/auth/shopkeeper/login_screen.dart';
// import 'package:electro_khata/ui/intro_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../../../widgets/utils.dart';
import '../../../widgets/round_btn.dart';

class ShopForgotScreen extends StatefulWidget {
  const ShopForgotScreen({super.key});

  @override
  State<ShopForgotScreen> createState() => _ShopForgotScreenState();
}

bool loading = false;
final emailController = TextEditingController();
final _auth = FirebaseAuth.instance;
final _formKey = GlobalKey<FormState>();

class _ShopForgotScreenState extends State<ShopForgotScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        automaticallyImplyLeading: false,
        title: const Text('Forgot Password'),
        centerTitle: true,
        elevation: 50,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Email';
                      }
                      return null;
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter Email',
                      prefixIcon: const Icon(Icons.email_rounded),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.orange)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.orange)),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RoundBTN(
                title: 'Send Link',
                ontap: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      loading = true;
                    });
                    _auth
                        .sendPasswordResetEmail(
                            email: emailController.text.toString())
                        .then((value) {
                      Utils().toastMessage('Reset Password Link Sent');
                      setState(() {
                        loading = false;
                      });
                    }).onError((error, stackTrace) {
                      setState(() {
                        loading = false;
                      });
                      Utils().toastMessage(error.toString());
                    });
                  }
                }),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Pasword Reset?"),
                const SizedBox(
                  width: 5,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ShopLoginScreen()));
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 18),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
