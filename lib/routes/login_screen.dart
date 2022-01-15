import 'package:firstapp_fiftychanllenge/bussines_logic/login_bl/login_cubit.dart';
import 'package:firstapp_fiftychanllenge/resourses/app_assets.dart';
import 'package:firstapp_fiftychanllenge/resourses/app_color.dart';
import 'package:firstapp_fiftychanllenge/resourses/app_strings.dart';
import 'package:firstapp_fiftychanllenge/resourses/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var _formKey;
    var emailControler = TextEditingController();
    var passControler = TextEditingController();
    var bProvider = BlocProvider.of<LoginCubit>(context);
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
                SizedBox(height: AppSize.s12,),
                Padding(padding: EdgeInsets.only(
                    left: AppPading.p18, right: AppPading.p18),
                  child: BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      print("xzx amr 00 "+ bProvider.emailValid.toString());

                      return TextFormField(
                        controller: emailControler,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: AppStrings.hintLoginEmail,
                          labelText: AppStrings.hintLoginEmail,
                          errorText: bProvider.emailValid ? null : AppStrings
                              .emailError,
                        ),
                          onChanged:(s) {
                            bProvider.emailChanged(s);
                          }
                      );
                    },
                  ),
                ),

                SizedBox(height: AppSize.s12,),
                Padding(padding: EdgeInsets.only(
                    left: AppPading.p18, right: AppPading.p18),
                  child: BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      print("xzx amr "+ bProvider.passwordValid.toString());
                      return TextFormField(
                        controller: passControler,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: AppStrings.hintLoginPassword,
                          labelText: AppStrings.hintLoginPassword,
                          errorText: bProvider.passwordValid ? null : AppStrings
                              .passwordError,
                        ),
                        onChanged:(s) {
                          print("aaaaaaaaaa "+s.toString());
                          bProvider.passChanged(s.toString());
                        },

                      );
                    },
                  ),
                ),
                SizedBox(height: AppSize.s12,),
                Padding(padding: EdgeInsets.only(
                    left: AppPading.p8, right: AppPading.p18),
                  child: BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      if (bProvider.isAuthValid()){
                        return ElevatedButton(onPressed: () {
                          print(emailControler.text.toString()+passControler.text.toString());
                          bProvider.log(emailControler.text.toString(),passControler.text.toString());
                        },
                          child: Padding(
                            padding: const EdgeInsets.only(left: AppPading.p28, right: AppPading.p28),
                            child: Text(AppStrings.buttonLogin, style: TextStyle(color: AppColor.white)),
                          ),

                        );
                      }else {
                        return ElevatedButton(onPressed: () {

                        },
                          child: Padding(
                            padding: const EdgeInsets.only(left: AppPading.p28, right: AppPading.p28),
                            child: Text(AppStrings.buttonLogin , style: TextStyle(color: AppColor.error),),
                          ),

                        );
                      }

                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}