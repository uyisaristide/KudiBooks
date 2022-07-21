import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kudibooks_app/models/inventory_model.dart';
import 'package:kudibooks_app/providers/inventory_provider.dart';
import 'package:kudibooks_app/screens/dashboard/classes/sliver_delegate_search.dart';
import 'package:kudibooks_app/screens/dashboard/new_inventory.dart';
import 'package:kudibooks_app/screens/dashboard/widget/loads_card.dart';
import 'package:kudibooks_app/screens/dashboard/widget/search_input.dart';
import 'package:provider/provider.dart';

class Loads extends StatelessWidget {
  Loads({Key? key}) : super(key: key);
  final searchContent = TextEditingController();
  @override
  Widget build(BuildContext context) {
    InventoryProviders _inventoryProviders = Provider.of<InventoryProviders>(context);
    List<InventoryModel> _loadsList = _inventoryProviders.allInventories;
    return Scaffold(
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: const Color(0xffFDAB30),
            padding: const EdgeInsets.all(15.0),
            elevation: 0.0,
            shape: const CircleBorder()),
        onPressed: () => Navigator.push(
            context, CupertinoPageRoute(builder: (context) => NewInventory())),
        child: const Text(
          '+',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: true,
                actions: [
                  IconButton(
                      onPressed: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => NewInventory())),
                      icon: const Icon(Icons.add))
                ],
                elevation: 0.0,
                backgroundColor: const Color(0xff157253),
                centerTitle: true,
                title: const Text("Inventory loads",
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ),
              SliverPersistentHeader(
                  pinned: true,
                  delegate: SearchBoxSliver(
                    child: Container(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        width: MediaQuery.of(context).size.width,
                        child: SearchTextField(searchContent: searchContent,)),
                    maxHeight: 60,
                    minHeight: 60,
                  )),
            ];
          },
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: LoadCard(
                        inventoryModel: _loadsList[index],
                      ));
                }, childCount: _loadsList.length),
              )
              // Container(
              //     margin:
              //     const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              //     child: ListView.separated(
              //         shrinkWrap: true,
              //         physics: const BouncingScrollPhysics(),
              //         itemBuilder: (context, index) => inventoryLoads[index],
              //         separatorBuilder: (_, idx) => const SizedBox(
              //           height: 0.0,
              //         ),
              //         itemCount: inventoryLoads.length))
            ],
          ),
        ),
      ),
    );
  }
}
