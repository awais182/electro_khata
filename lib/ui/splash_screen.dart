import 'package:electro_khata/Firebase_Services/splashscreen_services.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

SplashServices splashScreen = SplashServices();

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text(
        'Electro Khata',
        style: TextStyle(
            color: Colors.orange, fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ));
  }
}
