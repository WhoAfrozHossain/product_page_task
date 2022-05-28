import 'package:flutter/material.dart';
import 'package:product_page_task/core/utils/utils_export.dart';
import 'package:product_page_task/core/widgets/custom_space_widget.dart';
import 'package:product_page_task/features/product/widgets/product_grid_list_widget.dart';
import 'package:product_page_task/features/product/widgets/product_search_widget.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(AppPadding.p14),
              child: ProductSearchWidget(),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(AppPadding.p14),
                physics: BouncingScrollPhysics(),
                child: ProductGridListWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
