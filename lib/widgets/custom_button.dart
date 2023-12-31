import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final double? height;
  final Color backgroundColor;
  final Color textColor;
  final double width;
  final VoidCallback onPressed;
  final Color color;
  final Widget? icon;
  final Color? surfaceTintColors;

  const CustomElevatedButton({
    super.key,
    required this.buttonText,
    this.height,
    required this.backgroundColor,
    required this.textColor,
    required this.width,
    required this.onPressed,
    required this.color,
    this.icon,
    this.surfaceTintColors,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 4.h,
      child: icon == null
          ? ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                  side: BorderSide(color: color, width: 0.3.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  foregroundColor: textColor,
                  backgroundColor: backgroundColor,
                  surfaceTintColor: Colors.white),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  buttonText,
                  style: TextStyle(color: textColor),
                ),
              ),
            )
          : ElevatedButton.icon(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: color, width: 0.3.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                foregroundColor: textColor,
                backgroundColor: backgroundColor,
                surfaceTintColor: surfaceTintColors ,
              ),
              icon: icon!,
              label: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  buttonText,
                  style: TextStyle(color: textColor),
                ),
              ),
            ),
    );
  }
}
