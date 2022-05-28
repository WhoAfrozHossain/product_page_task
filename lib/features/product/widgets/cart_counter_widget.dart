import 'package:flutter/material.dart';
import 'package:product_page_task/core/utils/utils_export.dart';
import 'package:product_page_task/core/widgets/custom_icon_button.dart';
import 'package:product_page_task/core/widgets/custom_text_widget.dart';

class CartCounterWidget extends StatelessWidget {
  const CartCounterWidget({Key? key, this.count}) : super(key: key);

  final int? count;

  @override
  Widget build(BuildContext context) {
    return count == null || count! < 1
        ? CustomIconButton(
            icon: Icon(
              Icons.add_rounded,
              color: ColorManager.white,
            ),
            onTap: () {},
            gradientColor: ColorManager().gradientButtonColor(),
            borderRadius: AppSize.s36,
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
                  onTap: () {},
                  buttonColor: ColorManager.secondaryColor.withOpacity(.7),
                  borderRadius: AppSize.s36,
                  height: 25,
                  width: 25,
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(AppSize.s5),
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
                  onTap: () {},
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
