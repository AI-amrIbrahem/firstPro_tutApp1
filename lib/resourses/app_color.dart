
import 'dart:ui';

class AppColor {
  // just replace # with 0xff
  static final Color primary= Color(0xffED9728);
  static final Color darkPrimary= Color(0xffaa6c1c);
  static final Color darkGrey= Color(0xff525252);
  static final Color grey= Color(0xff737477);
  static final Color lightGrey= Color(0xff9E9E9E);
  // the opicity will change so we will make change in ff like that
  static final Color primaryOpicty70= Color(0xB3eD9728);
  static final Color white= Color(0xffffffff);
  static final Color black= Color(0xff000000);
  static final Color error= Color(0xffff0000);

}

// the method to get Color from String like #ED9728
/*
extension HexColor on Color{
  static Color fromHex(String hex){
    hex = hex.replaceAll('#', '');
    if(hex.length == 6)
      hex ="FF"+hex;
    return Color(int.parse(hex,radix: 16));
  }
}*/