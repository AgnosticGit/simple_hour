import 'package:flutter/services.dart';
import 'package:simple_hour/index.dart';

class Input extends StatelessWidget {
  const Input({
    this.hintText = '',
    this.controller,
    this.errorText,
    this.obscureText = false,
    this.onTap,
    this.keyboardType,
    this.maxLength,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
    this.inputFormatters,
    this.helpText,
    this.onEditingComplete,
    this.suffixIcon,
    this.onChanged,
    this.initialValue,
  });

  final String hintText;
  final TextEditingController? controller;
  final String? errorText;
  final bool obscureText;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final int? maxLength;
  final TextAlign textAlign;
  final double? letterSpacing;
  final List<TextInputFormatter>? inputFormatters;
  final String? helpText;
  final Function()? onEditingComplete;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      style: TextStyle(color: Colors.white, letterSpacing: letterSpacing),
      textAlign: textAlign,
      maxLength: maxLength,
      onTap: onTap,
      keyboardType: keyboardType,
      obscureText: obscureText,
      textInputAction: onEditingComplete == null
          ? TextInputAction.next
          : TextInputAction.done,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        isDense: true,
        errorText: errorText == '' ? null : errorText,
        errorMaxLines: 10,
        labelText: hintText,
        labelStyle: TextStyle(color: Colors.grey[350]),
      ),
    );
  }
}
