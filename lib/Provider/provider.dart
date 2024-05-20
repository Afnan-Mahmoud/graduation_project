import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider with ChangeNotifier {
  bool _isDarkModeEnabled = false;
  bool get isDarkModeEnabled => _isDarkModeEnabled;
  AppProvider() {
    _isDarkModeEnabled = false;
    _loadThemeFromPreferences();
  }
  void toggleTheme() {
    _isDarkModeEnabled = !_isDarkModeEnabled;
    _saveThemeToPreferences();
    notifyListeners();
  }
  Future<void> _loadThemeFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkModeEnabled = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }

  Future<void> _saveThemeToPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', _isDarkModeEnabled);
  }
}