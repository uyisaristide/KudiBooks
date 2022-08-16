import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/account_type.dart';
import '../../../providers/all_providers_list.dart';

class AccountTypes extends ConsumerStatefulWidget {
  final Function(AccountName accountName) selectedData;

  const AccountTypes(this.selectedData, {Key? key}) : super(key: key);

  @override
  ConsumerState<AccountTypes> createState() => _AccountTypesState();
}

class _AccountTypesState extends ConsumerState<AccountTypes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: FutureBuilder<List<AccountChartModel>>(
        future: ref.read(chartAccountProvider.notifier).listOfCharts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.green.shade400,
            ));
          }
          if (snapshot.connectionState == ConnectionState.none &&
              snapshot.hasData == null) {
            return Container();
          }

          if (snapshot.hasError) {
            debugPrint("${snapshot.error}");
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          return LimitedBox(
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
                            snapshot.data![index].accountCategory,
                            style: const TextStyle(fontSize: 16.0),
                          )),
                      Column(
                        children: snapshot.data![index].accountName
                            .map((e) => InkWell(
                                  hoverColor: Colors.redAccent.shade400,
                                  onTap: () {
                                    // debugPrint(e.name);
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
                itemCount: snapshot.data!.length),
          );
        },
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
    return Container(
      child: FutureBuilder<List<AccountChartModel>>(
        future: ref.read(chartAccountProvider.notifier).listOfCharts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.green.shade400,
            ));
          }
          if (snapshot.connectionState == ConnectionState.none &&
              snapshot.hasData == null) {
            return Container();
          }

          if (snapshot.hasError) {
            debugPrint("${snapshot.error}");
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          return LimitedBox(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Column(
                        children: snapshot.data![index].expenseCategories
                            .map((e) => InkWell(
                                  hoverColor: Colors.redAccent.shade400,
                                  onTap: () {
                                    // debugPrint(e.name);
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
                itemCount: snapshot.data!.length),
          );
        },
      ),
    );
  }
}
