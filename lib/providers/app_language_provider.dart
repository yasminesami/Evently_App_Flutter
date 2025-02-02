import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageProvider extends ChangeNotifier {
  static const String LANGUAGE_KEY = 'app_language';
  String appLanguage = 'en';
  final SharedPreferences prefs;

  AppLanguageProvider(this.prefs) {
    _loadSavedLanguage();
  }

  void _loadSavedLanguage() {
    String? savedLanguage = prefs.getString(LANGUAGE_KEY);
    if (savedLanguage != null) {
      appLanguage = savedLanguage;
      notifyListeners();
    }
  }

  Future<void> changeAppLanguage(String newAppLanguage) async {
    if (appLanguage == newAppLanguage) return;

    appLanguage = newAppLanguage;
    await prefs.setString(LANGUAGE_KEY, newAppLanguage);
    notifyListeners();
  }
}

