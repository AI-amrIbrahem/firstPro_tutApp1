import 'package:firstapp_fiftychanllenge/bussines_logic/splash_bl/splash_cubit.dart';
import 'package:firstapp_fiftychanllenge/resourses/app_assets.dart';
import 'package:firstapp_fiftychanllenge/resourses/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    BlocProvider.of<SplashCubit>(context).startDelay();
  }

  @override
  Widget build(BuildContext homeContext) {

    return BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashInitial){
            BlocProvider.of<SplashCubit>(context).startDelay();
          }else if (state is ChangeSplash){
            BlocProvider.of<SplashCubit>(context).navPage(homeContext);
          }
        },
        child: Scaffold(
          backgroundColor: AppColor.primary,
          body: Center(
              child: const Image(
                image: AssetImage(AppImageAssets.splashLogo),)),
        ),
    );
  }
}
