import 'package:flutter/material.dart';

class CustomTextField1 extends StatelessWidget {
  final String? title;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? minLines;
  final GestureTapCallback? onTap;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final AutovalidateMode? autoValidateMode;
  final bool asterisk;
  final bool? showCursor;
  final bool readOnly;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final Color? fillColor;
  final Widget? suffixIcon;
  final IconData? prefixIcon;
  final double? prefixIconSize;
  final double? suffixIconSize;
  final EdgeInsetsGeometry? contentPadding;
  final String? labelText;
  final TextStyle? labelStyle;

  const CustomTextField1(
      {Key? key,
      this.contentPadding = const EdgeInsets.fromLTRB(10, 13.5, 10, 12.5),
      this.asterisk = false,
      this.validator,
      this.onChanged,
      this.obscureText = false,
      this.autoValidateMode,
      this.labelStyle,
      this.title,
      this.hint,
      this.labelText,
      this.controller,
      this.keyboardType,
      this.maxLines = 1,
      this.onTap,
      this.minLines,
      this.showCursor,
      this.suffixIcon,
      this.prefixIconSize = 18,
      this.suffixIconSize = 18,
      this.fillColor = const Color(0xffF5F5F5),
      this.prefixIcon,
      this.errorText,
      this.readOnly = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (title == null)
            ? Container()
            : Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: RichText(
                  text: TextSpan(
                    text: title,
                    style: const TextStyle(fontSize: 15, color: Colors.black),
                    children: [
                      (asterisk)
                          ? const TextSpan(
                              text: ' *',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 16.0),
                            )
                          : const TextSpan(text: '')
                    ],
                  ),
                ),
              ),
        TextFormField(
          style: const TextStyle(color: Colors.white),
          onChanged: onChanged,
          showCursor: showCursor,
          readOnly: readOnly,
          autovalidateMode: autoValidateMode,
          obscureText: obscureText,
          validator: validator,
          onTap: onTap,
          controller: controller,
          keyboardType: keyboardType,
          minLines: minLines,
          maxLines: maxLines,
          decoration: InputDecoration(
            isCollapsed: true,
            contentPadding: (suffixIcon == null)
                ? contentPadding
                : const EdgeInsets.only(left: 10),
            prefixIcon: (prefixIcon == null)
                ? null
                : Icon(
                    prefixIcon,
                    color: Colors.white,
                    size: prefixIconSize,
                  ),
            labelText: labelText,
            floatingLabelStyle:
                const TextStyle(color: Color(0xff162342), fontSize: 16),
            labelStyle: const TextStyle(color: Color(0xff9E9E9E), fontSize: 16),
            suffixIcon: suffixIcon,
            errorText: errorText,
            fillColor: Colors.transparent,
            filled: true,
            isDense: true,
            hintText: hint,
            hintStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w200, fontSize: 15),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 0.8, color: Colors.red),
            ),
            focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.red),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 0.5),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTextField2 extends StatelessWidget {
  //v=0.4
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autoValidateMode;
  final String errorText;
  final String hintText;
  final String? title;
  final Color fillColor;

  //These cant be applied as it will disturb the textField
  //final int maxLines;
  //final int minLines;

  const CustomTextField2(
      {Key? key,
      this.hintText = "",
      this.validator,
      this.autoValidateMode,
      this.title,
      this.controller,
      this.keyboardType,
      this.errorText = "",
      this.fillColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == null
            ? Container()
            : Text(
                title!,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Roboto-Regular',
                  fontWeight: FontWeight.bold,
                  color: Color(0xff3E515B),
                ),
              ),
        Container(
          height: 62,
          margin: const EdgeInsets.only(top: 5),
          child: TextFormField(
            textAlignVertical: TextAlignVertical.bottom,
            autovalidateMode: autoValidateMode,
            validator: validator,
            style: const TextStyle(
                fontFamily: 'Roboto-Regular',
                color: Color(0xff3E515B),
                fontSize: 15,
                fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                  fontFamily: 'Roboto-Regular',
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              errorText: errorText,
              //isDense: true,
              fillColor: fillColor,
              filled: true,
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(width: 0.8, color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(width: 1, color: Colors.red),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                  color: Color(0xffD1D4D7),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                  width: 0.8,
                  color: Color(0xff8B288E),
                ),
              ),
            ),
            controller: controller,
            keyboardType: keyboardType,
          ),
        ),
      ],
    );
  }
}
