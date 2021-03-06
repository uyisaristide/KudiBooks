import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kudibooks_app/models/product_model.dart';
import 'package:kudibooks_app/providers/product_provider.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/product_list_card.dart';
import 'package:kudibooks_app/screens/dashboard/classes/sliver_delegate_search.dart';
import 'package:kudibooks_app/screens/dashboard/new_inventory.dart';
import 'package:kudibooks_app/screens/dashboard/new_product.dart';
import 'package:kudibooks_app/screens/dashboard/widget/button_widget.dart';
import 'package:kudibooks_app/screens/dashboard/widget/search_input.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  VoidCallback? loadProducts;

  ProductsScreen({this.loadProducts, Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final searchContent = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ProductProvider _productProvider = Provider.of<ProductProvider>(context);
    List<ProductModel> _productList = _productProvider.allProducts;
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              const SliverAppBar(
                systemOverlayStyle:
                    SystemUiOverlayStyle(statusBarColor: Color(0xff157253)),
                pinned: true,
                automaticallyImplyLeading: true,
                elevation: 0.0,
                backgroundColor: Color(0xff157253),
                centerTitle: true,
                title: Text("No-Inventory products",
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ),
              SliverPersistentHeader(
                  pinned: true,
                  delegate: SearchBoxSliver(
                      maxHeight: 80,
                      minHeight: 80,
                      child: Container(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: SearchTextField(hintTexts: 'Search product',
                          searchingContent: (value) {},
                          searchContent: searchContent,
                        ),
                      ))),
            ];
          },
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LimitedBox(
                  maxHeight: 1000,
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      // itemBuilder: (context, index) => ProductListCard(index: index),
                      itemBuilder: (context, index) => ProductListCard(
                            productModel: _productList.reversed.toList()[index],
                          ),
                      separatorBuilder: (_, idx) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: _productList.length),
                ),
              ],
            ),
          )),
    );
  }
}
