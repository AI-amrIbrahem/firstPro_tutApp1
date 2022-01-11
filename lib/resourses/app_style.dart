import 'package:flutter/material.dart';

import 'app_fonts.dart';

TextStyle _getTextStyle(double fontSize,String fontFamily,Color color,FontWeight fontWeight){
  return TextStyle(fontSize: fontSize,fontFamily: fontFamily,color: color,fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle({double fontSize = AppFontsSize.s12,String fontFamily=AppFontsConstants.fontFamily, required Color color ,FontWeight fontWeight = AppFontsWeight.regular}){
  return _getTextStyle(fontSize,fontFamily, color,fontWeight);
}

// bold style

TextStyle getBoldStyle({double fontSize = AppFontsSize.s12,String fontFamily=AppFontsConstants.fontFamily, required Color color ,FontWeight fontWeight = AppFontsWeight.bold}){
  return _getTextStyle(fontSize,fontFamily, color,fontWeight);
}

// semi bold style

TextStyle getSemiBoldStyle({double fontSize = AppFontsSize.s12,String fontFamily=AppFontsConstants.fontFamily, required Color color ,FontWeight fontWeight = AppFontsWeight.semiBold}){
  return _getTextStyle(fontSize,fontFamily, color,fontWeight);
}

// light style

TextStyle getLightStyle({double fontSize = AppFontsSize.s12,String fontFamily=AppFontsConstants.fontFamily, required Color color ,FontWeight fontWeight = AppFontsWeight.light}) {
  return _getTextStyle(fontSize,fontFamily, color,fontWeight);
}
// medium style

  TextStyle getMeidumStyle({double fontSize = AppFontsSize.s12,String fontFamily=AppFontsConstants.fontFamily, required Color color ,FontWeight fontWeight = AppFontsWeight.medium}) {
    return _getTextStyle(fontSize,fontFamily, color,fontWeight);
  }