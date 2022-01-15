import 'package:bloc/bloc.dart';
import 'package:firstapp_fiftychanllenge/app/di.dart';
import 'package:firstapp_fiftychanllenge/data/network/app_api.dart';

import 'package:firstapp_fiftychanllenge/data/repository/repository.dart';
import 'package:firstapp_fiftychanllenge/data/request/login_request.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  //final pref =  SharedPreferences.getInstance();


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

  void log(email,pass) async{

    print(1);
    print(isAuthValid());
    if (isAuthValid() == true){
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
      (await _repo.login(LoginRequest(email,pass))).fold((l) => print(l.Message.toString()+"hhhhhhhhhhhhhhhhhhhhhhhhhhh"), (r) => print(r.customer.name.toString()+"hhhhhhhhhhhhhhhhhhhhhhhhhhhxxxxxx"));
    }
    /*
    var a = instance<AppServicesClient>() ;
    a.loginTry();*/
  }

}