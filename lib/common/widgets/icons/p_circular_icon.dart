import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class PCircularIcon extends StatelessWidget {
  // A custom Circular Icon widget with a background color.
  // Properties are:
  // Container [width], [height], & [backgroundColor],
  // Icon's [size], [color] & [onPressed]
  const PCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  
  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
        ? backgroundColor!
        : PHelperFunctions.isDarkMode(context)
            ? PColors.black.withOpacity(0.9)
            : PColors.white.withOpacity(0.9),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: color, size: size,),
      ),
    );
  }
}
