import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_page_task/core/apphelper/appResponse/app_api_response.dart';
import 'package:product_page_task/core/database/localDb/localDBFuncation.dart';
import 'package:product_page_task/core/error/failures.dart';
import 'package:product_page_task/core/widgets/app_snack_bar.dart';
import 'package:product_page_task/features/product/data/model/product_item_model.dart';
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

  ProductItemModel? productItemModel;

  bool isLoadingData = false;

  init(BuildContext context) {
    this.context = context;

    BlocProvider.of<ProductBloc>(context).add(GetProductListEvent());
  }

  searchProduct(BuildContext context) {
    this.context = context;

    BlocProvider.of<ProductBloc>(context).add(
      GetProductListEvent(
        search: searchTextValue,
      ),
    );
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
      isLoadingData = false;

      emit(ProductsListErrorState());
    }, (r) {
      productListModel = ProductListModel.fromJson(jsonDecode(r.body!));

      if (event.nextUrl == null) {
        productList = productListModel?.data?.products?.results ?? [];
      } else {
        productList.addAll(productListModel?.data?.products?.results ?? []);
      }

      isLoadingData = false;

      emit(ProductsListSuccessState(productsList: productList));
    });
  }

  Future getProductItemData(GetProductItemEvent event,
      Emitter<ProductState> emit, ProductsUseCase productUseCase) async {
    Either<Failure, AppApiResponse> _res =
        await productUseCase.call(ProductItemPrams(slug: event.slug));

    _res.fold((l) async {
      isLoadingData = false;

      emit(ProductsListErrorState());
    }, (r) {
      productItemModel = ProductItemModel.fromJson(jsonDecode(r.body!));

      isLoadingData = false;

      emit(ProductItemSuccessState(item: productItemModel?.data));
    });
  }

  productListControllerListen(BuildContext context) {
    productListScrollController.addListener(() {
      if (productListScrollController.position.maxScrollExtent ==
          productListScrollController.offset) {
        if (productListModel?.data?.products?.next != null &&
            isLoadingData == false) {
          isLoadingData = true;
          BlocProvider.of<ProductBloc>(context).add(
            GetProductListEvent(
              nextUrl: productListModel?.data?.products?.next ?? null,
              isPagination: true,
            ),
          );
        }
      }
    });
  }

  Future getProductCartCountData(
      GetProductCartCountEvent event, Emitter<ProductState> emit) async {
    int? value = await getProductCart(event.slug) ?? 0;

    emit(ProductCartCountState(count: value, slug: event.slug));
  }

  Future<int?> getProductCart(String slug) async {
    int? value = await LocalDbFunctionImpl().getCart(slug);
    return value;
  }

  setProductCart(String slug, int value) async {
    await LocalDbFunctionImpl().setCart(slug, value);

    BlocProvider.of<ProductBloc>(context!).add(
      GetProductCartCountEvent(
        slug: slug,
      ),
    );
  }

  addProductCart(BuildContext context, String slug, int stock) async {
    this.context = context;

    int value = await getProductCart(slug) ?? 0;

    if (value <= stock) {
      setProductCart(slug, value + 1);
    } else {
      AppSnackBar.showErrorMessage(message: "Sorry, Stock is over");
    }
  }

  removeProductCart(BuildContext context, String slug) async {
    this.context = context;

    int value = await getProductCart(slug) ?? 0;

    if (value > 0) {
      setProductCart(slug, value - 1);
    } else {
      // AppSnackBar.showErrorMessage(message: "Sorry, Stock is over");
    }
  }
}
