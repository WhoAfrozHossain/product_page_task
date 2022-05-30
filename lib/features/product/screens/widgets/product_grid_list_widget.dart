import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'product_grid_item_widget.dart';

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
