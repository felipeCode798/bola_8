import 'package:flutter/material.dart';

class BtnPrimary extends StatelessWidget {
  const BtnPrimary({
    Key? key,
    required this.hint,
  }) : super(key: key);

  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        hint,
        style: const TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }
}
