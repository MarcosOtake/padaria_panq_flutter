import 'package:flutter/material.dart';

class PadariaUiTheme {
  PadariaUiTheme._();
  static final ThemeData theme = ThemeData(
    primaryColor: const Color(0xffC73342), //#C73342
    primaryColorDark: const Color.fromARGB(255, 42, 10, 13),
    fontFamily: 'mplus1',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xffC73342),
        textStyle: const TextStyle(fontFamily: 'mplus1'),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      selectedIconTheme: const IconThemeData(color: Colors.black),
      selectedLabelStyle: textBold,
      unselectedItemColor: Colors.grey[400],
      unselectedIconTheme: IconThemeData(color: Colors.grey[400]),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
    ),
  );

  static const TextStyle textBold = TextStyle(fontWeight: FontWeight.bold);
}
