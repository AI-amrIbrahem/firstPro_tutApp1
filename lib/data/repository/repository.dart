import 'package:dartz/dartz.dart';
import 'package:firstapp_fiftychanllenge/data/models/auth_model.dart';
import 'package:firstapp_fiftychanllenge/data/models/forgot_model.dart';
import 'package:firstapp_fiftychanllenge/data/network/app_api.dart';
import 'package:firstapp_fiftychanllenge/data/network/failure.dart';
import 'package:firstapp_fiftychanllenge/data/network/network_info.dart';
import 'package:firstapp_fiftychanllenge/data/request/login_request.dart';
import 'package:firstapp_fiftychanllenge/data/mapper/mapper.dart';
class Repo{
  AppServicesClient _appServicesClient;
  NetworkInfo _networkInfo;

  Repo(this._appServicesClient, this._networkInfo);

  Future<Either<Failure,AuthResponseModel>> login(LoginRequest loginRequest)async{
    if (await _networkInfo.isConnected()){
      // call api
      final response = await _appServicesClient.login(loginRequest);

      if (response.status==0){//success
        return Right(response.toDomin());
      }else{
        return Left(Failure(409,response.message ==null ? "we have error in Api Side" : response.message!));
      }
    }else {
      // error connect
      return Left(Failure(404,"please check you connection"));
    }
  }

  Future<Either<Failure,ForgoPasswordResponseModel>> forgotPassword(String email)async{
    if (await _networkInfo.isConnected()){
      // call api

      final response = await _appServicesClient.forgotPass(email);
      if (response.status==0){//success
        print("hodaaa ${response.support}");
        return Right(response.toDomin());
      }else{
        return Left(Failure(409,response.message == null ? "we have error in sending" : response.support!));
      }
    }else {
      // error connect
      return Left(Failure(404,"please check you connection"));
    }
  }

}