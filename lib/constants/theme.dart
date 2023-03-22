import 'package:flutter/material.dart';

const primaryColor = Color(0XFF7579E7);
const secondayColor = Color(0xFF9AB3F5);
const ternaryColor = Color(0xFFA3D8F4);
const darkBlue = Color(0xFF01004E);

var themeData = ThemeData(
  fontFamily: "Poppins",
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    primary: primaryColor,
    secondary: secondayColor,
    tertiary: ternaryColor,
  ),
);
