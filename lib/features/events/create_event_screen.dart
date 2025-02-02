import 'package:evently/core/constants/app_colors.dart';
import 'package:evently/core/constants/app_styles.dart';
import 'package:evently/core/widgets/custom_elevated_button.dart';
import 'package:evently/core/widgets/custom_text_form_field.dart';
import 'package:evently/features/events/widgets/chips_navigation_with_category_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/app_theme_provider.dart';

class CreateEventScreen extends StatelessWidget {
  static const String routeName = "create event";

  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: AppColors.primaryLight,
        title: Text(
          AppLocalizations.of(context)!.create_event,
          style: AppStyles.robotoRegular22Primary,
        ),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8)
              .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChipsNavigationWithCategoryImage(),
              Text(
                AppLocalizations.of(context)!.title,
                style: themeProvider.appTheme == ThemeMode.light
                    ? AppStyles.medium16lightBlack
                    : AppStyles.medium16White,
              ),
              SizedBox(
                height: screenHeight * .005,
              ),
              CustomTextFormField(
                borderColor: themeProvider.appTheme == ThemeMode.light
                    ? AppColors.greyColor
                    : AppColors.primaryLight,
                hintText: AppLocalizations.of(context)!.event_title,
                prefixIcon: Icons.edit_note_outlined,
                hintStyle: themeProvider.appTheme == ThemeMode.light
                    ? AppStyles.medium16Grey
                    : AppStyles.medium16White,
              ),
              SizedBox(
                height: screenHeight * .005,
              ),
              Text(
                AppLocalizations.of(context)!.description,
                style: themeProvider.appTheme == ThemeMode.light
                    ? AppStyles.medium16lightBlack
                    : AppStyles.medium16White,
              ),
              SizedBox(
                height: screenHeight * .005,
              ),
              CustomTextFormField(
                borderColor: themeProvider.appTheme == ThemeMode.light
                    ? AppColors.greyColor
                    : AppColors.primaryLight,
                hintText: AppLocalizations.of(context)!.event_description,
                hintStyle: themeProvider.appTheme == ThemeMode.light
                    ? AppStyles.medium16Grey
                    : AppStyles.medium16White,
                maxLines: 3,
              ),
              SizedBox(
                height: screenHeight * .009,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: themeProvider.appTheme == ThemeMode.light
                            ? AppColors.lightBlackColor
                            : AppColors.whiteColor,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        AppLocalizations.of(context)!.event_date,
                        style: themeProvider.appTheme == ThemeMode.light
                            ? AppStyles.medium16lightBlack
                            : AppStyles.medium16White,
                      )
                    ],
                  ),
                  Text(
                    AppLocalizations.of(context)!.choose_date,
                    style: AppStyles.medium16Primary,
                  )
                ],
              ),
              SizedBox(
                height: screenHeight * .009,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.timelapse,
                        color: themeProvider.appTheme == ThemeMode.light
                            ? AppColors.lightBlackColor
                            : AppColors.whiteColor,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        AppLocalizations.of(context)!.event_time,
                        style: themeProvider.appTheme == ThemeMode.light
                            ? AppStyles.medium16lightBlack
                            : AppStyles.medium16White,
                      )
                    ],
                  ),
                  Text(
                    AppLocalizations.of(context)!.choose_time,
                    style: AppStyles.medium16Primary,
                  )
                ],
              ),
              SizedBox(
                height: screenHeight * .009,
              ),
              Text(
                AppLocalizations.of(context)!.location,
                style: themeProvider.appTheme == ThemeMode.light
                    ? AppStyles.medium16lightBlack
                    : AppStyles.medium16White,
              ),
              SizedBox(
                height: screenHeight * .009,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(8),
                    foregroundColor: AppColors.primaryLight,
                    backgroundColor: themeProvider.appTheme == ThemeMode.light
                        ? AppColors.whiteColor
                        : AppColors.primaryDark,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: AppColors.primaryLight))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: AppColors.primaryLight,
                              borderRadius: BorderRadius.circular(8)),
                          child: Icon(
                            Icons.location_searching,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          AppLocalizations.of(context)!.choose_event_location,
                          style: AppStyles.medium16Primary,
                        )
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.primaryLight,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * .02,
              ),
              CustomElevatedButton(
                  title: AppLocalizations.of(context)!.add_event)
            ],
          ),
        ),
      ),
    );
  }
}
