import 'package:flutter/material.dart';
import 'package:product_page_task/core/widgets/custom_appbar_widget.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
