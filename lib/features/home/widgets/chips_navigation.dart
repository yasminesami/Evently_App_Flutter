import 'package:evently/core/constants/app_colors.dart';
import 'package:evently/features/home/models/category_chips_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_theme_provider.dart';

class ChipsNavigation extends StatefulWidget {
  const ChipsNavigation({Key? key}) : super(key: key);

  @override
  State<ChipsNavigation> createState() => _ChipsNavigationState();
}

class _ChipsNavigationState extends State<ChipsNavigation> {
  int selectedIndex = 0; // لتتبع العنصر المحدد

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);

    // قائمة العناصر مع أيقوناتها
    final List<CategoryChipsData> items = [
      CategoryChipsData(
          label: AppLocalizations.of(context)!.all, icon: Icons.all_inclusive),
      CategoryChipsData(
          label: AppLocalizations.of(context)!.sport,
          icon: Icons.directions_bike_outlined),
      CategoryChipsData(
          label: AppLocalizations.of(context)!.birthday, icon: Icons.cake),
      CategoryChipsData(
          label: AppLocalizations.of(context)!.book_club,
          icon: Icons.chrome_reader_mode_outlined),
      CategoryChipsData(
          label: AppLocalizations.of(context)!.eating, icon: Icons.fastfood),
      CategoryChipsData(
          label: AppLocalizations.of(context)!.gaming,
          icon: Icons.sports_esports_outlined),
      CategoryChipsData(
          label: AppLocalizations.of(context)!.holiday,
          icon: Icons.holiday_village_outlined),
      CategoryChipsData(
          label: AppLocalizations.of(context)!.exhibition, icon: Icons.yard),
      CategoryChipsData(
          label: AppLocalizations.of(context)!.meeting, icon: Icons.laptop)
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Row(
          children: List.generate(
            items.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                left: 8,
                right: index == items.length - 1 ? 8 : 0,
              ),
              child: _buildChip(
                  label: items[index].label,
                  icon: items[index].icon,
                  selected: selectedIndex == index,
                  index: index,
                  themeProvider: themeProvider),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChip(
      {required String label,
      required IconData icon,
      required bool selected,
      required int index,
      required AppThemeProvider themeProvider}) {
    return FilterChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 18,
            color: selected
                ? themeProvider.appTheme == ThemeMode.light
                    ? AppColors.primaryLight
                    : AppColors.whiteColor
                : AppColors.whiteColor,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: selected
                  ? themeProvider.appTheme == ThemeMode.light
                      ? AppColors.primaryLight
                      : AppColors.whiteColor
                  : AppColors.whiteColor,
            ),
          ),
        ],
      ),
      showCheckmark: false,
      selected: selected,
      onSelected: (bool value) {
        setState(() {
          selectedIndex = index;
        });
      },
      backgroundColor: themeProvider.appTheme == ThemeMode.light
          ? AppColors.primaryLight
          : AppColors.primaryDark,
      selectedColor: themeProvider.appTheme == ThemeMode.light
          ? AppColors.whiteColor
          : AppColors.primaryLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
            color: themeProvider.appTheme == ThemeMode.light
                ? AppColors.whiteColor
                : AppColors.primaryLight),
      ),
    );
  }
}
