import 'package:flutter/material.dart';

class StrokeBackground extends StatelessWidget {
  final Widget child;
  final Function() onTap;
  final double? height;

  const StrokeBackground({
    Key? key,
    required this.onTap,
    required this.child,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        height: height,
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey[200]!,
            width: 3,
          ),
        ),
        child: child,
      ),
    );
  }
}
