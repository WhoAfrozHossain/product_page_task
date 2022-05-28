import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_page_task/core/utils/utils_export.dart';
import 'package:product_page_task/core/widgets/custom_icon_button.dart';
import 'package:product_page_task/core/widgets/custom_text_field_widget.dart';
import 'package:product_page_task/features/product/widgets/product_grid_item_widget.dart';

class ProductGridListWidget extends StatelessWidget {
  const ProductGridListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: .55,
      ),
      itemBuilder: (_, index) => ProductGridItemWidget(),
      itemCount: 12,
    );
  }
}
