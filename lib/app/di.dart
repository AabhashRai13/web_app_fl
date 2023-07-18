import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:find_scan_return_web/app/app_constants.dart';
import 'package:find_scan_return_web/app/preferences/shared_preferences_manager.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:get_it/get_it.dart';

import 'network/network_info.dart';

final sl = GetIt.instance;

Future<void> initAppModule() async {
  //Rest
  SharedPreferencesManager sharedPreferencesManager =
      await SharedPreferencesManager.getInstance();
  sl.registerSingleton<SharedPreferencesManager>(sharedPreferencesManager);
  // DI for tenant services
  //

  sl.registerSingleton<Dio>(Dio());

  sl<Dio>().options.baseUrl = AppConstants.devBaseURL;

//// connectivity
  sl.registerLazySingleton<Connectivity>(() => Connectivity());

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
}
