import 'package:flutter/material.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = false;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      // primaryColor: Colors.white70,
      appBarTheme: AppBarTheme(backgroundColor: Colors.white30),
      iconTheme: IconThemeData(color: Colors.white),
      colorScheme: ColorScheme.light(
        primary: Color(0xFF23cdba),
        secondary: Color(0xFFb3b312),
      ),
      // primarySwatch: Colors.grey,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(backgroundColor: Colors.white30),
        iconTheme: IconThemeData(color: Colors.white),
        // primarySwatch: Colors.grey,
        // floatingActionButtonTheme: FloatingActionButton(),
        colorScheme: ColorScheme.light(
          primary: Color(0xFF00FFFF),
          secondary: Color(0xFF0d47a1),
        ));
  }
}
