import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/material.dart';

class PhoneField extends StatelessWidget {
  final Function validators;
  final Icon? fieldIcon;
  final VoidCallback? onChangeAction;
  final TextEditingController phoneNumber;
  final void Function(Country)? countryCodes;

  const PhoneField(
      {required this.validators,
      this.fieldIcon,
      this.onChangeAction,
      Key? key,
      required this.phoneNumber,
      this.countryCodes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
      child: IntlPhoneField(
        controller: phoneNumber,
        initialCountryCode: "RW",
        validator: (value) => validators(value),
        onCountryChanged: countryCodes,
        decoration: InputDecoration(
            suffixIcon: phoneNumber.text.isEmpty
                ? fieldIcon
                : IconButton(
                    onPressed: () => phoneNumber.clear(),
                    icon: const Icon(Icons.close)),
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
