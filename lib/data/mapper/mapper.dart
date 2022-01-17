import 'package:firstapp_fiftychanllenge/data/models/auth_model.dart';
import 'package:firstapp_fiftychanllenge/data/models/contacts_model.dart';
import 'package:firstapp_fiftychanllenge/data/models/customer_model.dart';
import 'package:firstapp_fiftychanllenge/data/models/forgot_model.dart';
import 'package:firstapp_fiftychanllenge/data/response/responses.dart';
import 'package:firstapp_fiftychanllenge/app/extensions.dart';
extension CustomerResponseMapper on CustomerResponse?{
  CustomerModel toDomin(){
    return CustomerModel(this?.name?.orEmpty()??"",this?.id?.orEmpty()??"",this?.numofnotifiy?.orEmpty()??0);
  }
}
extension ContactsResponseMapper on ContactsResponse?{
  ContactsModel toDomin(){
    return ContactsModel(this?.phone?.orEmpty()??"",this?.email?.orEmpty()??"",this?.link?.orEmpty()??"");
  }
}

extension AuthResponseMapper on AuthenticationResponse?{
  AuthResponseModel toDomin(){
    return AuthResponseModel(this?.customer?.toDomin()??CustomerModel("","",0),this?.contacts?.toDomin()??ContactsModel("","",""));
  }
}

extension forgotResponseMapper on ForgoPasswordResponse?{
  ForgoPasswordResponseModel toDomin(){
    return ForgoPasswordResponseModel(this?.support?.orEmpty()??"",this?.message?.orEmpty()??"",this?.status?.orEmpty()??0);
  }
}