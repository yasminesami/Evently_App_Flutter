import 'package:evently/core/constants/app_colors.dart';
import 'package:evently/core/constants/assets_manager.dart';
import 'package:evently/features/home/home_screen.dart';
import 'package:evently/features/love/love_screen.dart';
import 'package:evently/features/map/map_screen.dart';
import 'package:evently/features/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/app_theme_provider.dart';

class LayoutScreen extends StatefulWidget {
  static const String routeName = "layoutScreen";

  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<LayoutScreen> {
  ThemeMode? selectedTheme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedTheme ??= Provider.of<AppThemeProvider>(context, listen: false)
        .appTheme; // Use provider
  }

  int currentPage = 0;
  final List<Widget> pages = [
    const HomeScreen(),
    const MapScreen(),
    const LoveScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        items: [
          _buildNavigationBarItem(
            selectedIcon: AssetsManager.selectedHomeIcon,
            unselectedIcon: AssetsManager.homeIcon,
            label: AppLocalizations.of(context)!.home,
          ),
          _buildNavigationBarItem(
            selectedIcon: themeProvider.appTheme == ThemeMode.dark
                ? AssetsManager.selectedMapIconDark
                : AssetsManager.selectedMapIconLight,
            unselectedIcon: AssetsManager.mapIcon,
            label: AppLocalizations.of(context)!.map,
          ),
          _buildNavigationBarItem(
            selectedIcon: AssetsManager.selectedHeartIcon,
            unselectedIcon: AssetsManager.selectedHeartIcon,
            unselectedHeart: AssetsManager.heartIcon,
            label: AppLocalizations.of(context)!.love,
          ),
          _buildNavigationBarItem(
            selectedIcon: AssetsManager.selectedProfileIcon,
            unselectedIcon: AssetsManager.profileIcon,
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {},
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: themeProvider.appTheme == ThemeMode.light
                ? AppColors.primaryLight
                : AppColors.primaryDark,
          ),
          child: Icon(
            Icons.add,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavigationBarItem(
      {required String unselectedIcon,
      required String selectedIcon,
      required String label,
      Icon unselectedHeart = AssetsManager.heartIcon}) {
    return BottomNavigationBarItem(
      icon: unselectedIcon != AssetsManager.selectedHeartIcon
          ? Image.asset(
              unselectedIcon,
              width: 24,
              height: 24,
            )
          : unselectedHeart,
      label: label,
      activeIcon: Image.asset(
        selectedIcon,
        width: 24,
        height: 24,
      ),
    );
  }
}
