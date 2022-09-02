import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../models/product/product_model.dart';
import '../../../providers/all_providers_list.dart';

class ProductListCard extends ConsumerWidget {
  ProductModel productModel;

  ProductListCard({required this.productModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return Column(
      children: [
        ListTile(
          onLongPress: () {
            // ref.read(productProvider.notifier).removeProduct(productModel.id);
            // print("Deleted ${productModel.id}");
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
