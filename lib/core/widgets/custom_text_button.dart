import 'package:product_page_task/core/utils/utils_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? title;
  final double height;
  final double? buttonWidth, textFontSize;
  final Widget? child;
  Color? buttonColor;
  final bool addBorder;
  final double radius;

  CustomTextButton({
    Key? key,
    required this.onPressed,
    this.title,
    this.height = 40,
    this.child,
    this.buttonColor,
    this.buttonWidth,
    this.textFontSize,
    this.addBorder = false,
    this.radius = 12,
  })  : assert(
          title == null || child == null,
          'Cannot provide both a title and a child\n'
          'To provide both, use "child: Text(title)".',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    buttonColor ??= ColorManager.primaryColor;

    return TextButton(
      onPressed: onPressed,
      style: ThemeData().textButtonTheme.style!.copyWith(
            minimumSize: MaterialStateProperty.resolveWith<Size>(
              (states) => buttonWidth == null
                  ? Size.fromHeight(height)
                  : Size(
                      buttonWidth!,
                      height,
                    ),
            ),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return buttonColor == Colors.transparent ||
                          buttonColor == Colors.white
                      ? ColorManager.primaryColor.withOpacity(.24)
                      : Colors.white.withOpacity(.14);
                }

                return null;
              },
            ),
            shape: addBorder
                ? MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
                    (states) => RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius),
                      side: BorderSide(
                        color: ColorManager.primaryColor,
                        width: 1,
                      ),
                    ),
                  )
                : ThemeData().textButtonTheme.style!.shape,
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return ColorManager.lightGrey;
                }

                return buttonColor!;
              },
            ),
          ),
      child: child ??
          Text(
            title!,
            style: getMediumStyle(
              fontSize: textFontSize ?? FontSize.s14,
              color: buttonColor == ColorManager.white ||
                      buttonColor == Colors.transparent
                  ? ColorManager.primaryColor
                  : ColorManager.white,
            ),
          ),
    );
  }
}
