import 'package:flutter/material.dart';

class CustomSnackBar {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final double elevation;
  final double borderRadius;
  final double duration;

  CustomSnackBar({
    required this.text,
    required this.backgroundColor,
    this.textColor = Colors.white,
    this.fontSize = 14.45,
    this.elevation = 4.45,
    this.borderRadius = 20.45,
    this.duration = 8000,
  });

  SnackBar getSnackBar() {
    return SnackBar(
      backgroundColor: backgroundColor,
      duration: Duration(milliseconds: duration.toInt()),
      elevation: elevation,
      content: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontFamily: 'Manrope',
          letterSpacing: 1.45,
          fontSize: fontSize,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}
