import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/account_type.dart';
import '../../../models/utilities/network_info.dart';
import '../../../providers/all_providers_list.dart';

class AccountTypes extends ConsumerStatefulWidget {
  final Function(AccountName accountName) selectedData;

  const AccountTypes(this.selectedData, {Key? key}) : super(key: key);

  @override
  ConsumerState<AccountTypes> createState() => _AccountTypesState();
}

class _AccountTypesState extends ConsumerState<AccountTypes> {
  void loadRequiredData() {
    ref.read(chartAccountProvider.notifier).listOfCharts();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.watch(chartAccountProvider);
      loadRequiredData();
    });
  }

  @override
  Widget build(BuildContext context) {
    var accountChart = ref.watch(chartAccountProvider);
    return Container(
      padding: const EdgeInsets.all(10),
      child: accountChart.networkStatus == NetworkStatus.success
          ? RefreshIndicator(color: Colors.green.shade400,
            onRefresh: (){return ref.read(chartAccountProvider.notifier).listOfCharts();},
            child: LimitedBox(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(10.0),
                              color: Colors.grey.shade600,
                              child: Text(
                                accountChart.data![index].accountCategory,
                                style: const TextStyle(fontSize: 16.0),
                              )),
                          Column(
                            children: accountChart.data![index].accountName
                                .map((e) => InkWell(
                                      hoverColor: Colors.redAccent.shade400,
                                      onTap: () {
                                        widget.selectedData(e);
                                        Navigator.pop(context);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          e.name,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: ((context, idx) => const SizedBox(
                          height: 10.0,
                        )),
                    itemCount: accountChart.data?.length ?? 0),
              ),
          )
          : Center(
              child: CircularProgressIndicator(color: Colors.green.shade400),
            ),
    );
  }
}

class ExpenseCategories extends ConsumerWidget {
  final Function(ExpenseCategory expenseCategory) selectedExpenseAccount;

  const ExpenseCategories(
    this.selectedExpenseAccount, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var expenseAccount = ref.watch(chartAccountProvider);
    return Container(
      child: LimitedBox(
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Column(
                    children: expenseAccount.data![index].expenseCategories
                        .map((e) => InkWell(
                              hoverColor: Colors.redAccent.shade400,
                              onTap: () {
                                selectedExpenseAccount(e);
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  e.name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              );
            },
            separatorBuilder: ((context, idx) => const SizedBox(
                  height: 10.0,
                )),
            itemCount: expenseAccount.networkStatus == NetworkStatus.loading
                ? 0
                : expenseAccount.data!.length),
      ),
      // child: FutureBuilder<List<AccountChartModel>>(
      //   future: ref.read(chartAccountProvider.notifier).listOfCharts(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(
      //           child: CircularProgressIndicator(
      //         color: Colors.green.shade400,
      //       ));
      //     }
      //     if (snapshot.connectionState == ConnectionState.none &&
      //         snapshot.hasData == null) {
      //       return Container();
      //     }
      //
      //     if (snapshot.hasError) {
      //       debugPrint("${snapshot.error}");
      //       return Center(
      //         child: Text("${snapshot.error}"),
      //       );
      //     }
      //     return LimitedBox(
      //       child: ListView.separated(
      //           shrinkWrap: true,
      //           itemBuilder: (context, index) {
      //             return Column(
      //               children: [
      //                 Column(
      //                   children: snapshot.data![index].expenseCategories
      //                       .map((e) => InkWell(
      //                             hoverColor: Colors.redAccent.shade400,
      //                             onTap: () {
      //                               // debugPrint(e.name);
      //                               selectedExpenseAccount(e);
      //                               Navigator.pop(context);
      //                             },
      //                             child: Padding(
      //                               padding: const EdgeInsets.all(10.0),
      //                               child: Text(
      //                                 e.name,
      //                                 textAlign: TextAlign.center,
      //                                 style: const TextStyle(),
      //                               ),
      //                             ),
      //                           ))
      //                       .toList(),
      //                 ),
      //               ],
      //             );
      //           },
      //           separatorBuilder: ((context, idx) => const SizedBox(
      //                 height: 10.0,
      //               )),
      //           itemCount: snapshot.data!.length),
      //     );
      //   },
      // ),
    );
  }
}
