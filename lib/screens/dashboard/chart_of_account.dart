import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import '../../models/utilities/network_info.dart';
import '../../providers/all_providers_list.dart';
import 'classes/snack_bars.dart';
import 'widget/chart_item.dart';
import 'widget/common_appBar.dart';
import 'widget/search_input.dart';

class ChartAccount extends ConsumerStatefulWidget {
  const ChartAccount({Key? key}) : super(key: key);

  @override
  ConsumerState<ChartAccount> createState() => _ChartAccountState();
}

class _ChartAccountState extends ConsumerState<ChartAccount> {
  final searchText = TextEditingController();
  String searchString = '';

  void loadCharts() {
    ref.read(allAccountsProvider.notifier).chartRetrieve();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadCharts();
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = ref.watch(allAccountsProvider);
    var removeChart = ref.watch(removeChartProvider);
    return Scaffold(
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: const Color(0xffFDAB30),
            padding: const EdgeInsets.all(15.0),
            elevation: 0.0,
            shape: const CircleBorder()),
        onPressed: () => context.push('/newChartOfAccounts/0'),
        child: const Text(
          '+',
          style: TextStyle(fontSize: 25),
        ),
      ),
      appBar: AppBarCommon.preferredSizeWidget(context, 'Chart of Account'),
      body: Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: data.networkStatus == NetworkStatus.success
              ? ListView(physics: const BouncingScrollPhysics(), children: [
                  SearchTextField(
                    hintTexts: 'Search here..',
                    searchContent: searchText,
                  ),
                  Column(
                      children: data.data!
                          .map((e) => Slidable(
                                startActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (context) {
                                        context.push(
                                            "/newChartOfAccounts/${e.id}");
                                      },
                                      icon: Icons.edit_outlined,
                                      backgroundColor: Colors.green.shade400,
                                      foregroundColor: Colors.white,
                                      label: 'Edit',
                                    )
                                  ],
                                ),
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (context) {
                                        showDialog<void>(
                                          context: context,
                                          barrierDismissible: true,
                                          // false = user must tap button, true = tap outside dialog
                                          builder:(BuildContext dialogContext) {
                                            return AlertDialog(
                                              title:
                                                  const Text('Are you sure?'),
                                              content: const Text(
                                                  "Do you want to remove this chart"),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('No'),
                                                  onPressed: () {
                                                    Navigator.of(dialogContext)
                                                        .pop(); // Dismiss alert dialog
                                                  },
                                                ),
                                                TextButton(
                                                  child: const Text('Yes'),
                                                  onPressed: () async {
                                                    var deleteResponse = await ref.read(removeChartProvider.notifier).removeChart(e.id);
                                                    if (deleteResponse.networkStatus==NetworkStatus.success) {
                                                      // debugPrint("$res");
                                                      Navigator.pop(dialogContext);
                                                      loadCharts();
                                                      ScaffoldMessenger.of(dialogContext).showSnackBar(SnackBars.snackBars('Deleted successfully',Colors.green.shade400));
                                                    }else{
                                                      Navigator.pop(dialogContext);
                                                      debugPrint("${removeChart.networkStatus}");
                                                      ScaffoldMessenger.of(dialogContext).showSnackBar(SnackBars.snackBars('${removeChart.errorMessage}', Colors.redAccent));
                                                    }
                                                    // Dismiss alert dialog
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      backgroundColor: Colors.redAccent,
                                      icon: Icons.delete,
                                      foregroundColor: Colors.white,
                                      label: 'Delete',
                                    )
                                  ],
                                ),
                                child: ChartItem(
                                  accounts: e,
                                  index: data.data!.indexOf(e),
                                ),
                              ))
                          .toList()
                          .reversed
                          .toList())
                ])
              : data.networkStatus == NetworkStatus.loading
                  ? Center(
                      child: CircularProgressIndicator(
                      color: Colors.green.shade400,
                    ))
                  :data.networkStatus==NetworkStatus.error?Center(child: Text("${data.errorMessage}"),): data.networkStatus == NetworkStatus.failed
                      ? Center(
                          child: Text("${data.getErrorMessage}"),
                        )
                      : Center(
                          child: InkWell(
                              onTap: () {
                                loadCharts();
                              },
                              child: Text("${data.errorMessage}, retry")),
                        )),
    );
  }
}
