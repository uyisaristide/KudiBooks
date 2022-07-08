import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/dashboard/classes/sliver_delegate_search.dart';
import 'package:kudibooks_app/screens/dashboard/new_inventory.dart';
import 'package:kudibooks_app/screens/dashboard/widget/double_header_two.dart';
import 'package:kudibooks_app/screens/dashboard/widget/inventory_card.dart';
import 'package:kudibooks_app/screens/dashboard/widget/search_input.dart';

class Loads extends StatelessWidget {
  Loads({Key? key}) : super(key: key);
  List<Widget> inventoryLoads = [
    InventoryProductCard(
      widgetPadding: Column(children: [
        TwoSideHeader(
          textFontSize: 16.0,
          leftSide: 'Orange Juice',
          fontWeight: FontWeight.bold,
          rightSide: const Text(
            "20 April 2022",
            style: TextStyle(color: Color(0xffA70C4A), fontSize: 13),
          ),
          bottomSize: 10,
        ),
        TwoSideHeader(
          textFontSize: 14.0,
          textColor: Colors.grey,
          leftSide: 'Total',
          rightSide: const Text(
            "\$15.99",
            style: TextStyle(fontSize: 16.0),
          ),
          bottomSize: 0.0,
        ),
        const Divider(),
        TwoSideHeader(
            bottomSize: 10,
            textFontSize: 14.0,
            leftSide: 'Product name 1',
            rightSide: const Text(
              "\$1.99",
              style: TextStyle(fontSize: 13.0, color: Colors.grey),
            )),
        TwoSideHeader(
          textFontSize: 14.0,
          leftSide: 'Product name 2',
          rightSide: const Text(
            "\$1.99",
            style: TextStyle(fontSize: 13.0, color: Colors.grey),
          ),
          bottomSize: 0.0,
        ),
      ]),
    ),
    InventoryProductCard(
      widgetPadding: Column(children: [
        TwoSideHeader(
          textFontSize: 16.0,
          leftSide: 'Another product',
          fontWeight: FontWeight.bold,
          rightSide: const Text(
            "20 April 2022",
            style: TextStyle(color: Color(0xffA70C4A), fontSize: 13),
          ),
          bottomSize: 10,
        ),
        TwoSideHeader(
          textFontSize: 14.0,
          textColor: Colors.grey,
          leftSide: 'Total',
          rightSide: const Text(
            "\$15.99",
            style: TextStyle(fontSize: 16.0),
          ),
          bottomSize: 0.0,
        ),
        const Divider(),
        TwoSideHeader(
            bottomSize: 10,
            textFontSize: 14.0,
            leftSide: 'Product name 1',
            rightSide: const Text(
              "\$1.99",
              style: TextStyle(fontSize: 13.0, color: Colors.grey),
            )),
      ]),
    ),
    InventoryProductCard(
      widgetPadding: Column(children: [
        TwoSideHeader(
          textFontSize: 16.0,
          leftSide: 'Orange Juice',
          fontWeight: FontWeight.bold,
          rightSide: const Text(
            "20 April 2022",
            style: TextStyle(color: Color(0xffA70C4A), fontSize: 13),
          ),
          bottomSize: 10,
        ),
        TwoSideHeader(
          textFontSize: 14.0,
          textColor: Colors.grey,
          leftSide: 'Total',
          rightSide: const Text(
            "\$15.99",
            style: TextStyle(fontSize: 16.0),
          ),
          bottomSize: 0.0,
        ),
        const Divider(),
        TwoSideHeader(
            bottomSize: 10,
            textFontSize: 14.0,
            leftSide: 'Product name 1',
            rightSide: const Text(
              "\$1.99",
              style: TextStyle(fontSize: 13.0, color: Colors.grey),
            )),
        TwoSideHeader(
          textFontSize: 14.0,
          leftSide: 'Product name 2',
          rightSide: const Text(
            "\$1.99",
            style: TextStyle(fontSize: 13.0, color: Colors.grey),
          ),
          bottomSize: 0.0,
        ),
      ]),
    ),
    InventoryProductCard(
      widgetPadding: Column(children: [
        TwoSideHeader(
          textFontSize: 16.0,
          leftSide: 'Orange Juice',
          fontWeight: FontWeight.bold,
          rightSide: const Text(
            "20 April 2022",
            style: TextStyle(color: Color(0xffA70C4A), fontSize: 13),
          ),
          bottomSize: 10,
        ),
        TwoSideHeader(
          textFontSize: 14.0,
          textColor: Colors.grey,
          leftSide: 'Total',
          rightSide: const Text(
            "\$15.99",
            style: TextStyle(fontSize: 16.0),
          ),
          bottomSize: 0.0,
        ),
        const Divider(),
        TwoSideHeader(
            bottomSize: 10,
            textFontSize: 14.0,
            leftSide: 'Product name 1',
            rightSide: const Text(
              "\$1.99",
              style: TextStyle(fontSize: 13.0, color: Colors.grey),
            )),
        TwoSideHeader(
          textFontSize: 14.0,
          leftSide: 'Product name 2',
          rightSide: const Text(
            "\$1.99",
            style: TextStyle(fontSize: 13.0, color: Colors.grey),
          ),
          bottomSize: 0.0,
        ),
      ]),
    ),
    InventoryProductCard(
      widgetPadding: Column(children: [
        TwoSideHeader(
          textFontSize: 16.0,
          leftSide: 'Orange Juice',
          fontWeight: FontWeight.bold,
          rightSide: const Text(
            "20 April 2022",
            style: TextStyle(color: Color(0xffA70C4A), fontSize: 13),
          ),
          bottomSize: 10,
        ),
        TwoSideHeader(
          textFontSize: 14.0,
          textColor: Colors.grey,
          leftSide: 'Total',
          rightSide: const Text(
            "\$15.99",
            style: TextStyle(fontSize: 16.0),
          ),
          bottomSize: 0.0,
        ),
        const Divider(),
        TwoSideHeader(
            bottomSize: 10,
            textFontSize: 14.0,
            leftSide: 'Product name 1',
            rightSide: const Text(
              "\$1.99",
              style: TextStyle(fontSize: 13.0, color: Colors.grey),
            )),
        TwoSideHeader(
          textFontSize: 14.0,
          leftSide: 'Product name 2',
          rightSide: const Text(
            "\$1.99",
            style: TextStyle(fontSize: 13.0, color: Colors.grey),
          ),
          bottomSize: 0.0,
        ),
      ]),
    ),
    InventoryProductCard(
      widgetPadding: Column(children: [
        TwoSideHeader(
          textFontSize: 16.0,
          leftSide: 'Orange Juice',
          fontWeight: FontWeight.bold,
          rightSide: const Text(
            "20 April 2022",
            style: TextStyle(color: Color(0xffA70C4A), fontSize: 13),
          ),
          bottomSize: 10,
        ),
        TwoSideHeader(
          textFontSize: 14.0,
          textColor: Colors.grey,
          leftSide: 'Total',
          rightSide: const Text(
            "\$15.99",
            style: TextStyle(fontSize: 16.0),
          ),
          bottomSize: 0.0,
        ),
        const Divider(),
        TwoSideHeader(
            bottomSize: 10,
            textFontSize: 14.0,
            leftSide: 'Product name 1',
            rightSide: const Text(
              "\$1.99",
              style: TextStyle(fontSize: 13.0, color: Colors.grey),
            )),
        TwoSideHeader(
          textFontSize: 14.0,
          leftSide: 'Product name 2',
          rightSide: const Text(
            "\$1.99",
            style: TextStyle(fontSize: 13.0, color: Colors.grey),
          ),
          bottomSize: 0.0,
        ),
      ]),
    ),
    InventoryProductCard(
      widgetPadding: Column(children: [
        TwoSideHeader(
          textFontSize: 16.0,
          leftSide: 'Orange Juice',
          fontWeight: FontWeight.bold,
          rightSide: const Text(
            "20 April 2022",
            style: TextStyle(color: Color(0xffA70C4A), fontSize: 13),
          ),
          bottomSize: 10,
        ),
        TwoSideHeader(
          textFontSize: 14.0,
          textColor: Colors.grey,
          leftSide: 'Total',
          rightSide: const Text(
            "\$15.99",
            style: TextStyle(fontSize: 16.0),
          ),
          bottomSize: 0.0,
        ),
        const Divider(),
        TwoSideHeader(
            bottomSize: 10,
            textFontSize: 14.0,
            leftSide: 'Product name 1',
            rightSide: const Text(
              "\$1.99",
              style: TextStyle(fontSize: 13.0, color: Colors.grey),
            )),
        TwoSideHeader(
          textFontSize: 14.0,
          leftSide: 'Product name 2',
          rightSide: const Text(
            "\$1.99",
            style: TextStyle(fontSize: 13.0, color: Colors.grey),
          ),
          bottomSize: 0.0,
        ),
      ]),
    ),
    InventoryProductCard(
      widgetPadding: Column(children: [
        TwoSideHeader(
          textFontSize: 16.0,
          leftSide: 'Orange Juice',
          fontWeight: FontWeight.bold,
          rightSide: const Text(
            "20 April 2022",
            style: TextStyle(color: Color(0xffA70C4A), fontSize: 13),
          ),
          bottomSize: 10,
        ),
        TwoSideHeader(
          textFontSize: 14.0,
          textColor: Colors.grey,
          leftSide: 'Total',
          rightSide: const Text(
            "\$15.99",
            style: TextStyle(fontSize: 16.0),
          ),
          bottomSize: 0.0,
        ),
        const Divider(),
        TwoSideHeader(
            bottomSize: 10,
            textFontSize: 14.0,
            leftSide: 'Product name 1',
            rightSide: const Text(
              "\$1.99",
              style: TextStyle(fontSize: 13.0, color: Colors.grey),
            )),
        TwoSideHeader(
          textFontSize: 14.0,
          leftSide: 'Product name 2',
          rightSide: const Text(
            "\$1.99",
            style: TextStyle(fontSize: 13.0, color: Colors.grey),
          ),
          bottomSize: 0.0,
        ),
      ]),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
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
                        color: innerBoxIsScrolled
                            ? const Color(0xff157253)
                            : Colors.transparent,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                            margin: const EdgeInsets.only(left: 15, right: 15),
                            child: SearchTextField())),
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
                      child: inventoryLoads[index]);
                }, childCount: inventoryLoads.length),
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
