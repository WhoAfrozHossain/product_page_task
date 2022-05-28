import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:product_page_task/core/database/localDb/localDBFuncation.dart';
import 'package:product_page_task/core/database/localDb/localDatabaseHelper.dart';
import 'package:product_page_task/core/network/network_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/apphelper/app_helper.dart';
import 'main.dart';

Future intiGetIt() async {
  sl.registerSingleton<AppNetworkInfo>(NetworkInfoImpl(Connectivity()));

  //local database
  sl.registerLazySingleton<LocalDBFunctions>(() => LocalDbFunctionImpl());
  sl.registerLazySingleton(
      () => AppLocalDatabaseHelper(localDBFunctions: sl()));

  // necessary classes
  sl.registerLazySingleton(() => AppHelper());

  // external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
