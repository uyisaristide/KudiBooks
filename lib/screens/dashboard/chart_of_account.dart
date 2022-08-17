import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:kudibooks_app/models/chart_accounts.dart';
import 'package:kudibooks_app/providers/all_providers_list.dart';
import 'package:kudibooks_app/screens/dashboard/widget/chart_item.dart';
import 'package:kudibooks_app/screens/dashboard/widget/common_appBar.dart';
import 'package:kudibooks_app/screens/dashboard/widget/search_input.dart';

import 'classes/snack_bars.dart';

class ChartAccount extends ConsumerWidget {
  const ChartAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: const Color(0xffFDAB30),
            padding: const EdgeInsets.all(15.0),
            elevation: 0.0,
            shape: const CircleBorder()),
        onPressed: () => context.pushNamed('newChartAccount'),
        child: const Text(
          '+',
          style: TextStyle(fontSize: 25),
        ),
      ),
      appBar: AppBarCommon.preferredSizeWidget(context, 'Chart of Account'),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: FutureBuilder<List<Accounts>>(
            future: ref.read(allAccountsProvider.notifier).chartRetrieve(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Accounts>> snapshot) {
              if (snapshot.hasData) {
                // return Text("${snapshot.data}");
                return ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: snapshot.data!
                        .map((e) => ChartItem(
                              accounts: e,
                              index: snapshot.data!.indexOf(e),
                            ))
                        .toList()
                        .reversed
                        .toList());
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.green.shade400,
                ));
              }
            }),
      ),
    );
  }
}
