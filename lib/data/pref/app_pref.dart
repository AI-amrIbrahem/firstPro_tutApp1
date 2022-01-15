import 'package:firstapp_fiftychanllenge/resourses/app_language.dart';
import 'package:shared_preferences/shared_preferences.dart';

  const String KEY_PRE_LANG = "KEY_PRE_LANG";
class AppPrefrences{
  final SharedPreferences _preferences ;

  AppPrefrences(this._preferences);

  //future
  String getLangAppPref(){
    String? language = _preferences.getString(KEY_PRE_LANG);
    if(language!=null &&language.isNotEmpty){
      return language;
    }else{
      return LanguageType.ENGLISH.getValue();
    }
  }
}