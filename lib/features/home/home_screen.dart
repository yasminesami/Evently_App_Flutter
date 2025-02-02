import 'package:evently/core/constants/app_colors.dart';
import 'package:evently/core/constants/app_styles.dart';
import 'package:evently/core/constants/assets_manager.dart';
import 'package:evently/features/home/widgets/category_container.dart';
import 'package:evently/features/home/widgets/chips_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/app_theme_provider.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "homeScreen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: themeProvider.appTheme == ThemeMode.light
                    ? AppColors.primaryLight
                    : AppColors.primaryDark,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24))),
            padding: EdgeInsets.only(top: 46, left: 16, right: 16, bottom: 16),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.welcome,
                          style:
                              AppStyles.regular20White.copyWith(fontSize: 14),
                        ),
                        Text(
                          "Yasmine Sami",
                          style: AppStyles.bold24White,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: AppColors.whiteColor,
                            ),
                            //SizedBox(width: 8,),
                            Text(
                              "Cairo , Egypt",
                              style: AppStyles.medium16White
                                  .copyWith(fontSize: 14),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(AssetsManager.sunIconLight),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(6)),
                          child: Text(
                            "EN",
                            style: themeProvider.appTheme == ThemeMode.light
                                ? AppStyles.bold14Primary
                                : AppStyles.bold14lightBlack.copyWith(
                                    color: AppColors.primaryDark,
                                  ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                ChipsNavigation()
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 24),
              itemCount: 5,
              itemBuilder: (context, index) => CategoryContainer(),
              separatorBuilder: (context, index) => SizedBox(
                height: screenHeight * .03,
              ),
            ),
          )
        ],
      ),
    );
  }
}
