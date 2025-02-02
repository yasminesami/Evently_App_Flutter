import 'package:evently/core/constants/assets_manager.dart';
import 'package:evently/features/layout/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/app_theme_provider.dart';
import '../onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkFirstLaunch();
  }

  Future<void> checkFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool('first_launch') ?? true;

    await Future.delayed(const Duration(seconds: 3));

    if (isFirstLaunch) {
      await prefs.setBool('first_launch', false);
      navigateToScreen(const OnboardingScreen());
    } else {
      navigateToScreen(const LayoutScreen());
    }
  }

  void navigateToScreen(Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Image.asset(
      themeProvider.appTheme == ThemeMode.light
          ? AssetsManager.splashScreenLight
          : AssetsManager.splashScreenDark,
      fit: BoxFit.fill,
    );
  }
}
