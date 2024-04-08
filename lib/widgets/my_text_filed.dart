import 'package:flutter/material.dart';

class MyTextFiled extends StatelessWidget {
  MyTextFiled({
    super.key,
    this.controller,
    required this.label,
    required this.onChanged,
    this.keyboardType,
  });

  String label;
  TextEditingController? controller;
  void Function(String) onChanged;
  TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      maxLines: 2,
      minLines: 1,
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        hoverColor: Colors.black,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 2,
        ),
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
        labelText: label,
      ),
    );
  }
}