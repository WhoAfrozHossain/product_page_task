import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_page_task/core/apphelper/appResponse/app_api_response.dart';
import 'package:product_page_task/core/error/failures.dart';
import 'package:product_page_task/features/product/data/model/product_list_model.dart';
import 'package:product_page_task/features/product/data/model/product_model.dart';
import 'package:product_page_task/features/product/domain/usecase/products_use_case.dart';
import 'package:product_page_task/features/product/screens/bloc/product_bloc.dart';

class ProductFunctions {
  BuildContext? context;

  ScrollController productListScrollController = new ScrollController();

  TextEditingController searchController = new TextEditingController();

  String searchTextValue = "";

  List<ProductModel> productList = [];
  ProductListModel? productListModel;

  init(BuildContext context) {
    this.context = context;

    BlocProvider.of<ProductBloc>(context).add(GetProductListEvent());
  }

  Future getProductListData(GetProductListEvent event,
      Emitter<ProductState> emit, ProductsUseCase productUseCase,
      {bool isPagination: false}) async {
    emit(ProductLoadingState(isPagination: isPagination));

    Either<Failure, AppApiResponse> _res = await productUseCase.call(
        ProductListPrams(
            nextUrl: event.nextUrl,
            limit: event.limit,
            offset: event.offset,
            search: event.search));

    _res.fold((l) async {
      emit(ProductsListErrorState());
    }, (r) {
      productListModel = ProductListModel.fromJson(jsonDecode(r.body!));

      if (event.nextUrl == null) {
        productList = productListModel?.data?.products?.results ?? [];
      } else {
        productList.addAll(productListModel?.data?.products?.results ?? []);
      }

      emit(ProductsListSuccessState(productsList: productList));
    });
  }
}
