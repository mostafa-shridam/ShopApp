import 'package:ahmed/helper/componants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.title,
    required this.function,
     this.buttonColor,
     this.textColor,
  });

  String title;
  void Function() function;
  Color? textColor;
  Color? buttonColor;

  @override
  InkWell build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor ?? defaultColor,
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        width: double.infinity,
        height: 40,
        child: Center(
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}