import 'package:product_page_task/core/utils/utils_export.dart';
import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final TextAlign? align;
  final int? maxLine;
  final bool? isFullWidth;

  const CustomTextWidget({
    Key? key,
    required this.text,
    this.fontWeight,
    this.color,
    this.fontSize,
    this.align,
    this.maxLine,
    this.isFullWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
      constraints: BoxConstraints(
        minWidth: isFullWidth == null
            ? 0
            : isFullWidth!
                ? MediaQuery.of(context).size.width
                : 10,
      ),
      child: Text(
        text,
        maxLines: maxLine ?? 1,
        style: TextStyle(
          fontWeight: fontWeight ?? FontWeight.normal,
          color: color ?? ColorManager.lightGrey,
          fontSize: fontSize ?? FontSize.s16,
        ),
        textAlign: align ?? TextAlign.justify,
      ),
    );
  }
}
