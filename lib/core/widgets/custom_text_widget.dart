import 'package:product_page_task/core/utils/utils_export.dart';
import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final TextAlign? align;
  final int? maxLine;
  final bool? isFullWidth;
  final TextStyle? style;

  const CustomTextWidget({
    Key? key,
    required this.text,
    this.align,
    this.maxLine,
    this.isFullWidth,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
      constraints: BoxConstraints(
        minWidth: isFullWidth == null
            ? 0
            : isFullWidth!
                ? double.infinity
                : 10,
      ),
      child: Text(
        text,
        maxLines: maxLine,
        style: style ??
            getRegularStyle(
              color: ColorManager.lightGrey,
              fontSize: FontSize.s14,
            ),
        textAlign: align ?? TextAlign.justify,
      ),
    );
  }
}
