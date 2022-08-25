import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../models/product_model.dart';


class ProductListTile extends StatelessWidget {
  ProductModel productList;

  ProductListTile({required this.productList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 0.6, color: Colors.grey.withOpacity(0.7)))),
      child: ListTile(
        onTap: () => context.pushNamed('pDetails', extra: productList),
        leading:
            Image.asset("assets/images/itemImage.png", width: 50, height: 50),
        title: Text(productList.productName),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("\$${productList.productPrice}"),
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
