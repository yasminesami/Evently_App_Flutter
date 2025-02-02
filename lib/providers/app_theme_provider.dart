import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeProvider extends ChangeNotifier {
  static const String THEME_KEY = 'app_theme';
  ThemeMode appTheme = ThemeMode.light;
  final SharedPreferences prefs;

  AppThemeProvider(this.prefs) {
    _loadSavedTheme();
  }

  void _loadSavedTheme() {
    String? savedTheme = prefs.getString(THEME_KEY);
    if (savedTheme != null) {
      appTheme = savedTheme == 'light' ? ThemeMode.light : ThemeMode.dark;
      notifyListeners();
    }
  }

  Future<void> changeAppTheme(ThemeMode newTheme) async {
    if (appTheme == newTheme) return;

    appTheme = newTheme;
    await prefs.setString(
        THEME_KEY, newTheme == ThemeMode.light ? 'light' : 'dark');
    notifyListeners();
  }
}
