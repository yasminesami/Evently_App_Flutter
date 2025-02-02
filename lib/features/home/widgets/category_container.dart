import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_styles.dart';
import '../../../providers/app_theme_provider.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 16),
      height: screenHeight * .25,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(
              color: themeProvider.appTheme == ThemeMode.light
                  ? Colors.transparent
                  : AppColors.primaryLight),
          borderRadius: BorderRadius.circular(16),
          shape: BoxShape.rectangle,
          image: DecorationImage(
              image: AssetImage(
            themeProvider.appTheme == ThemeMode.light
                ? 'assets/images/sport light.png'
                : 'assets/images/sport dark.png',
          ))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: themeProvider.appTheme == ThemeMode.light
                  ? AppColors.whiteColor
                  : AppColors.primaryDark,
            ),
            padding: EdgeInsets.all(8),
            child: Text(
              "21\nJan",
              style: AppStyles.bold14Primary,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: themeProvider.appTheme == ThemeMode.light
                    ? AppColors.whiteColor
                    : AppColors.primaryDark,
              ),
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "This is a Birthday Party ",
                    style: themeProvider.appTheme == ThemeMode.light
                        ? AppStyles.bold14lightBlack
                        : AppStyles.bold14White,
                  ),
                  Icon(
                    Icons.favorite_outline,
                    color: AppColors.primaryLight,
                  )
                ],
              )),
        ],
      ),
    );
  }
}
