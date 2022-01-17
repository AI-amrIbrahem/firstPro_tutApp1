import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firstapp_fiftychanllenge/app/di.dart';
import 'package:firstapp_fiftychanllenge/data/pref/app_pref.dart';
import 'package:firstapp_fiftychanllenge/routes.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  int splashDuration = 3;
  late Timer timer;
  AppPrefrences appPrefrences = instance<AppPrefrences>();

  void startDelay(){
     timer = Timer(Duration(seconds: splashDuration),(){
       emit(ChangeSplash());
     });
  }

  void navPage(BuildContext context){
    timer.cancel();

    if (appPrefrences.isUserLoggedIn()) {
      Navigator.pushReplacementNamed(context,Routes.mainRoute);
    } else{
      if (appPrefrences.isOnBoardingScreenView()){
        Navigator.pushReplacementNamed(context,Routes.loginRoute);
      }else{
        Navigator.pushReplacementNamed(context,Routes.onBoardingRoute);
      }
    }
  }

}
