import 'package:flutter/material.dart';

class SelectInputType extends StatelessWidget {
  List<String> itemsToSelect;
  Widget? dropDownHint;
  Function(String?)? selectedValue;
  Function()? tapSelect;
  String? Function(String?)? validation;

  SelectInputType(
      {this.dropDownHint,
      this.validation,
        this.tapSelect,
      required this.itemsToSelect,
      this.selectedValue,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
        child: DropdownButtonFormField<String>(
          validator: validation,
          hint: dropDownHint,
          decoration: InputDecoration(
              focusColor: const Color(0xff157253),
              labelStyle:
                  const TextStyle(fontSize: 12, color: Color(0xff157253)),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xff157253), width: 1.0),
                  borderRadius: BorderRadius.circular(10.0)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 1.0),
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
              hintStyle: const TextStyle(color: Colors.grey)),
          items: itemsToSelect
              .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ))
              .toList(),
          onChanged: selectedValue,
        ));
  }
}
