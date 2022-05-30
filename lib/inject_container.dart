import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:product_page_task/core/database/localDb/localDBFuncation.dart';
import 'package:product_page_task/core/database/localDb/localDatabaseHelper.dart';
import 'package:product_page_task/core/network/network_info.dart';
import 'package:product_page_task/features/product/data/datasource/products_remote_data_source.dart';
import 'package:product_page_task/features/product/data/repositories/products_repository_impl.dart';
import 'package:product_page_task/features/product/domain/repository/products_repository.dart';
import 'package:product_page_task/features/product/domain/usecase/products_use_case.dart';
import 'package:product_page_task/features/product/screens/bloc/product_bloc.dart';
import 'package:product_page_task/features/product/screens/function/product_functions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/apphelper/app_helper.dart';
import 'main.dart';

Future intiGetIt() async {
  sl.registerSingleton<AppNetworkInfo>(NetworkInfoImpl(Connectivity()));

  // Use Case
  sl.registerLazySingleton(
    () => ProductsUseCase(
      productsRepository: ProductsRepositoryImpl(
        appNetworkInfo: sl(),
        productsRemoteDataSource: sl(),
      ),
    ),
  );

  // Bloc
  sl.registerLazySingleton<ProductBloc>(
      () => ProductBloc(productsUseCase: sl()));

  // Repository Implement
  sl.registerLazySingleton<ProductsRepository>(() => ProductsRepositoryImpl(
      appNetworkInfo: sl(), productsRemoteDataSource: sl()));

  // Function class
  sl.registerLazySingleton(() => ProductFunctions());

  // Data source
  sl.registerLazySingleton<ProductsRemoteDataSource>(
      () => ProductsRemoteDataSourceImpl());

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
