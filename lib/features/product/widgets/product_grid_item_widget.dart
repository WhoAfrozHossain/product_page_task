import 'package:flutter/material.dart';
import 'package:product_page_task/core/apphelper/app_helper_functions.dart';
import 'package:product_page_task/core/utils/utils_export.dart';
import 'package:product_page_task/core/widgets/custom_image_widget.dart';
import 'package:product_page_task/core/widgets/custom_space_widget.dart';
import 'package:product_page_task/core/widgets/custom_text_widget.dart';
import 'package:product_page_task/features/product/widgets/cart_counter_widget.dart';

class ProductGridItemWidget extends StatelessWidget {
  const ProductGridItemWidget({
    Key? key,
    this.productImage,
    this.productName,
    this.productCurrentBuyRate,
    this.productOldBuyRate,
    this.productCurrentSellRate,
    this.productSellBenefitPrice,
    this.stockCount,
    this.selectCount,
  }) : super(key: key);

  final String? productImage;
  final String? productName;
  final double? productCurrentBuyRate;
  final double? productOldBuyRate;
  final double? productCurrentSellRate;
  final double? productSellBenefitPrice;
  final int? stockCount;
  final int? selectCount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: AppSize.s15,
          child: Container(
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(AppSize.s16),
            ),
            padding: EdgeInsets.fromLTRB(
              AppSize.s8,
              AppSize.s8,
              AppSize.s8,
              AppSize.s15,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p16),
                    child: CustomImageWidget(
                      context: context,
                      imageUrl:
                          "https://www.ubuy.com.bd/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvODFuTTNHSnBqN0wuX1NMMTUwMF8uanBn.jpg",
                    ),
                  ),
                ),
                CustomTextWidget(
                  text: "Lays Classic Family Chips",
                  maxLine: 2,
                  isFullWidth: true,
                  style: getRegularStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s16,
                  ),
                ),
                CustomSpaceWidget.fromHeight(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleWithValueRow(
                      title: AppStrings.buy,
                      value: 20,
                      valueColor: ColorManager.secondaryColor,
                      valueSize: FontSize.s18,
                    ),
                    TitleWithValueRow(
                      value: 22,
                      isRemove: true,
                      valueColor: ColorManager.secondaryColor,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleWithValueRow(
                      title: AppStrings.sell,
                      value: 25,
                      valueColor: ColorManager.darkGrey,
                      valueSize: FontSize.s14,
                    ),
                    TitleWithValueRow(
                      title: AppStrings.profit,
                      value: 5,
                      isRemove: true,
                      valueColor: ColorManager.darkGrey,
                      valueSize: FontSize.s14,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        if (stockCount == null || stockCount! < 1)
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              decoration: BoxDecoration(
                color: ColorManager.secondaryLightColor,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CustomTextWidget(
                text: AppStrings.no_stock,
                style: getRegularStyle(
                  color: ColorManager.secondaryColor,
                  fontSize: FontSize.s14,
                ),
              ),
            ),
          ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(
            child: CartCounterWidget(
              count: 5,
            ),
          ),
        ),
      ],
    );
  }
}

class TitleWithValueRow extends StatelessWidget {
  const TitleWithValueRow({
    Key? key,
    this.title,
    this.value,
    this.isRemove = false,
    this.valueColor,
    this.valueSize,
  }) : super(key: key);

  final String? title;
  final double? value;
  final bool isRemove;
  final Color? valueColor;
  final double? valueSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (title != null)
          CustomTextWidget(
            text: title ?? "",
            style: getRegularStyle(fontSize: FontSize.s8),
          ),
        if (title != null) CustomSpaceWidget.fromWidth(5),
        CustomTextWidget(
          text: AmountGenerator.doubleToAmount(value ?? 0),
          style: getBoldStyle(color: valueColor, fontSize: valueSize).copyWith(
            decoration: isRemove ? TextDecoration.lineThrough : null,
          ),
        ),
      ],
    );
  }
}
