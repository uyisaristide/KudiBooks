import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'dummy_products_list_notifier.dart';

class ListAllProducts extends ConsumerStatefulWidget {
  const ListAllProducts({Key? key}) : super(key: key);

  @override
  ConsumerState<ListAllProducts> createState() => _ListAllProductsState();
}

class _ListAllProductsState extends ConsumerState<ListAllProducts> {
  @override
  Widget build(BuildContext context) {
    ref.read(dummyProductsList.notifier).getDummyList();

    var products = ref.watch(dummyProductsList);

    return Scaffold(
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
                title: Text("Select Company",
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ),
            ];
          },
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LimitedBox(
                  child: ListView.builder(
                    key: const Key('list'),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: const Icon(
                                      Icons.production_quantity_limits),
                                  title: Text(
                                    products[index].productName,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Color(0xff157253)),
                                  ),
                                  subtitle: Text('${products[index].id}'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: products.length),
                ),
              ],
            ),
          )),
    );
  }
}
