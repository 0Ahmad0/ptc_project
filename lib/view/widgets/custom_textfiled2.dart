import 'package:flutter/material.dart';
class CustomTextFiled2 extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool autoFocus;
  final int? maxLength;
  var validator;
  var onChange;
  var onSubmit;
  final IconData prefixIcon;
  var  suffixIcon;
  final String hintText;
  int  minLines;
  int  maxLines;
  var onTap;
  bool validFiled;
  bool readOnly;

  CustomTextFiled2({super.key,
    required this.controller,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.autoFocus = false,
    this.maxLength = null,
    required this.validator,
    required this.onChange,
    this.onSubmit,
    required this.prefixIcon,
    required this.hintText,
    this.onTap = null,
    this.validFiled = false,
    this.readOnly = false,
    this.suffixIcon,
  this.minLines=1,
  this.maxLines=1

  });

  @override
  State<CustomTextFiled2> createState() => _CustomTextFiled2State();
}

class _CustomTextFiled2State extends State<CustomTextFiled2> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap:widget.onTap,
      readOnly: widget.readOnly,
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: widget.textInputType,
      maxLength: widget.maxLength,
      textInputAction: widget.textInputAction,
      autofocus: widget.autoFocus,
      validator: widget.validator,
      onChanged: widget.onChange,
      onFieldSubmitted: widget.onSubmit,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        labelText: widget.hintText,
        prefixIcon:
        Icon(widget.prefixIcon),
        suffixIcon: widget.suffixIcon,
        hintText: widget.hintText,
      ),
    );
  }
}
