import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kudibooks_app/models/inventory_model.dart';
import 'package:kudibooks_app/providers/inventory_provider.dart';
import 'package:kudibooks_app/screens/dashboard/classes/sliver_delegate_search.dart';
import 'package:kudibooks_app/screens/dashboard/new_product.dart';
import 'package:kudibooks_app/screens/dashboard/widget/bottom_navigation.dart';
import 'package:kudibooks_app/screens/dashboard/widget/button_widget.dart';
import 'package:kudibooks_app/screens/dashboard/widget/drawer.dart';
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
  @override
  Widget build(BuildContext context) {
    InventoryProviders _inventoryProvider =
        Provider.of<InventoryProviders>(context);
    final List<InventoryModel> _productList = _inventoryProvider.allInventories;
    return WillPopScope(
      onWillPop: () async {
        print('cant pop');
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => NavigationBottom()));
        // Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        drawer: Drawers(),
        body: NestedScrollView(
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
                        buttonTitle: 'Add Products',
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
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )),
                SliverPersistentHeader(
                    pinned: true,
                    delegate: SearchBoxSliver(
                        maxHeight: 60,
                        minHeight: 60,
                        child: Container(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: SearchTextField(
                            searchingContent: (value) {},
                          ),
                        ))),
              ];
            },
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
                    alignment: AlignmentDirectional.centerStart,
                    child: const Text(
                      "Inventory",
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  _productList.isEmpty
                      ? const Center(
                          child: Text("There is no inventory"),
                        )
                      : LimitedBox(
                          maxHeight: 1000,
                          child: ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => _productList
                                      .isEmpty
                                  ? const Center(
                                      child: Text("There is no inventory"),
                                    )
                                  : ListTile(
                                      title: Text(_productList[index].bulkName),
                                      leading: Image.asset(
                                        "assets/images/itemImage.png",
                                        width: 40,
                                        height: 40,
                                      ),
                                      subtitle: Text(_productList[index]
                                          .memoInventory!
                                          .toString()),
                                    ),
                              // itemBuilder: (context, index) => const Text("Kigali"),
                              separatorBuilder: (_, idx) => const SizedBox(
                                    height: 10,
                                  ),
                              itemCount: _productList.isEmpty
                                  ? 1
                                  : _productList.length),
                        ),
                ],
              ),
            )),
      ),
    );
  }
}
