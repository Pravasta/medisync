import 'package:flutter/material.dart';
import 'package:medisync/common/constant/app_colors.dart';
import 'package:medisync/common/constant/app_text.dart';

class ThemeDataStyle {
  static ThemeData lightColor = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      color: AppColors.whiteColor,
      titleTextStyle: AppText.text20.copyWith(
        color: AppColors.blackColor,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.blackColor,
      ),
      actionsIconTheme: const IconThemeData(
        color: AppColors.whiteColor,
      ),
    ),
  );
}
