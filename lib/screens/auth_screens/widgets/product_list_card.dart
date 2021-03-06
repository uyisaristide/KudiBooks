import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kudibooks_app/models/product_model.dart';
import 'package:kudibooks_app/providers/product_provider.dart';
import 'package:kudibooks_app/screens/dashboard/product_details.dart';
import 'package:provider/provider.dart';

class ProductListCard extends StatelessWidget {
  ProductModel productModel;

  ProductListCard({required this.productModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProvider _productProvider = Provider.of<ProductProvider>(context);
    return Column(
      children: [
        ListTile(
          onLongPress: () {
            _productProvider.removeProduct(productModel.id);
            print("Deleted ${productModel.id}");
          },
          onTap: () => Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => ProductDetails(
                        productModel: productModel,
                      ))),
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
