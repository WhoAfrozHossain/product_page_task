import 'package:flutter/material.dart';
import 'package:product_page_task/core/apphelper/app_helper_functions.dart';
import 'package:product_page_task/core/utils/utils_export.dart';
import 'package:product_page_task/core/widgets/custom_space_widget.dart';
import 'package:product_page_task/core/widgets/custom_text_widget.dart';

class ProductDetailsInformationWidget extends StatelessWidget {
  const ProductDetailsInformationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextWidget(
          text: "Lays Classic Family Chips",
          isFullWidth: true,
          style: getBoldStyle(
            color: ColorManager.black,
            fontSize: FontSize.s18,
          ),
        ),
        CustomSpaceWidget.fromHeight(AppSize.s8),
        Row(
          children: [
            CustomTextWidget(
              text: AppStrings.brand,
              style: getRegularStyle(
                color: ColorManager.lightGrey,
                fontSize: FontSize.s14,
              ),
            ),
            CustomTextWidget(
              text: "ADFD",
              style: getBoldStyle(
                color: ColorManager.black,
                fontSize: FontSize.s14,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: AppPadding.p5,
                horizontal: AppPadding.p12,
              ),
              padding: EdgeInsets.all(AppPadding.p4),
              decoration: BoxDecoration(
                color: ColorManager.secondaryColor,
                borderRadius: BorderRadius.circular(AppSize.s20),
              ),
            ),
            CustomTextWidget(
              text: AppStrings.distributor,
              style: getRegularStyle(
                color: ColorManager.lightGrey,
                fontSize: FontSize.s14,
              ),
            ),
            Expanded(
              child: CustomTextWidget(
                text: "ADFdadfD",
                maxLine: 1,
                isFullWidth: true,
                style: getBoldStyle(
                  color: ColorManager.black,
                  fontSize: FontSize.s14,
                ),
              ),
            ),
          ],
        ),
        CustomSpaceWidget.fromHeight(AppSize.s8),
        Container(
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(AppSize.s16),
          ),
          padding: EdgeInsets.all(AppSize.s15),
          child: Column(
            children: [
              TitleWithValueRow(
                title: AppStrings.buyPrice,
                value: 220,
                color: ColorManager.secondaryColor,
                fontSize: FontSize.s18,
              ),
              TitleWithValueRow(
                title: AppStrings.sellPrice,
                value: 250,
                color: ColorManager.black,
                fontSize: FontSize.s16,
              ),
              CustomTextWidget(
                text:
                    "-----------------------------------------------------------------------------------------",
                maxLine: 1,
                isFullWidth: true,
                style: getBoldStyle(
                  color: ColorManager.lightGrey.withOpacity(.3),
                  fontSize: FontSize.s14,
                ),
                align: TextAlign.center,
              ),
              TitleWithValueRow(
                title: AppStrings.totalProfit,
                value: 30,
                color: ColorManager.black,
                fontSize: FontSize.s14,
              ),
            ],
          ),
        ),
        CustomSpaceWidget.fromHeight(AppSize.s28),
        ClipPath(
          clipper: HexagonClipper(),
          child: Container(
            height: 75,
            width: 70,
            decoration: BoxDecoration(
              gradient: ColorManager().gradientButtonColor(),
            ),
            child: Center(
              child: CustomTextWidget(
                text: AppStrings.wantToBuy,
                maxLine: 2,
                isFullWidth: true,
                style: getRegularStyle(
                  color: ColorManager.white,
                  fontSize: FontSize.s14,
                ),
                align: TextAlign.center,
              ),
            ),
          ),
        ),
        CustomSpaceWidget.fromHeight(AppSize.s28),
        CustomTextWidget(
          text: AppStrings.description,
          isFullWidth: true,
          style: getMediumStyle(
            color: ColorManager.black,
            fontSize: FontSize.s16,
          ),
        ),
        CustomSpaceWidget.fromHeight(AppSize.s8),
        CustomTextWidget(
          text:
              "Lays Classic Family Chips Lays Classic Family Chips Lays Classic Family Chips Lays Classic Family Chips Lays Classic Family Chips Lays Classic Family Chips Lays Classic Family Chips Lays Classic Family Chips Lays Classic Family Chips Lays Classic Family Chips Lays Classic Family Chips Lays Classic Family Chips Lays Classic Family Chips",
          isFullWidth: true,
          style: getRegularStyle(
            color: ColorManager.lightGrey,
            fontSize: FontSize.s14,
          ),
        ),
        CustomSpaceWidget.fromHeight(AppSize.s8),
      ],
    );
  }
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.4050633, size.height * 0.02520384);
    path.cubicTo(
        size.width * 0.4638101,
        size.height * -0.005953047,
        size.width * 0.5361899,
        size.height * -0.005953058,
        size.width * 0.5949367,
        size.height * 0.02520384);
    path.lineTo(size.width * 0.8983684, size.height * 0.1861314);
    path.cubicTo(
        size.width * 0.9571165,
        size.height * 0.2172884,
        size.width * 0.9933051,
        size.height * 0.2748686,
        size.width * 0.9933051,
        size.height * 0.3371826);
    path.lineTo(size.width * 0.9933051, size.height * 0.6590360);
    path.cubicTo(
        size.width * 0.9933051,
        size.height * 0.7213500,
        size.width * 0.9571165,
        size.height * 0.7789302,
        size.width * 0.8983684,
        size.height * 0.8100872);
    path.lineTo(size.width * 0.5949367, size.height * 0.9710151);
    path.cubicTo(
        size.width * 0.5361899,
        size.height * 1.002172,
        size.width * 0.4638101,
        size.height * 1.002172,
        size.width * 0.4050633,
        size.height * 0.9710151);
    path.lineTo(size.width * 0.1016311, size.height * 0.8100872);
    path.cubicTo(
        size.width * 0.04288405,
        size.height * 0.7789302,
        size.width * 0.006694405,
        size.height * 0.7213500,
        size.width * 0.006694405,
        size.height * 0.6590372);
    path.lineTo(size.width * 0.006694405, size.height * 0.3371826);
    path.cubicTo(
        size.width * 0.006694405,
        size.height * 0.2748686,
        size.width * 0.04288405,
        size.height * 0.2172884,
        size.width * 0.1016311,
        size.height * 0.1861314);
    path.lineTo(size.width * 0.4050633, size.height * 0.02520384);
    path.close();

    // Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    // paint_0_fill.shader = ui.Gradient.linear(
    //     Offset(size.width * 0.4936709, size.height * -16.46814),
    //     Offset(size.width * 0.5000000, size.height * 2.160895),
    //     [Color(0xff6210E1).withOpacity(1), Color(0xff1400AE).withOpacity(1)],
    //     [0.223536, 0.555821]);
    // canvas.drawPath(path_0, paint_0_fill);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class TitleWithValueRow extends StatelessWidget {
  const TitleWithValueRow({
    Key? key,
    this.title,
    this.value,
    this.color,
    this.fontSize,
  }) : super(key: key);

  final String? title;
  final double? value;
  final Color? color;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextWidget(
          text: title ?? "",
          style: getBoldStyle(color: color, fontSize: fontSize),
        ),
        CustomTextWidget(
          text: AmountGenerator.doubleToAmount(value ?? 0),
          style: getBoldStyle(color: color, fontSize: fontSize),
        ),
      ],
    );
  }
}
