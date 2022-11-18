import 'package:flutter/material.dart';
import 'package:ptc_project/view/resourse/color_manager.dart';

import 'font_manager.dart';
import 'style_manager.dart';
import 'values_manager.dart';
Map<int, Color> color =
{
  50:Color.fromRGBO(51, 153, 255, .1),
  100:Color.fromRGBO(51, 153, 255, .2),
  200:Color.fromRGBO(51, 153, 255, .3),
  300:Color.fromRGBO(51, 153, 255, .4),
  400:Color.fromRGBO(51, 153, 255, .5),
  500:Color.fromRGBO(51, 153, 255, .6),
  600:Color.fromRGBO(51, 153, 255, .7),
  700:Color.fromRGBO(51, 153, 255, .8),
  800:Color.fromRGBO(51, 153, 255, .9),
  900:Color.fromRGBO(51, 153, 255, 1),
};
class ThemeManager{
  static var myTheme = ThemeData(
    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => ColorManager.primaryColor)
    ),
    primarySwatch: MaterialColor(0xff334F76,color),
    primaryColor: ColorManager.primaryColor,
    iconTheme: IconThemeData(
      color: ColorManager.primaryColor,
    ),
    primaryColorLight: ColorManager.primaryColor,
    primaryIconTheme: IconThemeData(
      color: ColorManager.primaryColor
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding:const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(
          color: ColorManager.lightGray, fontSize: FontSize.s14),
      //label
      labelStyle: getMediumStyle(
          color: ColorManager.black, fontSize: FontSize.s14),
      //error
      errorStyle: getRegularStyle(
          color: ColorManager.error, fontSize: FontSize.s14),

      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s8)
      ),

      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s8)
      ),

      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s8)
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s8)
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: getRegularStyle(
              color: ColorManager.white, fontSize: FontSize.s17),
          minimumSize: Size(double.infinity, AppSize.s60),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s8)
          )
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorManager.primaryColor
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: ColorManager.primaryColor,
        centerTitle: true,
        elevation: AppSize.s4,
        titleTextStyle: getRegularStyle(
            color: ColorManager.white, fontSize: FontSize.s16)
    ),
  );
}