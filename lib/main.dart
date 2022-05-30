import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_page_task/core/utils/utils_export.dart';
import 'package:product_page_task/features/product/data/repositories/products_repository_impl.dart';
import 'package:product_page_task/features/product/domain/usecase/products_use_case.dart';
import 'package:product_page_task/features/product/screens/bloc/product_bloc.dart';
import 'package:product_page_task/inject_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'core/apphelper/app_helper.dart';

GetIt sl = GetIt.instance;

late BuildContext globalContext;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await intiGetIt();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: ColorManager.backgroundColor,
    ),
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ProductBloc(
            productsUseCase: ProductsUseCase(
              productsRepository: ProductsRepositoryImpl(
                appNetworkInfo: sl(),
                productsRemoteDataSource: sl(),
              ),
            ),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: AppHelper.snackBarKey,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.productList,
      theme: getApplicationTheme(),
    );
  }
}
