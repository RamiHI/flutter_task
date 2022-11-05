import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {required this.textInputType,
      Key? key,
      this.textEditingController,
      this.onPressed,
      this.validator,
      this.textInputAction,
      this.obscureText = false,
      this.autoFocus = false,
      this.prefix,
      this.suffix,
      this.hintText,
      this.onChange,
      this.onSubmit,
      this.errorText,
      this.focusNode,
      this.enabled = true,
      this.label,
      this.onSave,
      this.maxLength,
      this.maxLines,
      this.isSide = false})
      : super(key: key);
  final TextEditingController? textEditingController;
  final Function()? onPressed;
  final String? Function(String?)? validator;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final Widget? prefix;
  final Widget? suffix;
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autoFocus;
  final Function(String)? onChange;
  final Function(String)? onSubmit;
  final Function(String?)? onSave;
  final bool enabled;
  final FocusNode? focusNode;
  final Widget? label;
  final bool isSide;
  final int? maxLength;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      onTap: onPressed,
      enabled: enabled,
      onSaved: onSave,
      maxLength: maxLength,
      maxLines: maxLines,
      focusNode: focusNode,
      autofocus: autoFocus,
      cursorColor: Theme.of(context).primaryColor,
      cursorHeight: 20,
      style: Theme.of(context)
          .textTheme
          .caption!
          .copyWith(color: ConstColors.blackColor),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10 ,vertical: 5),
          prefixIcon: prefix,
          suffixIcon: suffix,
          hintText: hintText,
          label: label,
          counterText: '',
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: ConstColors.blackColor),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          focusedBorder: isSide == true
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor))
              : InputBorder.none,
          enabledBorder: isSide == false
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ConstColors.greyColor))
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(.5))),
          errorBorder: isSide == true
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor))
              : InputBorder.none,
          border: isSide == true
              ? OutlineInputBorder(borderRadius: BorderRadius.circular(10))
              : InputBorder.none,
          errorStyle: const TextStyle(color: Colors.red),
          errorText: errorText),
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      validator: validator,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      obscureText: obscureText,
    );
  }
}
