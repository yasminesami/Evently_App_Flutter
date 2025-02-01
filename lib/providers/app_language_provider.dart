import 'package:flutter/cupertino.dart';

class AppLanguageProvider extends ChangeNotifier {
  String appLanguage = 'en';

  void changeAppLanguage(String newAppLanguage) {
    if (appLanguage == newAppLanguage) {
      return;
    }
    appLanguage = newAppLanguage;
    notifyListeners();
  }
}
