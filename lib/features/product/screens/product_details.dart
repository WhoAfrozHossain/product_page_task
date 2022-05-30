import 'package:flutter/material.dart';
import 'package:product_page_task/core/utils/utils_export.dart';
import 'package:product_page_task/core/widgets/custom_appbar_widget.dart';
import 'package:product_page_task/core/widgets/custom_space_widget.dart';
import 'package:product_page_task/features/product/screens/widgets/product_details_information_widget.dart';
import 'package:product_page_task/features/product/screens/widgets/product_search_widget.dart';
import 'package:product_page_task/features/product/screens/widgets/product_slider_widget.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(
        title: AppStrings.productDetails,
      ),
      backgroundColor: ColorManager.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(
                AppPadding.p14,
                0,
                AppPadding.p14,
                AppPadding.p14,
              ),
              child: ProductSearchWidget(),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(AppPadding.p14),
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ProductSliderWidget(
                      slider: [
                        "https://www.ubuy.com.bd/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvODFuTTNHSnBqN0wuX1NMMTUwMF8uanBn.jpg"
                      ],
                    ),
                    CustomSpaceWidget.fromHeight(AppSize.s20),
                    ProductDetailsInformationWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
