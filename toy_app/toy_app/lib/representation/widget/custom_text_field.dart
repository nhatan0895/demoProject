import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labText,
  }) : super(key: key);
 final TextEditingController controller;
  final String labText;
  @override
  Widget build(BuildContext context) {
    return TextField(
    controller: controller,
      decoration: InputDecoration(
        labelText: labText,
      ),
    );
  }
}
