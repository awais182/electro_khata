import 'package:electro_khata/ui/shopkeeper/bottom_navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../widgets/utils.dart';
import '../../../widgets/round_btn.dart';
// import '../forgot_pass.dart';
import 'Signup_screen.dart';
import 'forgot_pass.dart';

class ShopLoginScreen extends StatefulWidget {
  const ShopLoginScreen({super.key});

  @override
  State<ShopLoginScreen> createState() => _ShopLoginScreenState();
}

bool _obsecureText = true;
bool loading = false;
final _auth = FirebaseAuth.instance;
final _formKey = GlobalKey<FormState>();

class _ShopLoginScreenState extends State<ShopLoginScreen> {
  @override
  void dispose() {
    super.dispose();
    shopEmailController.dispose();
    shopNameController.dispose();
    shopPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          automaticallyImplyLeading: false,
          title: const Text('Login Screen'),
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
                      height: 80,
                    ),
                    const Text(
                      'Shop Login',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Name';
                        }
                        return null;
                      },
                      controller: shopNameController,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        prefixIcon: const Icon(Icons.person),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(width: 1, color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 2, color: Colors.orange)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(width: 1, color: Colors.red)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 2, color: Colors.orange)),
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
                            borderSide: const BorderSide(
                                width: 2, color: Colors.orange)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(width: 1, color: Colors.red)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 2, color: Colors.orange)),
                      ),
                      keyboardType: TextInputType.emailAddress,
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
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obsecureText = !_obsecureText;
                              });
                            },
                            child: Icon(_obsecureText
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(width: 1, color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 2, color: Colors.orange)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(width: 1, color: Colors.red)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 2, color: Colors.orange)),
                      ),
                      obscureText: _obsecureText,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ShopForgotScreen()));
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic),
                            ))),
                    const SizedBox(
                      height: 30,
                    ),
                    RoundBTN(
                      loading: loading,
                      title: 'Login',
                      ontap: () {
                        if (_formKey.currentState!.validate()) {
                          login();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have account?"),
                        const SizedBox(
                          width: 5,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ShopSignupScreen()));
                            },
                            child: const Text(
                              'Signup',
                              style: TextStyle(fontSize: 18),
                            ))
                      ],
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: shopEmailController.text.toString(),
            password: shopPasswordController.text.toString())
        .then((value) {
      Utils().toastMessage(value.user!.email.toString());
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ShopBottomNavBar()));
      setState(() {
        loading = false;
      });
      Utils().toastMessage(value.user!.email.toString());
    }).onError((error, stackTrace) {
      setState(() {
        loading = false;
      });
      Utils().toastMessage(error.toString());
    });
  }
}
