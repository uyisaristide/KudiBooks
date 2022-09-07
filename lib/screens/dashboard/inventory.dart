import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/inventory_model.dart';
import '../../models/product/retrive_product_model.dart';
import '../../models/utilities/network_info.dart';
import '../../providers/all_providers_list.dart';
import '../../providers/product/providers.dart';
import 'classes/sliver_delegate_search.dart';
import 'widget/button_widget.dart';
import 'widget/drawer.dart';
import 'widget/loads_card.dart';
import 'widget/product_listtile.dart';
import 'widget/search_input.dart';


class InventoryScreen extends ConsumerStatefulWidget {
  VoidCallback? loadInventories;
  String? loggedUser;

  InventoryScreen({this.loggedUser, this.loadInventories, Key? key})
      : super(key: key);

  @override
  ConsumerState<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends ConsumerState<InventoryScreen>
    with SingleTickerProviderStateMixin {
  bool isSearch = false;
  bool isSearchInventory = false;
  var searchResult = <RetrieveProductModel>[];
  var searchInInventory = <InventoryModel>[];
  String searchInventoryValue = '';
  String searchString = '';
  TextEditingController searchContent = TextEditingController();
  TextEditingController searchContentInventory = TextEditingController();
  TabController? _tabBarController;
  int tabCurrentIndex = 0;

  List<RetrieveProductModel> allProductsToSell = [];

  populateListOfProducts(){
    var productToSellList = ref.watch(allProductProvider);
    allProductsToSell=productToSellList.data??[];
  }

  @override
  // ignore: must_call_super
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
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(allProductProvider.notifier).allProducts();
    });
    
  }

  @override
  Widget build(BuildContext context) {
    List<InventoryModel> _loadsList = ref.watch(inventoryProvider);
    var allProductWatcher = ref.watch(allProductProvider);
    ref.listen<NetworkInfo<List<RetrieveProductModel>>>(allProductProvider, (previous, next) {
      if (next.networkStatus == NetworkStatus.success) {
        populateListOfProducts();
      }
    });
    return Scaffold(
      drawer: Drawers(),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Color(0xff157253)),
                  pinned: true,
                  automaticallyImplyLeading: true,
                  elevation: 0.0,
                  backgroundColor: const Color(0xff157253),
                  centerTitle: true,
                  title: Text("dashboard.bottom_nav.inventory".tr(),
                      style: const TextStyle(
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
                        onClickAction: () => context.pushNamed('newProduct'),
                        buttonTitle: 'dashboard.inventory_screen.new_product'.tr(),
                        suffixIcon: const Icon(
                          Icons.shopping_cart_outlined,
                          size: 20,
                          color: Color(0xff157253),
                        ),
                      ),
                      BodyButton(
                        onClickAction: () =>
                            context.pushNamed('createInventory'),
                        buttonTitle: 'dashboard.home.newLoad'.tr(),
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
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 10),
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
                                "dashboard.inventory_screen.product".tr(),
                                style: TextStyle(color: Colors.green.shade900),
                              ),
                            ),
                            Tab(
                              child: Text("dashboard.bottom_nav.inventory".tr(),
                                  style:
                                      TextStyle(color: Colors.green.shade900)),
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
                              color: Theme.of(context).scaffoldBackgroundColor,
                              padding: const EdgeInsets.only(
                                  left: 20.0, bottom: 20.0),
                              child: isSearch == false
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "dashboard.inventory_screen.product",
                                          style: TextStyle(
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.bold),
                                        ).tr(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
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
                                          final results = allProductsToSell
                                              .where((items) => items
                                                  .name
                                                  .toLowerCase()
                                                  .contains(value))
                                              .toList();
                                          if (results.isNotEmpty) {
                                            searchResult = results;
                                            searchString = value;
                                          }
                                        },
                                        hintTexts: 'dashboard.inventory_screen.search_product'.tr(),
                                        searchContent: searchContent,
                                      ),
                                    ),
                            )
                          : Container(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              padding: const EdgeInsets.only(
                                  left: 20.0, bottom: 20.0),
                              child: isSearchInventory == false
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "dashboard.bottom_nav.inventory",
                                          style: TextStyle(
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.bold),
                                        ).tr(),
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
                                      padding: const EdgeInsets.only(top: 10),
                                      child: SearchTextField(
                                        searchingContent: (values) {
                                          final resultsInventory = _loadsList
                                              .where((items) => items.bulkName
                                                  .toLowerCase()
                                                  .contains(values))
                                              .toList();
                                          if (resultsInventory.isNotEmpty) {
                                            searchInInventory =
                                                resultsInventory;
                                            searchInventoryValue = values;
                                          } else {
                                            searchInInventory = [];
                                          }
                                        },
                                        hintTexts: 'dashboard.inventory_screen.search_inventory'.tr(),
                                        searchContent: searchContentInventory,
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
                allProductWatcher.networkStatus == NetworkStatus.loading?Center(child: CircularProgressIndicator(color: Colors.green.shade400),):
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: allProductWatcher.networkStatus == NetworkStatus.loading?
                    Center(child: CircularProgressIndicator(color: Colors.green.shade400),):
                    allProductWatcher.networkStatus == NetworkStatus.success?
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        searchResult.isEmpty || searchString == '' || searchContent.text.isEmpty
                                ? RefreshIndicator(
                                  onRefresh: () { return ref.read(allProductProvider.notifier).allProducts(); },
                                  child: LimitedBox(
                                      child: ListView.separated(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) =>
                                          allProductsToSell.reversed
                                                      .toList()
                                                      .isEmpty
                                                  ? const Text('')
                                                  : ProductListTile(
                                                      productList:allProductsToSell[index],
                                                    ),
                                          // itemBuilder: (context, index) => const Text("Kigali"),
                                          separatorBuilder: (_, idx) =>
                                              const SizedBox(
                                                height: 10,
                                              ),
                                          itemCount: allProductsToSell.isEmpty
                                              ? 1
                                              : allProductsToSell.length),
                                    ),
                                )
                                : RefreshIndicator(
                                  onRefresh: () { return ref.read(allProductProvider.notifier).allProducts(); },
                                  child: LimitedBox(
                                      child: ListView.separated(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) =>
                                              searchResult.reversed
                                                      .toList()
                                                      .isEmpty
                                                  ? Center(
                                                      child: const Text("dashboard.inventory_screen.there_is_no_inventory").tr(),
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
                                ),
                      ],
                    ):
                    Center(child: Text(allProductWatcher.getErrorMessage),),
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
                            ? Center(
                                child: const Text("dashboard.inventory_screen.there_is_no_inventory").tr(),
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
                                                : Center(
                                                    child: const Text( "dashboard.inventory_screen.there_is_no_inventory").tr(),
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
                                                        searchInInventory[load],
                                                  )
                                                : const Center(
                                                    child: Text("Not found"),
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
    );
  }
}
