import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Widget? icon;
  final Function()? onTap;
  final Color? buttonColor;
  final LinearGradient? gradientColor;
  final double borderRadius;
  final double height;
  final double width;

  const CustomIconButton({
    Key? key,
    this.icon,
    this.onTap,
    this.buttonColor,
    this.gradientColor,
    this.borderRadius = 0,
    this.height = 40,
    this.width = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: buttonColor,
        gradient: gradientColor,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild?.unfocus();
          }

          onTap ?? () => Navigator.pop(context);
        },
        icon: icon ??
            Icon(
              Icons.arrow_back,
              color: buttonColor ?? ThemeData().primaryIconTheme.color,
            ),
      ),
    );
  }
}
