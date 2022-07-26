import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kudibooks_app/models/product_model.dart';
import 'package:kudibooks_app/providers/product_provider.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/product_list_card.dart';
import 'package:kudibooks_app/screens/dashboard/classes/sliver_delegate_search.dart';
import 'package:kudibooks_app/screens/dashboard/new_product.dart';
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
    List<ProductModel> _productList = _productProvider.allProducts
        .where((element) => element.inventoryExpenseAccount == null)
        .toList();
    return Scaffold(
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: const Color(0xffFDAB30),
            padding: const EdgeInsets.all(15.0),
            elevation: 0.0,
            shape: const CircleBorder()),
        onPressed: () => Navigator.push(
            context, CupertinoPageRoute(builder: (context) => NewProduct())),
        child: const Text(
          '+',
          style: TextStyle(fontSize: 25),
        ),
      ),
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
                        child: SearchTextField(
                          hintTexts: 'Search non-inventory product',
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
                  child: ListView.separated(
                      shrinkWrap: true,
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
