import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(136.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              bottomOpacity: .4,
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
            Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: SearchTextField()),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => inventoryLoads[index],
                separatorBuilder: (_, idx) => const SizedBox(
                      height: 0.0,
                    ),
                itemCount: inventoryLoads.length)),
      ),
    );
  }
}
