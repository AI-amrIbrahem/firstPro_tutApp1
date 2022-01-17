import 'package:firstapp_fiftychanllenge/bussines_logic/forgot_bl/forgot_password_cubit.dart';
import 'package:firstapp_fiftychanllenge/resourses/app_assets.dart';
import 'package:firstapp_fiftychanllenge/resourses/app_color.dart';
import 'package:firstapp_fiftychanllenge/resourses/app_strings.dart';
import 'package:firstapp_fiftychanllenge/resourses/app_values.dart';
import 'package:flutter/material.dart';
import 'package:firstapp_fiftychanllenge/widgets/state_render/state_render_implementer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bProvider = BlocProvider.of<ForgotPasswordCubit>(context);

    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      buildWhen: (previous, current) {
        if (current is loadState ||
            current is errorState ||current is successState) {
          return true;
        } else
          return false;
      },
      builder: (context, state) {
        if (state is loadState || state is errorState ||state is successState) {
          return bProvider.flowState.getScreenWidget(context, _getContent(bProvider, context), () {});
        } else {
          return _getContent(bProvider, context);
        }
      },
    );


    return _getContent(bProvider,context);
  }

  _getContent(ForgotPasswordCubit bProvider, BuildContext context) {
    final emailControler = TextEditingController();
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
                SizedBox(
                  height: AppSize.s12,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppPading.p18, right: AppPading.p18),
                  child: BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                    builder: (context, state) {
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
                SizedBox(
                  height: AppSize.s12,
                ),
                Padding(
                  padding:
                  EdgeInsets.only(left: AppPading.p8, right: AppPading.p18),
                  child: BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                    builder: (context, state) {
                      if (bProvider.emailValid) {
                        return ElevatedButton(
                          onPressed: () {
                            bProvider.forgot(emailControler.text.toString());
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: AppPading.p28, right: AppPading.p28),
                            child: Text(AppStrings.Email,
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
                              AppStrings.Email,
                              style: TextStyle(color: AppColor.error),
                            ),
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
