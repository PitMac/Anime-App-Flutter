import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    primaryColor: Colors.purpleAccent,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.purpleAccent,
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.purpleAccent,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        )),
  );
}

ThemeData darkTheme() {
  return ThemeData(
    primaryColor: Colors.purpleAccent,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.black,
    ),
    scaffoldBackgroundColor: Colors.grey[900],
    textTheme: const TextTheme(
        bodyText2: TextStyle(color: Colors.white),
        caption: TextStyle(color: Colors.grey)),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black87,
      titleTextStyle: TextStyle(
        color: Colors.purpleAccent,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

class ChangeTheme with ChangeNotifier {
  bool _isDatkTheme = true;
  bool get isDarkTheme => _isDatkTheme;

  void changeTheme() {
    _isDatkTheme = !_isDatkTheme;
    notifyListeners();
  }
}
