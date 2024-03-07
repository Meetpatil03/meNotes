import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  const CustomTextField({super.key, required this.labelText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
              decoration: InputDecoration(
                labelText: labelText,
                labelStyle: const TextStyle(
                  fontSize: 24,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.orange),
                ),
                focusColor: Colors.blue,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey)),
                contentPadding: const EdgeInsets.all(12),
              ),
            );
  }
}