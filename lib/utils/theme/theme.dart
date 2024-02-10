import 'package:e_mart/utils/theme/custom_themes/appbar_theme.dart';
import 'package:e_mart/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:e_mart/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:e_mart/utils/theme/custom_themes/chip_theme.dart';
import 'package:e_mart/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:e_mart/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:e_mart/utils/theme/custom_themes/text_field_theme.dart';
import 'package:e_mart/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';



class PAppTheme {
  PAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: PTextTheme.lightTextTheme,
    chipTheme: PChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: PAppBarTheme.lightAppBarTheme,
    checkboxTheme: PCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: PBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: PElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: POutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: PTextFormFieldTheme.lightInputDecorationTheme
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: PTextTheme.darkTextTheme,
    chipTheme: PChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: PAppBarTheme.darkAppBarTheme,
    checkboxTheme: PCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: PBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: PElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: POutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: PTextFormFieldTheme.darkInputDecorationTheme
  );
}