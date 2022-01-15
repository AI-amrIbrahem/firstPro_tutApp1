import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firstapp_fiftychanllenge/data/network/app_api.dart';
import 'package:firstapp_fiftychanllenge/data/network/network_info.dart';
import 'package:firstapp_fiftychanllenge/data/pref/app_pref.dart';
import 'package:firstapp_fiftychanllenge/data/repository/repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;
Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  // shared prefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  instance
      .registerLazySingleton<AppPrefrences>(() => AppPrefrences(instance()));
  instance
      .registerLazySingleton<AppServicesClient>(() => AppServicesClient(instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(
          () => NetworkInfo(Connectivity()));
  // repository
  instance.registerLazySingleton<Repo>(
          () => Repo(instance(), instance()));
/*
  initLoginModule(){
    if(!GetIt.I.isRegistered<LoginUseCase>()){
      instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
      instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
    }

 */
}