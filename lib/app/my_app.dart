import 'package:firstapp_fiftychanllenge/bussines_logic/boarding_bl/boarding_cubit.dart';
import 'package:firstapp_fiftychanllenge/bussines_logic/splash_bl/splash_cubit.dart';
import 'package:firstapp_fiftychanllenge/resourses/app_theme.dart';
import 'package:firstapp_fiftychanllenge/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  MyApp._internel();

  static final instance = MyApp._internel();

  factory MyApp(){
    return instance;
  }

  int appState = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashCubit(),
        ),
        BlocProvider(
          create: (context) => BoardingCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getAppTheme(),
        initialRoute: Routes.splashRoute,
        onGenerateRoute: RoutesGenerator.getRoute,
      ),
    );
  }

}
