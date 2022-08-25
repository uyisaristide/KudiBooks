import 'package:flutter/material.dart';


class PasswordField extends StatelessWidget {
  bool isHidden = true;
  TextEditingController passwordController;
  String? Function(String?)? validators;
  Widget? suffixIcon;
  int? maxLength;
  String? hintText;
  TextInputType? textInputType;

  PasswordField(
      {required this.isHidden,
      this.maxLength,
      this.hintText,
      this.textInputType,
      required this.passwordController,
      this.suffixIcon,
      this.validators,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: TextFormField(
        obscureText: isHidden,
        keyboardType: textInputType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: passwordController,
        maxLength: maxLength,
        validator: validators,
        decoration: InputDecoration(
            focusColor: const Color(0xff157253),
            labelStyle: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
            suffixIcon: suffixIcon,
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xff157253), width: 1.0),
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
            hintStyle: const TextStyle(color: Colors.grey)),
      ),
    );
  }
}
