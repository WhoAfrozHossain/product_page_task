import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_page_task/core/utils/utils_export.dart';
import 'package:product_page_task/core/widgets/custom_icon_button.dart';
import 'package:product_page_task/core/widgets/custom_text_field_widget.dart';

class ProductSearchWidget extends StatelessWidget {
  const ProductSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextFieldWidget(
      hintText: AppStrings.searchHint,
      suffixIcon: CustomIconButton(
        icon: Icon(CupertinoIcons.search),
        onTap: () {},
      ),
    );
  }
}
