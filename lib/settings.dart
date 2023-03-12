import 'package:flutter/material.dart' show ChangeNotifier;
import 'package:shared_preferences/shared_preferences.dart' show SharedPreferences;
import 'package:flutter/cupertino.dart';

/// Class that contains all your app settings
/// Consists only of Theme setting as of now
class Settings extends ChangeNotifier {
  final SharedPreferences sharedPreferences;

  Settings(this.sharedPreferences);

  bool get isDarkMode => sharedPreferences?.getBool("isDarkMode") ?? true;

  void setDarkMode(bool val) {
    sharedPreferences?.setBool("isDarkMode", val);
    notifyListeners();
  }
}
