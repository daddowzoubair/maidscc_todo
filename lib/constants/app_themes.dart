import 'package:flutter/material.dart';

import 'app_blur_radius.dart';
import 'app_colors.dart';
import 'app_dimensions.dart';
import 'app_fonts.dart';
import 'app_radius.dart';

abstract class AppThemes {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primaryColor: AppColors.primaryColor,
      colorScheme: const ColorScheme.light(
          onPrimary: Colors.white, primary: AppColors.primaryColor),
      fontFamily: AppFonts.montserrat,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.eightRadius),
        ),
        alignLabelWithHint: true,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.black38),
        contentPadding: const EdgeInsets.symmetric(
            vertical: AppDimensions.sixteenDimension),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          textStyle: Theme.of(context).textTheme.titleMedium,
          padding: const EdgeInsets.symmetric(horizontal: AppDimensions.twentyFourDimension, vertical: AppDimensions.sixteenDimension),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.eightRadius),
          ),
        ),
      ),
      tabBarTheme: TabBarTheme(
          splashFactory: NoSplash.splashFactory,
          dividerColor: Colors.transparent,
          labelColor: Colors.white,
          unselectedLabelColor: AppColors.primaryColor,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.eightRadius),
            color: AppColors.primaryColor.withOpacity(0.5),
          ),
          indicatorSize: TabBarIndicatorSize.tab),
      cardTheme: CardTheme(
        elevation: AppBlurRadius.fourBlurRadius,
        shadowColor: Colors.black38,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.eightRadius)),
        margin: const EdgeInsets.symmetric(horizontal: AppDimensions.eightDimension , vertical: AppDimensions.eightDimension)
      ),
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        toolbarHeight: AppDimensions.appbarHeight,
          color: AppColors.primaryColor,
          titleTextStyle: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white)));

  //~TODO
  // static ThemeData darkTheme = ThemeData();
}
