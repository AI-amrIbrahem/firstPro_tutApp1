import 'package:bloc/bloc.dart';
import 'package:firstapp_fiftychanllenge/app/di.dart';
import 'package:firstapp_fiftychanllenge/data/pref/app_pref.dart';

import 'package:firstapp_fiftychanllenge/data/repository/repository.dart';
import 'package:firstapp_fiftychanllenge/data/request/login_request.dart';
import 'package:firstapp_fiftychanllenge/routes.dart';
import 'package:firstapp_fiftychanllenge/widgets/state_render/state_render_implementer.dart';
import 'package:firstapp_fiftychanllenge/widgets/state_render/state_renderer.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  //final pref =  SharedPreferences.getInstance();

  late FlowState flowState;
  final Repo _repo = instance<Repo>();//Repo(AppServicesClient(AppPrefrences(pref)), NetworkInfo(DataConnectionChecker()));

  bool emailValid = false;
  bool passwordValid = false;
  bool isValidEmail(String email){
    if (email.isNotEmpty){
      return true;
    }else {
      return false;
    }
  }

  bool isValidPssowrd(String pass){
    if (pass.isNotEmpty){
      return true;
    }else {
      return false;
    }
  }

  bool isAuthValid(){
    print("$emailValid ccccccc $passwordValid");
    if(emailValid==true && passwordValid==true){
      print("$passwordValid aaaaaaaaaaaaa $emailValid");
      return true;
    }

    else
    return false;
  }

  emailChanged(String s){
    if (isValidEmail(s)){
      emailValid = true;

      emit(ValidState());
    }else{

        emailValid = false;
        emit(ValidState());

    }
  }

  passChanged(String s){
    if (isValidPssowrd(s)){
      passwordValid = true;
      emit(ValidState());
    }else{

        passwordValid = false;
        emit(ValidState());


    }
  }

  void log(email,pass,context) async{
    load();
    if (isAuthValid() == true){
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
      (await _repo.login(LoginRequest(email,pass))).fold((l) => error(l.Message), (r){
        //navigate
        flowState = ContentState();
        instance<AppPrefrences>().setUserLoggedIn();
        Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
        //emit(successState());

      });
    }
    /*
    var a = instance<AppServicesClient>() ;
    a.loginTry();*/
  }

  void load() {
    flowState = LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE,massage: "loading");
    emit(loadState());
  }

  void error(String msg) {
    flowState = ErrorState(stateRendererType: StateRendererType.POPUP_ERROR_STATE,msg: msg);
    emit(errorState());
  }

}