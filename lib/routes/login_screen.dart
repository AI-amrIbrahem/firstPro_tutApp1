import 'package:firstapp_fiftychanllenge/bussines_logic/login_bl/login_cubit.dart';
import 'package:firstapp_fiftychanllenge/resourses/app_assets.dart';
import 'package:firstapp_fiftychanllenge/resourses/app_color.dart';
import 'package:firstapp_fiftychanllenge/resourses/app_strings.dart';
import 'package:firstapp_fiftychanllenge/resourses/app_values.dart';
import 'package:firstapp_fiftychanllenge/widgets/state_render/state_render_implementer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bProvider = BlocProvider.of<LoginCubit>(context);
    //bProvider.flowState.getScreenWidget(context, _getContent(bProvider), (){});

    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) {
        //previous is LoginInitial ? print("aaaaa what"):print("aaaaa what1");
        print ("$previous            cccc $current");
        if (current is loadState||current is errorState){
          print ("$previous            cccca10 $current");
          return true;

        }

        else
          return false;
      },
    builder: (context, state) {
      print(state);
      print("amr we are here ");
      if (state is loadState){
        print("amr we are here in loading");
        return bProvider.flowState.getScreenWidget(context, _getContent(bProvider,context), (){});
      }else if (state is errorState){
        print("amr we are here in error");
        return bProvider.flowState.getScreenWidget(context, _getContent(bProvider,context), (){});
      }else
      return _getContent(bProvider,context);
  },
);
  }

  _getContent(LoginCubit bProvider,BuildContext context){
    final emailControler = TextEditingController();
    final passControler = TextEditingController();
    return Scaffold(
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.only(top: AppPading.p60),
        color: AppColor.white,
        child: SingleChildScrollView(
          child: Form(
            //key: _formKey,
            child: Column(
              children: [
                Image.asset(AppImageAssets.splashLogo),
                //SvgPicture.asset(AppImageAssets.login_ic),
                SizedBox(
                  height: AppSize.s12,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppPading.p18, right: AppPading.p18),
                  child: BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      print("xzx amr 00 " + bProvider.emailValid.toString());

                      return TextFormField(
                          controller: emailControler,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: AppStrings.hintLoginEmail,
                            labelText: AppStrings.hintLoginEmail,
                            errorText: bProvider.emailValid
                                ? null
                                : AppStrings.emailError,
                          ),
                          onChanged: (s) {
                            bProvider.emailChanged(s);
                          });
                    },
                  ),
                ),

                SizedBox(
                  height: AppSize.s12,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppPading.p18, right: AppPading.p18),
                  child: BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      print("xzx amr " + bProvider.passwordValid.toString());
                      return TextFormField(
                        controller: passControler,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: AppStrings.hintLoginPassword,
                          labelText: AppStrings.hintLoginPassword,
                          errorText: bProvider.passwordValid
                              ? null
                              : AppStrings.passwordError,
                        ),
                        onChanged: (s) {
                          print("aaaaaaaaaa " + s.toString());
                          bProvider.passChanged(s.toString());
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: AppSize.s12,
                ),
                Padding(
                  padding:
                  EdgeInsets.only(left: AppPading.p8, right: AppPading.p18),
                  child: BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      if (bProvider.isAuthValid()) {
                        return ElevatedButton(
                          onPressed: () {
                            print(emailControler.text.toString() +
                                passControler.text.toString());
                            bProvider.log(emailControler.text.toString(),
                                passControler.text.toString());
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: AppPading.p28, right: AppPading.p28),
                            child: Text(AppStrings.buttonLogin,
                                style: TextStyle(color: AppColor.white)),
                          ),
                        );
                      } else {
                        return ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: AppPading.p28, right: AppPading.p28),
                            child: Text(
                              AppStrings.buttonLogin,
                              style: TextStyle(color: AppColor.error),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
                Padding(padding: const EdgeInsets.only(right: AppPading.p28,left: AppPading.p28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context,Routes.forgotPasswordRoute);
                        },
                        child: Text(
                          AppStrings.forgetPassword,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context,Routes.registerRoute);
                        },
                        child: Text(
                          AppStrings.registerFromLogin,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
