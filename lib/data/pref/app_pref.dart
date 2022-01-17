import 'package:firstapp_fiftychanllenge/resourses/app_language.dart';
import 'package:shared_preferences/shared_preferences.dart';

  const String KEY_PRE_LANG = "KEY_PRE_LANG";
  const String PRESS_KEY_ONBOARDING_SCREEN = "PRESS_KEY_ONBOARDING_SCREEN";
  const String PRESS_KEY_IS_USER_LOGGED_IN = "PRESS_KEY_IS_USER_LOGGED_IN";

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

  void setOnBoardingScreenView(){
    _preferences.setBool(PRESS_KEY_ONBOARDING_SCREEN,true);
  }

  bool isOnBoardingScreenView(){
    return _preferences.getBool(PRESS_KEY_ONBOARDING_SCREEN)??false;
  }

  void setUserLoggedIn(){
    _preferences.setBool(PRESS_KEY_IS_USER_LOGGED_IN,true);
  }

  bool isUserLoggedIn(){
    return _preferences.getBool(PRESS_KEY_IS_USER_LOGGED_IN)??false;
  }

}