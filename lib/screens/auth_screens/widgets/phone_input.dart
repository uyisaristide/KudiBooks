import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/material.dart';

class PhoneField extends StatelessWidget {
  final Function? validators;
  final Icon? fieldIcon;
  final VoidCallback? onChangeAction;
  final Widget? countryCode;
  final TextEditingController phoneNumber;

  const PhoneField(
      {this.validators,
      this.fieldIcon,
      this.onChangeAction,
      Key? key,
      this.countryCode,
      required this.phoneNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
      child: IntlPhoneField(
        controller: phoneNumber,
        initialCountryCode: "RW",
        // validator: (value) => validators!(value),
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
            hintText: "Phone Number"),
      ),
    );
  }
}
