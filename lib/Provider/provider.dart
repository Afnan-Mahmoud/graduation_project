import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider with ChangeNotifier {
  static AppProvider get(context)=>Provider.of<AppProvider>(context,listen: true);
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