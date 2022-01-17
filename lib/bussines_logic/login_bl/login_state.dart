part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class ValidState extends LoginState {}
class errorState extends LoginState {}
class loadState extends LoginState {}
class successState extends LoginState {}
