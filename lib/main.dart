import 'package:electro_khata/ui/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ElectroKhata());
}

class ElectroKhata extends StatefulWidget {
  const ElectroKhata({super.key});

  @override
  State<ElectroKhata> createState() => _ElectroKhataState();
}

class _ElectroKhataState extends State<ElectroKhata> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const SplashScreen(),
    );
  }
}
