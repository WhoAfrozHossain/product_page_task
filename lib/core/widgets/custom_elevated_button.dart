import 'package:flutter/material.dart';
import 'package:product_page_task/core/utils/utils_export.dart';

// ignore: must_be_immutable
class CustomElevatedButton extends StatelessWidget {
  final String? title;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final double height, minWidth;
  final Widget? titleWidget;
  Color? buttonColor;
  final bool addBorder;

  CustomElevatedButton({
    Key? key,
    this.title,
    required this.onPressed,
    this.textStyle,
    this.height = 52,
    this.minWidth = 100,
    this.buttonColor,
    this.titleWidget,
    this.addBorder = false,
  })  : assert(
          title == null || titleWidget == null,
          'Cannot provide both a title and a child\n'
          'To provide both, use "titleWidget: Text(title)".',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    buttonColor ??= ColorManager.primaryColor;

    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.resolveWith<Size>(
          (states) => Size(
            minWidth,
            height,
          ),
        ),
        shape: addBorder
            ? MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
                (states) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: buttonColor == ColorManager.primaryColor
                        ? Colors.white
                        : ColorManager.primaryColor,
                    width: 2,
                  ),
                ),
              )
            : ThemeData().textButtonTheme.style!.shape,
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
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return ColorManager.lightGrey;
            }
            return buttonColor!;
          },
        ),
      ),
      child: titleWidget ??
          Text(
            title!,
            style: textStyle ??
                getBoldStyle(
                  fontSize: FontSize.s14,
                  color: buttonColor == ColorManager.white ||
                          buttonColor == Colors.transparent
                      ? ColorManager.primaryColor
                      : ColorManager.white,
                ),
          ),
    );
  }
}
