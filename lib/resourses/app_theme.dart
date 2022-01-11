
import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_fonts.dart';
import 'app_style.dart';
import 'app_values.dart';

ThemeData getAppTheme(){
  return ThemeData(
      //splashColor: AppColor.primaryOpicty70,
      colorScheme: ColorScheme(
        primary: AppColor.primary,
        onPrimary: AppColor.primaryOpicty70,
        primaryVariant: AppColor.primaryOpicty70,

        background: AppColor.white,
        onBackground: AppColor.black,

        secondary: AppColor.grey,
        onSecondary: AppColor.white,
        secondaryVariant: AppColor.darkPrimary,

        error: AppColor.error,
        onError: AppColor.white,

        surface: AppColor.white,
        onSurface: AppColor.black,

        brightness: Brightness.light,

      ),
      cardTheme: CardTheme(
        shadowColor: AppColor.grey,
        elevation: AppSize.s4
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: AppSize.s4,
        shadowColor: AppColor.primaryOpicty70,
        titleTextStyle: getRegularStyle(color: AppColor.white , fontSize: AppFontsSize.s16)
      ),
      buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: AppColor.grey,
        buttonColor: AppColor.primary,
        splashColor: AppColor.primaryOpicty70,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: getRegularStyle(color:AppColor.white,),
          primary: AppColor.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s12))
        )
      ),
      textTheme: TextTheme(
        headline1: getSemiBoldStyle(color: AppColor.darkGrey,fontSize: AppFontsSize.s16),
        subtitle1: getMeidumStyle(color: AppColor.lightGrey,fontSize: AppFontsSize.s12),
        subtitle2: getMeidumStyle(color: AppColor.primary,fontSize: AppFontsSize.s12),
        caption: getRegularStyle(color: AppColor.grey),
        bodyText1: getRegularStyle(color: AppColor.grey),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPading.p8),
        hintStyle: getRegularStyle(color: AppColor.grey),
        labelStyle: getMeidumStyle(color: AppColor.darkGrey),
        errorStyle: getRegularStyle(color: AppColor.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color:AppColor.grey,
            width: AppSize.s1_5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color:AppColor.primary,
            width: AppSize.s1_5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color:AppColor.error,
            width: AppSize.s1_5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color:AppColor.primary,
            width: AppSize.s1_5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
      )

  );
}