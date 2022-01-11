import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firstapp_fiftychanllenge/routes.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  int splashDuration = 3;
  late Timer timer;

  void startDelay(){
     timer = Timer(Duration(seconds: splashDuration),(){
       emit(ChangeSplash());
     });
  }

  void navPage(BuildContext context){
    timer.cancel();
    Navigator.pushReplacementNamed(context,Routes.onBoardingRoute);
  }
}
