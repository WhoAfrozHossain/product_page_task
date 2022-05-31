import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_page_task/core/utils/utils_export.dart';
import 'package:product_page_task/core/widgets/custom_icon_button.dart';
import 'package:product_page_task/core/widgets/custom_text_widget.dart';
import 'package:product_page_task/features/product/screens/function/product_functions.dart';

import '../../../../main.dart';
import '../bloc/product_bloc.dart';

class CartCounterWidget extends StatelessWidget {
  CartCounterWidget({Key? key, required this.slug, required this.stock})
      : super(key: key);

  final String slug;
  final int stock;

  int? countCart;

  @override
  Widget build(BuildContext context) {
    sl<ProductFunctions>()
        .getProductCart(slug)
        .then((value) => countCart = value);

    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) {},
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (_, state) {
          if (state is ProductCartCountState) {
            if (state.slug == slug) {
              countCart = state.count;
            }
            return _view(context, countCart);
          } else {
            return _view(context, countCart);
          }
        },
      ),
    );
  }

  _view(BuildContext context, int? count) {
    print("$slug :: $count");

    return count == null || count < 1
        ? CustomIconButton(
            icon: Icon(
              Icons.add_rounded,
              color: ColorManager.white,
            ),
            onTap: () {
              sl<ProductFunctions>().addProductCart(context, slug, stock);
            },
            gradientColor: ColorManager().gradientButtonColor(),
            borderRadius: AppSize.s36,
            height: 30,
            width: 30,
          )
        : Container(
            decoration: BoxDecoration(
              color: ColorManager.secondaryLightColor,
              borderRadius: BorderRadius.circular(AppSize.s36),
            ),
            margin: EdgeInsets.symmetric(horizontal: AppMargin.m14),
            padding: EdgeInsets.all(AppPadding.p5),
            child: Row(
              children: [
                CustomIconButton(
                  icon: Icon(
                    Icons.remove_rounded,
                    color: ColorManager.white,
                  ),
                  onTap: () {
                    sl<ProductFunctions>().removeProductCart(context, slug);
                  },
                  backgroundColor: ColorManager.secondaryColor.withOpacity(.2),
                  borderRadius: AppSize.s36,
                  height: 25,
                  width: 25,
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      // padding: EdgeInsets.all(AppSize.s5),
                      child: CustomTextWidget(
                        text: "$count ${AppStrings.pis}",
                        style: getBoldStyle(
                          color: ColorManager.secondaryColor,
                          fontSize: FontSize.s14,
                        ),
                      ),
                    ),
                  ),
                ),
                CustomIconButton(
                  icon: Icon(
                    Icons.add_rounded,
                    color: ColorManager.white,
                  ),
                  onTap: () {
                    sl<ProductFunctions>().addProductCart(context, slug, stock);
                  },
                  gradientColor: ColorManager().gradientButtonColor(),
                  borderRadius: AppSize.s36,
                  height: 25,
                  width: 25,
                ),
              ],
            ),
          );
  }
}
