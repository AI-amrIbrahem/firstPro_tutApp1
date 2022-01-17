import 'package:firstapp_fiftychanllenge/app/di.dart';
import 'package:firstapp_fiftychanllenge/bussines_logic/boarding_bl/boarding_cubit.dart';
import 'package:firstapp_fiftychanllenge/data/models/slider_model.dart';
import 'package:firstapp_fiftychanllenge/data/pref/app_pref.dart';
import 'package:firstapp_fiftychanllenge/resourses/app_assets.dart';
import 'package:firstapp_fiftychanllenge/resourses/app_color.dart';
import 'package:firstapp_fiftychanllenge/resourses/app_strings.dart';
import 'package:firstapp_fiftychanllenge/resourses/app_values.dart';
import 'package:firstapp_fiftychanllenge/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late BoardingCubit boardingCubit;

  @override
  void initState() {
    super.initState();
    boardingCubit = BlocProvider.of<BoardingCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: 0);

    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColor.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark),
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: SliderModel.sliderList.length,
        onPageChanged: (index) {
          // cubit for change page
          boardingCubit.pageChanged(index);
        },
          itemBuilder: (context, index) {
          //return onBoarding Page
          //print(0);
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppSize.s20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  //child: BlocBuilder<BoardingCubit, BoardingState>(
                  //  builder: (context, state) {
                       child: Text(
                        boardingCubit.boardList[index].title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline1,
                      )
                 //   },
                 // ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  //child: BlocBuilder<BoardingCubit, BoardingState>(
                  //  builder: (context, state) {
                      child: Text(
                          boardingCubit.boardList[index].subTitle,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle1)
                 //   },
                //  ),
                ),
                SizedBox(
                  height: AppSize.s80,
                ),
              //  BlocBuilder<BoardingCubit, BoardingState>(
                //  builder: (context, state) {
                SvgPicture.asset(
                        boardingCubit.boardList[index].image)
               //   },
                //),
                //Image(image: AssetImage(boardingCubit.boardList[boardingCubit.pos].image),)
              ],
            ),
          );
        },
      ),
      bottomSheet: Container(
        color: AppColor.white,
        height: AppSize.s100,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  instance<AppPrefrences>().setOnBoardingScreenView();
                  Navigator.pushReplacementNamed(context,Routes.loginRoute);
                },
                child: Text(
                  AppStrings.skipButton,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            ),
            Container(
              color: AppColor.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      child: SizedBox(
                        height: AppSize.s20,
                        width: AppSize.s20,
                        child: SvgPicture.asset(AppImageAssets.leftArrow),
                      ),
                      onTap: () {
                        pageController.animateToPage(boardingCubit.back(), duration: Duration(seconds: 3), curve: Curves.slowMiddle);
                      },
                    ),
                  ),
                  BlocBuilder<BoardingCubit, BoardingState>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          for (int i = 0;
                              i < boardingCubit.boardList.length;
                              i++)
                            Padding(
                                padding: EdgeInsets.all(AppPading.p8),
                                child: i == boardingCubit.pos
                                    ? SvgPicture.asset(
                                        AppImageAssets.hollowCirlce)
                                    : SvgPicture.asset(
                                        AppImageAssets.solidCircle)),
                        ],
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      child: SizedBox(
                        height: AppSize.s20,
                        width: AppSize.s20,
                        child: SvgPicture.asset(AppImageAssets.rightArrow),
                      ),
                      onTap: () {
                        pageController.animateToPage(boardingCubit.next(), duration: Duration(seconds: 3), curve: Curves.bounceInOut);

                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
