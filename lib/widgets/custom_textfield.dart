import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sizer/sizer.dart';

class CustomMultilineTextField extends StatelessWidget {
  final Function(String) onTextChange;
  final Function()? onPasswordEyeClick;
  final String? hint;
  final TextEditingController? initialValue;
  final String? topTitle;
  final Color? topTitleColor;
  final int maxLines;
  final bool maxLinesDisabled;
  final double? height;
  final double? width;
  final bool hasBorder;
  final bool enable;
  final bool addEnterInHint;
  final bool obscureText;
  final double paddingVer;
  final double paddingHor;
  final TextInputType textInputType;
  final Function(String)? onSubmitted;
  final TextInputAction textInputAction;
  final Color? backgroundColor;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool hasPasswordEye;
  final bool hasMargin;
  final Widget? prefixIcon;
  final Widget? suffIcon;
  final FormFieldValidator<String>? validator;
  final String? errorText;
  final TextCapitalization textCapitlization;

  const CustomMultilineTextField({
    Key? key,
    required this.onTextChange,
    this.hint,
    this.height,
    this.onSubmitted,
    this.hasBorder = true,
    this.enable = true,
    this.hasMargin = true,
    this.obscureText = false,
    this.addEnterInHint = true,
    this.hasPasswordEye = false,
    this.initialValue,
    this.width,
    this.topTitle,
    this.topTitleColor,
    this.prefixIcon,
    this.suffIcon,
    this.onPasswordEyeClick,
    this.floatingLabelBehavior,
    this.textInputType = TextInputType.multiline,
    this.textInputAction = TextInputAction.newline,
    this.paddingVer = 15,
    this.paddingHor = 24,
    this.maxLinesDisabled = false,
    this.backgroundColor,
    this.maxLines = 1,
    this.errorText,
    required this.textCapitlization,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (topTitle != null)
          Padding(
            padding: EdgeInsets.only(bottom: 1.h),
            child: Text(topTitle ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                )),
          ),
        TextFormField(
          minLines: 1,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          // textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.top,
          obscureText: obscureText,
          onChanged: onTextChange,
          // onFieldSubmitted: onSubmitted,
          maxLines: maxLinesDisabled ? null : maxLines,
          // onChanged: onTextChange,
          textCapitalization: textCapitlization,
          enabled: enable,
          controller: initialValue,
          validator: validator,

          decoration: InputDecoration(
            filled: false,
            isDense: false,
            floatingLabelBehavior:
                floatingLabelBehavior ?? FloatingLabelBehavior.never,
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.symmetric(
                vertical: paddingVer, horizontal: paddingHor),
            counterText: '',
            errorText: errorText,
            prefixIcon: prefixIcon,
            //suffixStyle: TextStyles.normalBlackBodyText,
            suffixIcon: suffIcon ?? const SizedBox.shrink(),
            focusColor: Colors.grey.shade200,
            fillColor: Colors.white,
            focusedErrorBorder: hasBorder
                ? OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade200,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(5)))
                : null,
            focusedBorder: hasBorder
                ? OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade200,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(5)))
                : null,
            //border: OutlineInputBorder(),
            disabledBorder: hasBorder
                ? OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade200,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(5)))
                : null,
            enabledBorder: hasBorder
                ? OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade200,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(5)))
                : null,
            errorBorder: hasBorder
                ? const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5)))
                : null,
            border: hasBorder ? null : InputBorder.none,
            labelText: hint ?? '',
            labelStyle: const TextStyle(color: Colors.grey),
            hintText: '${addEnterInHint ? '' : ''}${hint ?? ''}',
            hintStyle: Get.textTheme.bodyMedium!.copyWith(
              //fontFamily: FontConstants.robotoRegular,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
              fontSize: 10.sp,
            ),
          ),
          style: Get.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
            //fontFamily: FontConstants.robotoRegular,
            color: Colors.black,
            //height: 1,
          ),
        ),
      ],
    );
  }
}
