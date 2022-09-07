import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../models/product/product_model.dart';
import '../../../models/product/retrive_product_model.dart';


class ProductListTile extends StatelessWidget {
  RetrieveProductModel productList;

  ProductListTile({required this.productList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.push("/productDetails/${productList.id}"),
      leading:const Icon(Icons.account_balance_wallet_outlined),
      title: Text(productList.name),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("RWF ${productList.price}"),
          // const Icon(
          //   Icons.arrow_forward_ios,
          //   size: 20,
          // )
        ],
      ),
    );
  }
}
