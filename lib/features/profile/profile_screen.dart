import 'package:evently/core/constants/app_colors.dart';
import 'package:evently/core/constants/app_styles.dart';
import 'package:evently/providers/app_language_provider.dart';
import 'package:evently/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? selectedLanguage;
  ThemeMode? selectedTheme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedLanguage ??=
        Provider.of<AppLanguageProvider>(context, listen: false).appLanguage;
    selectedTheme ??= Provider.of<AppThemeProvider>(context, listen: false)
        .appTheme; // Use provider
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(50))),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: screenWidth * .3,
                    height: screenHeight * .15,
                    decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(100),
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100))),
                    child: Text('Y', style: AppStyles.bold20Primary),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Yasmine Sami', style: AppStyles.bold24White),
                        Text(
                          'yassoesami.root@gmail.com',
                          style: AppStyles.medium16White,
                          softWrap: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Language Dropdown
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryLight),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                title: Text(
                  AppLocalizations.of(context)!.language,
                  style: selectedTheme == ThemeMode.light
                      ? AppStyles.bold16lightBlack
                      : AppStyles.bold16White,
                ),
                trailing: DropdownButton<String>(
                  value: selectedLanguage,
                  underline: const SizedBox(),
                  items: [
                    DropdownMenuItem(
                      value: 'ar',
                      child: Text(
                        AppLocalizations.of(context)!.arabic,
                        style: AppStyles.bold16Primary,
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'en',
                      child: Text(
                        AppLocalizations.of(context)!.english,
                        style: AppStyles.bold16Primary,
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedLanguage = value!; // تحديث القيمة المختارة
                    });
                    languageProvider.changeAppLanguage(value!);
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Theme Dropdown
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryLight),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                title: Text(
                  AppLocalizations.of(context)!.theme,
                  style: selectedTheme == ThemeMode.light
                      ? AppStyles.bold16lightBlack
                      : AppStyles.bold16White,
                ),
                trailing: DropdownButton<String>(
                  value: selectedTheme == ThemeMode.light
                      ? AppLocalizations.of(context)!.light
                      : AppLocalizations.of(context)!.dark,
                  underline: const SizedBox(),
                  items: [
                    DropdownMenuItem(
                      value: AppLocalizations.of(context)!.light,
                      child: Text(AppLocalizations.of(context)!.light,
                          style: AppStyles.bold16Primary),
                    ),
                    DropdownMenuItem(
                      value: AppLocalizations.of(context)!.dark,
                      child: Text(AppLocalizations.of(context)!.dark,
                          style: AppStyles.bold16Primary),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      if (value == AppLocalizations.of(context)!.light) {
                        selectedTheme = ThemeMode.light;
                        themeProvider.changeAppTheme(selectedTheme!);
                      } else {
                        selectedTheme = ThemeMode.dark;
                        themeProvider.changeAppTheme(selectedTheme!);
                      }
                    });
                  },
                ),
              ),
            ),
            const Spacer(),
            // Logout Button
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: AppColors.whiteColor,
                      size: 20,
                    ),
                    SizedBox(
                      width: screenWidth * .05,
                    ),
                    Text(AppLocalizations.of(context)!.logout,
                        style: AppStyles.regular20White),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * .05), // Space for bottom navigation
          ],
        ),
      ),
    );
  }
}
