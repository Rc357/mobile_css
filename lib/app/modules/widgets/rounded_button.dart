import 'package:css/app/constants/app_colors.dart';
import 'package:css/app/constants/app_fonts.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.hasGradient,
    required this.textColor,
    required this.textSize,
    this.buttonHeight,
    this.fontFamily,
    this.fontWeight,
    this.backgroundColor,
    this.elevation,
    this.borderSide,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String text;
  final bool hasGradient;
  final Color textColor;
  final double textSize;
  final double? buttonHeight;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final double? elevation;
  final BorderSide? borderSide;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.hexd8d8d8,
        elevation: elevation ?? 0,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          side: borderSide ?? BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: hasGradient
              ? const LinearGradient(
                  colors: <Color>[AppColors.blue, AppColors.lBlue],
                  // 45 degree is equal to 0.7853982 radians
                  transform: GradientRotation(0.7853982),
                )
              : null,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          width: double.infinity,
          height: buttonHeight ?? 50,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: textSize,
              fontFamily: fontFamily ?? AppFonts.roboto,
              fontWeight: fontWeight ?? FontWeight.w400,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
