import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Widget? leading;
  final Function()? onTap;
  final Color? buttonColor;

  const CustomIconButton({
    Key? key,
    this.leading,
    this.onTap,
    this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap ?? () => Navigator.pop(context),
      icon: leading ??
          Icon(
            Icons.arrow_back,
            color: buttonColor ?? ThemeData().primaryIconTheme.color,
          ),
    );
  }
}
