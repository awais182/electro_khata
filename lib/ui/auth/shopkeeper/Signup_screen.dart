// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../widgets/utils.dart';
import '../../../widgets/round_btn.dart';
import '../../shopkeeper/bottom_navbar.dart';
// import '../../shopkeeper/homepage.dart';
import 'login_screen.dart';

class ShopSignupScreen extends StatefulWidget {
  const ShopSignupScreen({super.key});

  @override
  State<ShopSignupScreen> createState() => _ShopSignupScreenState();
}

bool loading = false;
final _formKey = GlobalKey<FormState>();
final shopNameController = TextEditingController();
final shopEmailController = TextEditingController();
final shopPasswordController = TextEditingController();
final shopPhoneController = TextEditingController();
final fireStore = FirebaseFirestore.instance.collection('users');

FirebaseAuth _auth = FirebaseAuth.instance;

class _ShopSignupScreenState extends State<ShopSignupScreen> {
  @override
  void dispose() {
    super.dispose();
    shopEmailController.dispose();
    shopPasswordController.dispose();
    shopNameController.dispose();
    shopPhoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        title: const Text('Signup'),
        centerTitle: true,
        elevation: 50,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    'Shop Signup',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Shop Name';
                      }
                      return null;
                    },
                    controller: shopNameController,
                    decoration: InputDecoration(
                      hintText: 'Shop Name',
                      prefixIcon: const Icon(Icons.business),
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
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Email';
                      }
                      return null;
                    },
                    controller: shopEmailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
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
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Phone Number';
                      }
                      return null;
                    },
                    controller: shopPhoneController,
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                      prefixIcon: const Icon(Icons.phone),
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
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Password';
                      }
                      return null;
                    },
                    controller: shopPasswordController,
                    decoration: InputDecoration(
                      hintText: 'password',
                      prefixIcon: const Icon(Icons.lock_open_outlined),
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
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  RoundBTN(
                    loading: loading,
                    title: 'Signup',
                    ontap: () {
                      if (_formKey.currentState!.validate()) {
                        signup();
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have account?"),
                      const SizedBox(
                        width: 5,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ShopLoginScreen()));
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 18),
                          ))
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Future<void> signup() async {
    setState(() {
      loading = true;
    });
    await _auth
        .createUserWithEmailAndPassword(
            email: shopEmailController.text,
            password: shopPasswordController.text)
        .then((value) {
      String uid = DateTime.now().microsecondsSinceEpoch.toString();
      fireStore.doc(uid).set({
        "Name": shopNameController.text,
        "Email": shopEmailController.text,
        "Phone": shopPhoneController.text,
        // "Password": shopPasswordController.text,
        "id": uid,
        "role": 'shopkeeper'
      }).then((value) {
        Utils().toastMessage('Signup Successfully');
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ShopBottomNavBar()));
      }).onError((error, stackTrace) {
        Utils().toastMessage(error.toString());
      });
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());

      setState(() {
        loading = false;
      });
    });
  }
}
