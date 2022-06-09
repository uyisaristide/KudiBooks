import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final Function? validators;
  final String hintText;
  final Icon? fieldIcon;
  final TextInputType? inputType;

  const CustomFormField(
      {required this.hintText,
      this.validators,
      this.fieldIcon,
      this.inputType,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
      child: TextFormField(
        keyboardType: inputType,
        validator: (value) => validators!(value),
        decoration: InputDecoration(
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
    return Container(
        alignment: Alignment.center,
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black12)),
        child: TextFormField(
          validator: (value) => validators!(value),
          decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.red)),
              contentPadding: const EdgeInsets.only(left: 10),
              hintText: hintText,
              border: InputBorder.none),
        ));
  }
}
