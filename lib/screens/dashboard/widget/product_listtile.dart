import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kudibooks_app/models/product_model.dart';

import '../product_details.dart';

class ProductListTile extends StatelessWidget {
  ProductModel productList;

  ProductListTile({required this.productList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.6, color: Colors.grey.withOpacity(0.7)))),
      child: ListTile(
        onTap: () => Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) =>
                    ProductDetails(productModel: productList))),
        leading:
            Image.asset("assets/images/itemImage.png", width: 50, height: 50),
        title: Text(productList.productName),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("\$${productList.productPrice}"),
            const Icon(Icons.arrow_forward_ios, size: 20,)
          ],
        ),
      ),
    );
  }
}
