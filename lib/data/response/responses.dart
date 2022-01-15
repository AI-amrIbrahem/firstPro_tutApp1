import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

@JsonSerializable()
class BaseResponse{
  @JsonKey(name: "status")
  late int? status;
  @JsonKey(name: "message")
  late String? message;

}


@JsonSerializable()
class CustomerResponse{
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "numofnotifiy")
  int? numofnotifiy;

  CustomerResponse(this.id, this.name, this.numofnotifiy);
  factory CustomerResponse.fromJson(json)=>_$CustomerResponseFromJson(json);
  Map<String,dynamic> customerToJson() => _$CustomerResponseToJson(this);

}

@JsonSerializable()
class ContactsResponse{
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "link")
  String? link;
  @JsonKey(name: "email")
  String? email;

  ContactsResponse(this.phone, this.link, this.email);

  factory ContactsResponse.fromJson(json)=>_$ContactsResponseFromJson(json);
  Map<String,dynamic> contactsToJson() => _$ContactsResponseToJson(this);

}
@JsonSerializable()
class AuthenticationResponse extends BaseResponse{
  @JsonKey(name: "customer")
  CustomerResponse? customer;
  @JsonKey(name: "contacts")
  ContactsResponse? contacts;

  AuthenticationResponse(this.customer, this.contacts);

  factory AuthenticationResponse.fromJson(json)=>_$AuthenticationResponseFromJson(json);
  Map<String,dynamic> authResponseToJson() => _$AuthenticationResponseToJson(this);

}