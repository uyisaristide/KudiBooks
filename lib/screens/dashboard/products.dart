import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/product/product_model.dart';
import '../../providers/all_providers_list.dart';
import '../auth_screens/widgets/product_list_card.dart';
import 'classes/sliver_delegate_search.dart';
import 'widget/search_input.dart';

class ProductsScreen extends ConsumerStatefulWidget {
  VoidCallback? loadProducts;

  ProductsScreen({this.loadProducts, Key? key}) : super(key: key);

  @override
  ConsumerState<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends ConsumerState<ProductsScreen> {
  final searchContent = TextEditingController();
  List<ProductModel> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    
    List<ProductModel> _productList = ref.watch(productProvider);
    return Scaffold(
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: const Color(0xffFDAB30),
            padding: const EdgeInsets.all(15.0),
            elevation: 0.0,
            shape: const CircleBorder()),
        onPressed: () => context.pushNamed('newProduct'),
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
                          searchingContent: (value) {
                            final _resultS = _productList
                                .where((productItem) => productItem.productName
                                    .toLowerCase()
                                    .contains(value))
                                .toList();
                            if (_resultS.isNotEmpty) {
                              _searchResults = _resultS;
                            }
                          },
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
