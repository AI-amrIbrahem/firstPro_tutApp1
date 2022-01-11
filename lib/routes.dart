import 'package:firstapp_fiftychanllenge/resourses/app_color.dart';
import 'package:firstapp_fiftychanllenge/resourses/app_strings.dart';
import 'package:firstapp_fiftychanllenge/resourses/app_style.dart';
import 'package:firstapp_fiftychanllenge/routes/details_screen.dart';
import 'package:firstapp_fiftychanllenge/routes/forgot_screen.dart';
import 'package:firstapp_fiftychanllenge/routes/login_screen.dart';
import 'package:firstapp_fiftychanllenge/routes/main_screen.dart';
import 'package:firstapp_fiftychanllenge/routes/onboarding_screen.dart';
import 'package:firstapp_fiftychanllenge/routes/register_screen.dart';
import 'package:firstapp_fiftychanllenge/routes/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes{
  static const splashRoute = '/';
  static const onBoardingRoute = '/onBoarding';
  static const loginRoute = '/login';
  static const registerRoute = '/register';
  static const forgotPasswordRoute = '/forgotPassword';
  static const mainRoute = '/main';
  static const storeDetailsRoute = '/storeDetails';
}

class RoutesGenerator{
  static Route<dynamic> getRoute(RouteSettings routeSettings){
      switch(routeSettings.name){
        case Routes.splashRoute:
          return MaterialPageRoute(builder: (_)=>const SplashScreen());
        case Routes.onBoardingRoute:
          return MaterialPageRoute(builder: (_)=>const OnBoardingScreen());
        case Routes.loginRoute:
          return MaterialPageRoute(builder: (_)=>const LoginScreen());
        case Routes.registerRoute:
          return MaterialPageRoute(builder: (_)=>const RegisterScreen());
        case Routes.forgotPasswordRoute:
          return MaterialPageRoute(builder: (_)=>const ForgotPasswordScreen());
        case Routes.mainRoute:
          return MaterialPageRoute(builder: (_)=>const MainScreen());
        case Routes.storeDetailsRoute:
          return MaterialPageRoute(builder: (_)=>const StoreDetailsScreen());
        default :
          return UnDifendRoute();
      }
  }

  static Route UnDifendRoute() {
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(title:Text(AppStrings.noRouteFound,style: getRegularStyle(color: AppColor.error),)),
      );
    });
  }
}