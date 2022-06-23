import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/product_list_card.dart';
import 'package:kudibooks_app/screens/dashboard/loads.dart';
import 'package:kudibooks_app/screens/dashboard/new_expense.dart';
import 'package:kudibooks_app/screens/dashboard/new_inventory.dart';
import 'package:kudibooks_app/screens/dashboard/new_product.dart';
import 'package:kudibooks_app/screens/dashboard/product_sale.dart';
import 'package:kudibooks_app/screens/dashboard/widget/button_widget.dart';
import 'package:kudibooks_app/screens/dashboard/widget/search_input.dart';

class InventoryScreen extends StatefulWidget {
  VoidCallback? loadInventories;

  InventoryScreen({this.loadInventories, Key? key}) : super(key: key);

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              bottomOpacity: .4,
              actions: [
                IconButton(
                    onPressed: () => Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => Loads())),
                    icon: const Icon(Icons.folder))
              ],
              elevation: 0.0,
              backgroundColor: const Color(0xff157253),
              centerTitle: true,
              title: const Text("Inventory",
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BodyButton(
                  onClickAction: () => Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => NewProduct())),
                  buttonTitle: 'Add Products',
                  suffixIcon: const Icon(
                    Icons.shopping_cart_outlined,
                    size: 20,
                    color: Color(0xff157253),
                  ),
                ),
                BodyButton(
                  onClickAction: () => Navigator.push(context,
                      (CupertinoPageRoute(builder: (context) => NewExpense()))),
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
            SearchTextField(),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
              alignment: AlignmentDirectional.centerStart,
              child: const Text(
                "Products",
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 580,
              child: ListView.separated(
                  // itemBuilder: (context, index) => ProductListCard(index: index),
                  itemBuilder: (context, index) => ProductListCard(
                        index: index,
                      ),
                  separatorBuilder: (_, idx) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: 30),
            ),
          ],
        ),
      ),
    );
  }
}
