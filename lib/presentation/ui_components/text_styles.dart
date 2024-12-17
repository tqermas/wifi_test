import 'package:flutter/material.dart';
import 'package:wifi_list/presentation/ui_components/colors.dart';

class AppStyles {

  AppStyles._();

  static TextStyle get title => TextStyle(
      fontSize: 27,
      color: AppColors.blackShade,
      fontFamily: 'LatoBold');

  static TextStyle get body => TextStyle(
      fontSize: 18,
      color: AppColors.blackShade,
      fontFamily: 'LatoRegular');

}