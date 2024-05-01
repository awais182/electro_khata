import 'package:flutter/material.dart';

class RoundBTN extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  final bool loading;

  const RoundBTN({
    super.key,
    required this.title,
    required this.ontap,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(20),
        ),
        child: loading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
      ),
    );
  }
}
