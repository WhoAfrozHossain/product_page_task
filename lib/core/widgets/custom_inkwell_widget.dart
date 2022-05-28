import 'package:product_page_task/core/utils/utils_export.dart';
import 'package:flutter/material.dart';

class CustomInkwellWidget extends Material {
  CustomInkwellWidget({
    Key? key,
    required Function() onTap,
    required Widget child,
  }) : super(
          key: key,
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            splashColor: ColorManager.primaryColor.withOpacity(0.24),
            child: child,
          ),
        );

  CustomInkwellWidget.text({
    Key? key,
    required Function() onTap,
    required String title,
    TextStyle? textStyle,
    Color? textColor,
    double? textSize,
  })  : assert(
          textColor == null || textStyle == null,
          'Cannot provide both a textColor and a textStyle\n'
          'To provide both, use "textStyle: TextStyle(color: color)".',
        ),
        assert(
          textSize == null || textStyle == null,
          'Cannot provide both a textSize and a textStyle\n'
          'To provide both, use "textStyle: TextStyle(size: textSize)".',
        ),
        super(
          key: key,
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Text(
              title,
              style: textStyle ??
                  getRegularStyle(
                    color: textColor ?? ColorManager.black,
                    fontSize: FontSize.s14,
                  ),
            ),
          ),
        );
}
