import 'package:evently/core/constants/app_colors.dart';
import 'package:evently/features/home/models/category_chips_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_theme_provider.dart';

class ChipsNavigationWithCategoryImage extends StatefulWidget {
  const ChipsNavigationWithCategoryImage({Key? key}) : super(key: key);

  @override
  State<ChipsNavigationWithCategoryImage> createState() =>
      _ChipsNavigationWithCategoryImageState();
}

class _ChipsNavigationWithCategoryImageState
    extends State<ChipsNavigationWithCategoryImage> {
  int selectedIndex = 0; // لتتبع العنصر المحدد

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    double screenHeight = MediaQuery.of(context).size.height;

    // قائمة العناصر مع أيقوناتها
    final List<CategoryChipsData> items = [
      CategoryChipsData(
          imageLightPath: "assets/images/sport light.png",
          imageDarkPath: "assets/images/sport dark.png",
          label: AppLocalizations.of(context)!.sport,
          icon: Icons.directions_bike_outlined),
      CategoryChipsData(
          imageLightPath: "assets/images/birthday light.png",
          imageDarkPath: "assets/images/bithday dark.png",
          label: AppLocalizations.of(context)!.birthday,
          icon: Icons.cake),
      CategoryChipsData(
          imageLightPath: "assets/images/book club light.png",
          imageDarkPath: "assets/images/book club dark.png",
          label: AppLocalizations.of(context)!.book_club,
          icon: Icons.chrome_reader_mode_outlined),
      CategoryChipsData(
          imageLightPath: "assets/images/eating light.png",
          imageDarkPath: "assets/images/eating dark.png",
          label: AppLocalizations.of(context)!.eating,
          icon: Icons.fastfood),
      CategoryChipsData(
          imageLightPath: "assets/images/gaming light.png",
          imageDarkPath: "assets/images/gaming dark.png",
          label: AppLocalizations.of(context)!.gaming,
          icon: Icons.sports_esports_outlined),
      CategoryChipsData(
          imageLightPath: "assets/images/holiday light.png",
          imageDarkPath: "assets/images/holiday dark.png",
          label: AppLocalizations.of(context)!.holiday,
          icon: Icons.holiday_village_outlined),
      CategoryChipsData(
          imageLightPath: "assets/images/exhibition light.png",
          imageDarkPath: "assets/images/exhibition dark.png",
          label: AppLocalizations.of(context)!.exhibition,
          icon: Icons.yard),
      CategoryChipsData(
          imageLightPath: "assets/images/meeting light.png",
          imageDarkPath: "assets/images/meeting dark.png",
          label: AppLocalizations.of(context)!.meeting,
          icon: Icons.laptop)
    ];
    return Column(
      children: [
        Container(
          height: screenHeight * .25,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              shape: BoxShape.rectangle,
              image: DecorationImage(
                  image: AssetImage(
                themeProvider.appTheme == ThemeMode.light
                    ? items[selectedIndex].imageLightPath!
                    : items[selectedIndex].imageDarkPath!,
              ))),
        ),
        SingleChildScrollView(
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
        ),
      ],
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
                    ? AppColors.whiteColor
                    : AppColors.primaryDark
                : AppColors.primaryLight,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: selected
                  ? themeProvider.appTheme == ThemeMode.light
                      ? AppColors.whiteColor
                      : AppColors.primaryDark
                  : AppColors.primaryLight,
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
          ? AppColors.whiteColor
          : AppColors.primaryDark,
      selectedColor: themeProvider.appTheme == ThemeMode.light
          ? AppColors.primaryLight
          : AppColors.primaryLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
            color: themeProvider.appTheme == ThemeMode.light
                ? AppColors.primaryLight
                : AppColors.primaryLight),
      ),
    );
  }
}
