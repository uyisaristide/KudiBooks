import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final Function? validators;
  final String hintText;
  final String? labelText;
  final Function? onIconPressed;
  final Icon? fieldIcon;
  final IconButton? fieldIconbutton;
  final int? maxLining;
  final String? initialValues;
  final TextStyle? hintStyles;
  final bool isShown;
  final bool? isEnabled;
  final TextInputType? inputType;
  final void Function(String)? onChangeAction;
  final Widget? countryCode;
  final int? maximumLength;
  final TextEditingController fieldController;

  const CustomFormField(
      {required this.hintText,
      this.onIconPressed,
      this.hintStyles,
      this.isEnabled,
      this.initialValues,
      this.validators,
      this.fieldIcon,
      this.fieldIconbutton,
      this.inputType,
      Key? key,
      this.onChangeAction,
      this.countryCode,
      this.maximumLength,
      required this.fieldController,
      this.labelText,
      required this.isShown,
      this.maxLining})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
      child: TextFormField(

        initialValue: initialValues,
        enabled: isEnabled,

        maxLines: maxLining,
        obscureText: isShown,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: fieldController,
        maxLength: maximumLength,
        keyboardType: inputType,
        onChanged: onChangeAction,
        validator: (value) => validators!(value),
        decoration: InputDecoration(
            focusColor: const Color(0xff157253),
            labelStyle: TextStyle(
                fontSize: 12,
                color:
                    validators == null ? const Color(0xff157253) : Colors.grey),
            labelText: labelText,
            prefix: countryCode,
            suffixIcon: fieldIconbutton,
            // fieldController.text.isEmpty
            //     ? fieldIcon
            //     : IconButton(
            //         onPressed: () {
            //           onIconPressed;
            //           fieldController.clear();
            //         },
            //         icon: const Icon(
            //           Icons.close,
            //           color: Colors.grey,
            //         )),
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
