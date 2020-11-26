import 'package:flutter/material.dart' show BorderRadius, BoxDecoration, BoxShadow, Brightness, Color, Colors, Offset, ThemeData;
import 'package:flutter/cupertino.dart';
final setLightTheme = _buildLightTheme();
final setDarkTheme = _buildDarkTheme();
final setWhiteCard = _buildWhiteCard();
final setBlackCard = _buildBlackCard();

ThemeData _buildLightTheme() {
  return ThemeData(
//      platform: TargetPlatform.iOS,
      fontFamily: 'ProductSans',
      brightness: Brightness.light,
      primaryColor: Color(0xffffaa00),
      accentColor: Color(0xFFD8ECF1),
      scaffoldBackgroundColor: Color(0xffeeeeee),
      canvasColor: Color(0xffffffff));
}

ThemeData _buildDarkTheme() {
  return ThemeData(
//      platform: TargetPlatform.iOS,
      fontFamily: 'ProductSans',
      brightness: Brightness.dark,
      primaryColor: Color(0xffffaa00),
      accentColor: Color(0xffffaa00),
      scaffoldBackgroundColor: Colors.black54,
      canvasColor: Colors.black);
}

BoxDecoration _buildWhiteCard() {
  return BoxDecoration(
    color: Color(0xffffffff),
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
          color: Color(0x26000000),
          offset: Offset(0, 0),
          blurRadius: 75,
          spreadRadius: 0)
    ],
  );
}

BoxDecoration _buildBlackCard() {
  return BoxDecoration(
    color: Color(0xff1b1b1b),
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
          color: Color(0x26000000),
          offset: Offset(0, 0),
          blurRadius: 75,
          spreadRadius: 0)
    ],
  );
}
