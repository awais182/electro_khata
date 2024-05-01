// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../widgets/utils.dart';
import '../../../widgets/round_btn.dart';
import '../../customer/bottom_navbar.dart';
// import '../../customer/home_screen.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

bool loading = false;
final _formKey = GlobalKey<FormState>();
final customerEmailController = TextEditingController();
final customerPasswordController = TextEditingController();
final customerNameController = TextEditingController();
final customerPhoneController = TextEditingController();

final fireStore = FirebaseFirestore.instance.collection('users');

FirebaseAuth _auth = FirebaseAuth.instance;

class _SignupScreenState extends State<SignupScreen> {
  // @override
  // void dispose() {
  //
  //   super.dispose();
  //   customerEmailController.dispose();
  //   customerPasswordController.dispose();
  //   customerNameController.dispose();
  //   customerPhoneController.dispose();
  // }

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
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    'Customer Signup',
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Name';
                      }
                      return null;
                    },
                    controller: customerNameController,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      prefixIcon: const Icon(Icons.person),
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
                    controller: customerEmailController,
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
                    controller: customerPhoneController,
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
                    controller: customerPasswordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
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
                                    builder: (context) => const LoginScreen()));
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
            email: customerEmailController.text,
            password: customerPasswordController.text)
        .then((value) {
      String uid = DateTime.now().microsecondsSinceEpoch.toString();
      fireStore.doc(uid).set({
        "Name": customerNameController.text,
        "Email": customerEmailController.text,
        "Phone": customerPhoneController.text,
        "Password": customerPasswordController.text,
        "id": uid,
        "role": 'customer'
      }).then((value) {
        Utils().toastMessage('Signup Successfully');
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const UserBottomNavBar()));
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

void dispose() {
  // var dispose = super.dispose();
  customerEmailController.dispose();
  customerPasswordController.dispose();
  customerNameController.dispose();
  customerPhoneController.dispose();
}

// Future createUser() async {
//   FirebaseAuth auth = FirebaseAuth.instance;
//   User? user = await FirebaseAuth.instance.currentUser;
//
//  try{
//   await auth.createUserWithEmailAndPassword(
//      email: customerEmailController.text,
//      password: customerPasswordController.text,).then((value) =>
//        FirebaseFirestore.instance.collection('Customers').doc(user!.uid).set({
//          "Full Name": customerNameController.text,
//          "Email": customerEmailController.text,
//          "Phone No.": customerPhoneController.text,
//          "Password": customerPasswordController.text,
//        }).then((signedInUser) => {
//          print("Success"),
//          Utils().toastMessage('Success'),
//        })
//    );
//  }
//  catch(e){
//    print(e);
//  }
// }
