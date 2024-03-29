import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';

class PhoneField extends StatelessWidget {
  final FutureOr<String?> Function(PhoneNumber?)? validators;
  final Icon? fieldIcon;
  final VoidCallback? onChangeAction;
  final TextEditingController phoneNumber;
  final String? initialString;
  final void Function(Country)? countryCodes;
  final String? textLabel;

  const PhoneField(
      {required this.validators,
      this.fieldIcon,
      this.textLabel,
      this.onChangeAction,
      Key? key,
      required this.phoneNumber,
      this.countryCodes,
      this.initialString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
      child: IntlPhoneField(
        initialValue: initialString,
        controller: phoneNumber,
        initialCountryCode: "RW",
        validator: validators,
        onCountryChanged: countryCodes,
        decoration: InputDecoration(
            labelText: textLabel,
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
            hintText: "createAccountPhone.form.phoneNumber.hint".tr()),
      ),
    );
  }
}
