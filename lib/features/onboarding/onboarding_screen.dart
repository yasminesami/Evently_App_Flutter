import 'package:evently/core/constants/app_styles.dart';
import 'package:evently/core/constants/assets_manager.dart';
import 'package:evently/features/layout/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../providers/app_theme_provider.dart';
import 'onboarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = "onboarding";

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnBoardingContent> contents = [
    OnBoardingContent(
      image: AssetsManager.onboarding1,
      title: 'Find Events That Inspire You',
      description:
          """Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simplydiscovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.""",
    ),
    OnBoardingContent(
      image: AssetsManager.onboarding2,
      title: 'Effortless Event Planning',
      description:
          """Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.""",
    ),
    OnBoardingContent(
        image: AssetsManager.onboarding3,
        title: 'Connect with Friends & Share Moments',
        description:
            """Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories."""),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Image.asset(
                AssetsManager.horizontalLogo,
                width: screenWidth * .6,
                height: screenHeight * .06,
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                itemCount: contents.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          contents[index].image,
                          height: screenHeight * .35,
                        ),
                        SizedBox(height: screenHeight * .04),
                        Text(
                          contents[index].title,
                          style: AppStyles.bold20Primary,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenHeight * .03),
                        Text(
                          textAlign: TextAlign.center,
                          contents[index].description,
                          style: themeProvider.appTheme == ThemeMode.light
                              ? AppStyles.medium16lightBlack
                                  .copyWith(fontSize: 14)
                              : AppStyles.medium16White.copyWith(fontSize: 14),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    child: _currentPage == 0
                        ? SizedBox()
                        : Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(color: AppColors.primaryLight)),
                            child: Icon(
                              Icons.arrow_back,
                              color: AppColors.primaryLight,
                            ),
                          ),
                  ),
                  // Dot indicators
                  Row(
                    children: List.generate(
                      contents.length,
                      (index) => buildDot(index, themeProvider),
                    ),
                  ),
                  // Next button
                  TextButton(
                    onPressed: () {
                      if (_currentPage == contents.length - 1) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LayoutScreen(),
                        ));
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: AppColors.primaryLight)),
                      child: Icon(
                        Icons.arrow_forward,
                        color: AppColors.primaryLight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, AppThemeProvider themeProvider) {
    return Container(
      height: 10,
      width: _currentPage == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: _currentPage == index
            ? AppColors.primaryLight
            : themeProvider.appTheme == ThemeMode.light
                ? AppColors.lightBlackColor
                : AppColors.whiteColor,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
