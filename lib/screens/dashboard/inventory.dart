import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kudibooks_app/models/inventory_model.dart';
import 'package:kudibooks_app/models/product_model.dart';
import 'package:kudibooks_app/providers/inventory_provider.dart';
import 'package:kudibooks_app/providers/product_provider.dart';
import 'package:kudibooks_app/screens/dashboard/classes/sliver_delegate_search.dart';
import 'package:kudibooks_app/screens/dashboard/new_product.dart';
import 'package:kudibooks_app/screens/dashboard/widget/bottom_navigation.dart';
import 'package:kudibooks_app/screens/dashboard/widget/button_widget.dart';
import 'package:kudibooks_app/screens/dashboard/widget/drawer.dart';
import 'package:kudibooks_app/screens/dashboard/widget/loads_card.dart';
import 'package:kudibooks_app/screens/dashboard/widget/product_listtile.dart';
import 'package:kudibooks_app/screens/dashboard/widget/search_input.dart';
import 'package:provider/provider.dart';

import 'new_inventory.dart';

class InventoryScreen extends StatefulWidget {
  VoidCallback? loadInventories;

  InventoryScreen({this.loadInventories, Key? key}) : super(key: key);

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  bool isSearch = false;
  bool isSearchInventory = false;
  TextEditingController searchContent = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    searchContent.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider _productProvider = Provider.of<ProductProvider>(context);
    List<ProductModel> _productList = _productProvider.allProducts;
    InventoryProviders _inventoryProviders =
        Provider.of<InventoryProviders>(context);
    List<InventoryModel> _loadsList = _inventoryProviders.allInventories;

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => NavigationBottom()));

        return false;
      },
      child: Scaffold(
        drawer: Drawers(),
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  const SliverAppBar(
                    systemOverlayStyle:
                        SystemUiOverlayStyle(statusBarColor: Color(0xff157253)),
                    pinned: true,
                    automaticallyImplyLeading: true,
                    elevation: 0.0,
                    backgroundColor: Color(0xff157253),
                    centerTitle: true,
                    title: Text("Inventory",
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  ),
                  SliverPersistentHeader(
                      delegate: SearchBoxSliver(
                    maxHeight: 70,
                    minHeight: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BodyButton(
                          onClickAction: () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => NewProduct())),
                          buttonTitle: 'New Product',
                          suffixIcon: const Icon(
                            Icons.shopping_cart_outlined,
                            size: 20,
                            color: Color(0xff157253),
                          ),
                        ),
                        BodyButton(
                          onClickAction: () => Navigator.push(
                              context,
                              (CupertinoPageRoute(
                                  builder: (context) => NewInventory()))),
                          buttonTitle: 'New load',
                          suffixIcon: const Icon(
                            Icons.add,
                            size: 20,
                            color: Color(0xffA70C4A),
                          ),
                        ),
                      ],
                    ),
                  )),
                  SliverPersistentHeader(
                      pinned: true,
                      delegate: SearchBoxSliver(
                        maxHeight: 70,
                        minHeight: 70,
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20.0),
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          child: TabBar(
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: Colors.green.shade50),
                            tabs: [
                              Tab(
                                child: Text(
                                  "Product",
                                  style:
                                      TextStyle(color: Colors.green.shade900),
                                ),
                              ),
                              Tab(
                                child: Text("Inventory",
                                    style: TextStyle(
                                        color: Colors.green.shade900)),
                              ),
                            ],
                          ),
                        ),
                      )),
                ];
              },
              body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          padding:
                              const EdgeInsets.only(left: 20.0, bottom: 20.0),
                          child: isSearch == false
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Products",
                                      style: TextStyle(
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            setState(
                                                () => isSearch = !isSearch);
                                          },
                                          icon: const Icon(
                                            Icons.search,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : Container(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: SearchTextField(
                                    searchingContent: (value) {
                                      print(value);
                                    },
                                    hintTexts: 'Search Product',
                                    searchContent: searchContent,
                                  ),
                                ),
                        ),
                        _productList.isEmpty
                            ? const Center(
                                child: Text("There is no product"),
                              )
                            : LimitedBox(
                                maxHeight: 1000,
                                child: ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) =>
                                        _productList.reversed.toList().isEmpty
                                            ? const Center(
                                                child: Text(
                                                    "There is no inventory"),
                                              )
                                            : ProductListTile(
                                                productList:
                                                    _productList[index],
                                              ),
                                    // itemBuilder: (context, index) => const Text("Kigali"),
                                    separatorBuilder: (_, idx) =>
                                        const SizedBox(
                                          height: 10,
                                        ),
                                    itemCount: _productList.isEmpty
                                        ? 1
                                        : _productList.length),
                              ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            padding: const EdgeInsets.only(bottom: 10),
                            child: isSearchInventory == false
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Inventory",
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            onPressed: () => setState(() =>
                                                isSearchInventory =
                                                    !isSearchInventory),
                                            icon: const Icon(
                                              Icons.search,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : Container(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: SearchTextField(
                                      hintTexts: 'Search inventory',
                                      searchContent: searchContent,
                                    ),
                                  ),
                          ),
                          _loadsList.isEmpty
                              ? const Center(
                                  child: Text("There is no inventory"),
                                )
                              : LimitedBox(
                                  maxHeight: 1000,
                                  child: ListView.separated(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, load) => _loadsList
                                              .reversed
                                              .toList()
                                              .isNotEmpty
                                          ? LoadCard(
                                              inventoryModel: _loadsList[load],
                                            )
                                          : const Center(
                                              child:
                                                  Text("There is no inventory"),
                                            ),
                                      // itemBuilder: (context, index) => const Text("Kigali"),
                                      separatorBuilder: (_, idx) =>
                                          const SizedBox(
                                            height: 10,
                                          ),
                                      itemCount: _loadsList.isEmpty
                                          ? 1
                                          : _loadsList.length),
                                ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
