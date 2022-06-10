import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final Function? validators;
  final String hintText;
  final Widget? fieldIcon;

  final TextInputType? inputType;
  final VoidCallback? onChangeAction;
  final Widget? countryCode;
  final int? maximumLength;

  const CustomFormField({required this.hintText,
    this.validators,
    this.fieldIcon,
    this.inputType,
    Key? key,
    this.onChangeAction,
    this.countryCode,
    this.maximumLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
      child: TextFormField(
        maxLength: maximumLength,
        keyboardType: inputType,
        validator: (value) => validators!(value),
        decoration: InputDecoration(
          prefix: countryCode,
          suffixIcon: fieldIcon,
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(10.0)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: validators == null ? Colors.grey : Colors.red,
                  width: 1.0),
              borderRadius: BorderRadius.circular(10.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(10.0)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.red,
              )),
          contentPadding: const EdgeInsets.only(left: 10),
          hintText: hintText,
        ),
      ),
    );
  }
}
