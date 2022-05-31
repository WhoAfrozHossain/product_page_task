import 'package:flutter/cupertino.dart';
import 'package:product_page_task/core/utils/utils_export.dart';
import 'package:product_page_task/core/widgets/custom_icon_button.dart';
import 'package:product_page_task/core/widgets/custom_text_field_widget.dart';

import '../../../../main.dart';
import '../function/product_functions.dart';

class ProductSearchWidget extends StatelessWidget {
  const ProductSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextFieldWidget(
      hintText: AppStrings.searchHint,
      controller: sl<ProductFunctions>().searchController,
      onChanged: (value) {
        sl<ProductFunctions>().searchTextValue = value ?? "";
      },
      suffixIcon: CustomIconButton(
        icon: Icon(CupertinoIcons.search),
        onTap: () {
          print("Search Call");
          sl<ProductFunctions>().searchProduct(context);
        },
      ),
    );
  }
}
