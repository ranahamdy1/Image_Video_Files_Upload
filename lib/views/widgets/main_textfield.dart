import 'package:arch_image/core/helper/extensions/assetss_widgets.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class MainTextField extends StatefulWidget {
  final String hint;
  final FontWeight? fontWeight;
  final Color? colorText;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final int maxLines;
  final String? init;
  final bool isDense;
  final EdgeInsets? contentPadding;
  final TextStyle? style;
  final int? maxInputLength;
  final bool hideKeyboard;
  final OutlineInputBorder? border;
  final Color? filledColor;
  final Color? borderColor;
  final bool enable;
  final void Function(String value)? onSubmit;
  final bool unfocusWhenTapOutside;
  final void Function()? onTap;
  final void Function(String value)? onChanged;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;

  const MainTextField({
    super.key,
    this.hint = '',
    this.fontWeight,
    this.colorText,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.init,
    this.maxInputLength,
    this.border,
    this.isDense = true,
    this.contentPadding,
    this.filledColor = AppColors.yLightWhiteColor,
    this.suffix,
    this.onSubmit,
    this.enable = true,
    this.style,
    this.hideKeyboard = false,
    this.borderColor,
    this.suffixIcon,
    this.unfocusWhenTapOutside = false,
    this.onTap,
    this.onChanged,
    this.controller,
    this.validator,
  });

  @override
  State<MainTextField> createState() => MainTextFieldState();
}

class MainTextFieldState extends State<MainTextField> {
  TextEditingController controller = TextEditingController();

  @override
  void didUpdateWidget(MainTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller &&
        widget.controller != null) {
      controller = widget.controller!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorHeight: 22.0,
      enabled: widget.enable,
      maxLines: widget.maxLines,
      maxLength: widget.maxInputLength,
      onFieldSubmitted: widget.onSubmit,
      keyboardType: widget.keyboardType,
      style: widget.style ??
          const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      onTapOutside: (event) {
        if (widget.unfocusWhenTapOutside) {
          FocusScope.of(context).requestFocus(FocusNode());
        }
      },
      validator: widget.validator,
      decoration: InputDecoration(
        isDense: widget.isDense,
        prefixIcon: widget.prefixIcon,
        suffix: widget.suffix,
        contentPadding: widget.contentPadding,
        hintText: widget.hint.isNotEmpty ? widget.hint : null,
        hintStyle: const TextStyle(color: Colors.black54),
        border: _border(color: widget.borderColor ?? AppColors.yPrimaryColor),
        disabledBorder:
            _border(color: widget.borderColor ?? AppColors.yPrimaryColor),
        enabledBorder:
            _border(color: widget.borderColor ?? AppColors.yPrimaryColor),
        focusedBorder: _border(color: AppColors.yPrimaryColor),
        errorBorder: _border(color: AppColors.yRedColor),
        fillColor: widget.filledColor ?? AppColors.yLightWhiteColor,
        filled: true,
        suffixIcon: widget.suffixIcon,
      ),
    );
  }

  OutlineInputBorder _border({required Color color}) {
    return widget.border == null
        ? OutlineInputBorder(
            borderRadius: 6.cBorder,
            borderSide: BorderSide(color: color),
          )
        : widget.border!.copyWith(borderSide: BorderSide(color: color));
  }
}
