import 'package:flutter/material.dart';
import '../../../models/product_model.dart';

class SelectItemDynamic extends StatelessWidget {
  Function(ProductModel?)? selectValue;
  List<ProductModel> productList;

  SelectItemDynamic({required this.productList, this.selectValue, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
        child: DropdownButtonFormField<ProductModel>(
          // validator: (value) => Validators.notEmpty(value),
          hint: const Text("Select product"),
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
          items: productList.isEmpty
              ? []
              : productList
                  .map<DropdownMenuItem<ProductModel>>(
                      (ProductModel value) => DropdownMenuItem<ProductModel>(
                            value: value,
                            child: Text(value.productName),
                          ))
                  .toList(),
          onChanged: selectValue,
        ));
  }
}
