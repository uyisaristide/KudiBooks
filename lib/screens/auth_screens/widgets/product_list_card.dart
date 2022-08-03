import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kudibooks_app/models/product_model.dart';
import 'package:kudibooks_app/providers/product_provider.dart';
import 'package:kudibooks_app/screens/dashboard/product_details.dart';
import 'package:provider/provider.dart';

class ProductListCard extends ConsumerWidget {
  ProductModel productModel;

  ProductListCard({required this.productModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, sentProduct) {
    return Column(
      children: [
        ListTile(
          onLongPress: () {
            sentProduct
                .read(productProviders.notifier)
                .removeProduct(productModel.id);
            print("Deleted ${productModel.id}");
          },
          onTap: () => context.pushNamed('pDetails'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("\$${productModel.productPrice}"),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
          leading: Image.asset(
            "assets/images/itemImage.png",
          ),
          title: Text(productModel.productName),
          subtitle: Text("${productModel.productDescription}"),
        ),
        const SizedBox(
          height: 15,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          child: Divider(),
        )
      ],
    );
  }
}
