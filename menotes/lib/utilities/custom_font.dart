import 'package:flutter/material.dart';

class CustomFont extends StatelessWidget {
  final String title;
  final Color titleColor;
  const CustomFont({super.key, required this.title, required this.titleColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.bold,
        color: titleColor,
      ),
    );
  }
}
