import 'package:bola_8/const/style.dart';
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
    required this.hint,
    required this.textInputAction,
    required this.controller,
  });

  final String hint;
  final TextInputAction textInputAction;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: kHintTextStyle,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        style: kHintTextStyle,
        textInputAction: textInputAction,
      ),
    );
  }
}
