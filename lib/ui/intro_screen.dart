import 'package:electro_khata/ui/auth/customer/Signup_screen.dart';
import 'package:electro_khata/ui/auth/shopkeeper/Signup_screen.dart';
import 'package:electro_khata/widgets/round_btn.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 80, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const Text(
                'To',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const Text(
                'Electro',
                style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.w600,
                    color: Colors.orange),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const Text(
                'Khata',
                style: TextStyle(
                    fontSize: 130,
                    fontWeight: FontWeight.w600,
                    color: Colors.orange),
              ),
              SizedBox(
                height: height * 0.09,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    RoundBTN(
                        title: 'Customer',
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupScreen()));
                        }),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    RoundBTN(
                        title: 'Shopkeeper',
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ShopSignupScreen()));
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
