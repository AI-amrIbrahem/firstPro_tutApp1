import 'package:firstapp_fiftychanllenge/data/models/contacts_model.dart';
import 'package:firstapp_fiftychanllenge/data/models/customer_model.dart';

class AuthResponseModel{
  CustomerModel customer;
  ContactsModel contacts;

  AuthResponseModel(this.customer, this.contacts);
}