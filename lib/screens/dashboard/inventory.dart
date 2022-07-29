import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kudibooks_app/models/Users/user_model.dart';
import 'package:kudibooks_app/models/inventory_model.dart';
import 'package:kudibooks_app/models/product_model.dart';
import 'package:kudibooks_app/providers/inventory_provider.dart';
import 'package:kudibooks_app/providers/product_provider.dart';
import 'package:kudibooks_app/providers/user_provider.dart';
import 'package:kudibooks_app/screens/dashboard/classes/sliver_delegate_search.dart';
import 'package:kudibooks_app/screens/dashboard/new_product.dart';
import 'package:kudibooks_app/screens/dashboard/widget/bottom_navigation.dart';
import 'package:kudibooks_app/screens/dashboard/widget/button_widget.dart';
import 'package:kudibooks_app/screens/dashboard/widget/drawer.dart';
import 'package:kudibooks_app/screens/dashboard/widget/loads_card.dart';
import 'package:kudibooks_app/screens/dashboard/widget/product_listtile.dart';
import 'package:kudibooks_app/screens/dashboard/widget/search_input.dart';
import 'new_inventory.dart';

class InventoryScreen extends ConsumerStatefulWidget {
  VoidCallback? loadInventories;
  String loggedUser;

  InventoryScreen({required this.loggedUser, this.loadInventories, Key? key})
      : super(key: key);

  @override
  ConsumerState<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends ConsumerState<InventoryScreen>
    with SingleTickerProviderStateMixin {
  bool isSearch = false;
  bool isSearchInventory = false;
  var searchResult = <ProductModel>[];
  var searchInInventory = <InventoryModel>[];
  String searchInventoryValue = '';
  String searchString = '';
  TextEditingController searchContent = TextEditingController();
  TextEditingController searchContentInventory = TextEditingController();
  TabController? _tabBarController;
  int tabCurrentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    searchContent.addListener(() => setState(() {}));
    searchContentInventory.addListener(() => setState(() {}));
    _tabBarController = TabController(length: 2, vsync: this);
    _tabBarController!.addListener(() {
      setState(() {
        tabCurrentIndex = _tabBarController!.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> _productList = ref
        .watch(productProviders)
        .where((productItem) => productItem.inventoryExpenseAccount != null)
        .toList();
    List<InventoryModel> _loadsList = ref.watch(inventoryProvider);
    User? signedUser = ref
        .watch(userProvider)
        .firstWhere((user) => user.phoneOrEmail == widget.loggedUser);
    return WillPopScope(
        onWillPop: () async {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => NavigationBottom(
                        loggedUser: widget.loggedUser,
                      )));
          return false;
        },
        child: Scaffold(
          drawer: Drawers(userInfo: signedUser),
          body: DefaultTabController(
            length: 2,
            child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    const SliverAppBar(
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarColor: Color(0xff157253)),
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
                              controller: _tabBarController,
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
                    SliverPersistentHeader(
                        pinned: true,
                        delegate: SearchBoxSliver(
                          maxHeight: 80,
                          minHeight: 80,
                          child: tabCurrentIndex == 0
                              ? Container(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  padding: const EdgeInsets.only(
                                      left: 20.0, bottom: 20.0),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    setState(() =>
                                                        isSearch = !isSearch);
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
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: SearchTextField(
                                            searchingContent: (value) {
                                              final results = _productList
                                                  .where((items) => items
                                                      .productName
                                                      .toLowerCase()
                                                      .contains(value))
                                                  .toList();
                                              if (results.isNotEmpty) {
                                                debugPrint("Results found");
                                                searchResult = results;
                                                searchString = value;
                                              }
                                            },
                                            hintTexts: 'Search Product',
                                            searchContent: searchContent,
                                          ),
                                        ),
                                )
                              : Container(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  padding: const EdgeInsets.only(
                                      left: 20.0, bottom: 20.0),
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
                                                  onPressed: () {
                                                    setState(() =>
                                                        isSearchInventory =
                                                            !isSearchInventory);
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
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: SearchTextField(
                                            searchingContent: (values) {
                                              final resultsInventory =
                                                  _loadsList
                                                      .where((items) => items
                                                          .bulkName
                                                          .toLowerCase()
                                                          .contains(values))
                                                      .toList();
                                              if (resultsInventory.isNotEmpty) {
                                                print(
                                                    "Results found inventory");
                                                searchInInventory =
                                                    resultsInventory;
                                                searchInventoryValue = values;
                                              } else {
                                                searchInInventory = [];
                                              }
                                            },
                                            hintTexts: 'Search inventory',
                                            searchContent:
                                                searchContentInventory,
                                          ),
                                        ),
                                ),
                        ))
                  ];
                },
                body: TabBarView(
                  controller: _tabBarController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _productList.isEmpty
                                ? const Center(
                                    child: Text("There is no product"),
                                  )
                                : searchResult.isEmpty ||
                                        searchString == '' ||
                                        searchContent.text.isEmpty
                                    ? LimitedBox(
                                        child: ListView.separated(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) =>
                                                _productList.reversed
                                                        .toList()
                                                        .isEmpty
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
                                      )
                                    : LimitedBox(
                                        child: ListView.separated(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) =>
                                                searchResult.reversed
                                                        .toList()
                                                        .isEmpty
                                                    ? const Center(
                                                        child: Text(
                                                            "There is no inventory"),
                                                      )
                                                    : ProductListTile(
                                                        productList:
                                                            searchResult[index],
                                                      ),
                                            // itemBuilder: (context, index) => const Text("Kigali"),
                                            separatorBuilder: (_, idx) =>
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                            itemCount: searchResult.isEmpty
                                                ? 1
                                                : searchResult.length),
                                      ),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _loadsList.isEmpty
                                ? const Center(
                                    child: Text("There is no inventory"),
                                  )
                                : searchInInventory.isEmpty ||
                                        searchInventoryValue == '' ||
                                        searchContentInventory.text.isEmpty
                                    ? LimitedBox(
                                        child: ListView.separated(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, load) =>
                                                _loadsList.reversed
                                                        .toList()
                                                        .isNotEmpty
                                                    ? LoadCard(
                                                        inventoryModel:
                                                            _loadsList[load],
                                                      )
                                                    : const Center(
                                                        child: Text(
                                                            "There is no inventory"),
                                                      ),
                                            // itemBuilder: (context, index) => const Text("Kigali"),
                                            separatorBuilder: (_, idx) =>
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                            itemCount: _loadsList.isEmpty
                                                ? 1
                                                : _loadsList.length),
                                      )
                                    : LimitedBox(
                                        child: ListView.separated(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, load) =>
                                                searchInInventory.reversed
                                                        .toList()
                                                        .isNotEmpty
                                                    ? LoadCard(
                                                        inventoryModel:
                                                            searchInInventory[
                                                                load],
                                                      )
                                                    : const Center(
                                                        child:
                                                            Text("Not found"),
                                                      ),
                                            // itemBuilder: (context, index) => const Text("Kigali"),
                                            separatorBuilder: (_, idx) =>
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                            itemCount: searchInInventory.isEmpty
                                                ? 1
                                                : searchInInventory.length),
                                      ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }
}
