import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import '../../models/utilities/network_info.dart';
import '../../providers/clients/providers/all_client_providers.dart';
import 'classes/sliver_delegate_search.dart';
import 'classes/snack_bars.dart';
import 'widget/client_list_item.dart';
import 'widget/progress_row.dart';

class ClientList extends ConsumerStatefulWidget {
  ClientList({Key? key}) : super(key: key);

  @override
  ConsumerState<ClientList> createState() => _ClientListState();
}

class _ClientListState extends ConsumerState<ClientList> {
  void clientData() {
    ref.read(clientProvider.notifier).allClients();
    ref.read(clientStatsProvider.notifier).clientStatistics();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      clientData();
    });
  }

  @override
  Widget build(BuildContext context) {
    var clientList = ref.watch(clientProvider);
    var deleteItem = ref.watch(removeClientProvider);
    var clientStatistics = ref.watch(clientStatsProvider);

    return Scaffold(
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: const Color(0xffFDAB30),
            padding: const EdgeInsets.all(15.0),
            elevation: 0.0,
            shape: const CircleBorder()),
        onPressed: () => context.push('/createClient/0'),
        child: const Text(
          '+',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const SliverAppBar(
              pinned: true,
              systemOverlayStyle:
                  SystemUiOverlayStyle(statusBarColor: Color(0xff157253)),
              elevation: 0.0,
              backgroundColor: Color(0xff157253),
              centerTitle: true,
              title: Text("Clients list",
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
            SliverPersistentHeader(
                delegate: SearchBoxSliver(
              maxHeight: 165,
              minHeight: 165,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: clientStatistics.networkStatus == NetworkStatus.loading
                    ? Center(
                        child: CircularProgressIndicator(
                            color: Colors.green.shade400),
                      )
                    : clientStatistics.networkStatus == NetworkStatus.success
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                          width: 1.0, color: Colors.grey)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(10.0),
                                          child: const CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Color(0xffEDF6EE),
                                            child: Icon(
                                              Icons.person_outline,
                                              color: Color(0xff37833B),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${clientStatistics.data?.active}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24),
                                            ),
                                          ],
                                        ),
                                        const Text(
                                          "Active",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(right: 5.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                          width: 1.0, color: Colors.grey)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(10.0),
                                          child: const CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Color(0xffEDF6EE),
                                            child: Icon(
                                              Icons.person_outline,
                                              color: Color(0xffA70C4A),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${clientStatistics.data?.inactive}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24),
                                            ),
                                          ],
                                        ),
                                        const Text(
                                          "Inactive",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                          width: 1.0, color: Colors.grey)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(10.0),
                                          child: const CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Color(0xffEDF6EE),
                                            child: Icon(
                                              Icons.person_outline,
                                              color: Color(0xff00008B),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${clientStatistics.data?.all}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24),
                                            ),
                                          ],
                                        ),
                                        const Text(
                                          "Total",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ], // children: statisticsCard.map((e) => Expanded(child: e,)).toList(),
                          )
                        : clientStatistics.networkStatus == NetworkStatus.failed
                            ? Center(
                                child: InkWell(
                                  onTap: () {
                                    clientData();
                                  },
                                  child:
                                      Text("${clientStatistics.errorMessage}"),
                                ),
                              )
                            : Center(
                                child: InkWell(
                                    onTap: () {
                                      clientData();
                                    },
                                    child: Text(
                                        "${clientStatistics.errorMessage}")),
                              ),
              ),
            )),
            SliverPersistentHeader(
                delegate: SearchBoxSliver(
              maxHeight: 165,
              minHeight: 165,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: clientStatistics.networkStatus == NetworkStatus.loading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.green.shade400,
                        ),
                      )
                    : clientStatistics.networkStatus == NetworkStatus.success
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  height: 150,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  child: Column(children: [
                                    ProgreeRow(
                                        beginningText: 'Not Yet Invoiced',
                                        endigText:
                                            '${clientStatistics.data?.withoutInvoices}/${clientStatistics.data?.all}'),
                                    const ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      child: LinearProgressIndicator(
                                        minHeight: 7,
                                        value: 0.3,
                                      ),
                                    ),
                                    ProgreeRow(
                                      beginningText: 'Over paying',
                                      endigText:
                                          '${clientStatistics.data?.overPayers}/${clientStatistics.data?.all}',
                                    ),
                                    const ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      child: LinearProgressIndicator(
                                        minHeight: 7,
                                        value: 0.3,
                                      ),
                                    ),
                                    ProgreeRow(
                                      beginningText: 'Unpaid invoices',
                                      endigText:
                                          '${clientStatistics.data?.invoiced}',
                                      textColor: Colors.red,
                                    ),
                                  ]),
                                ),
                              ])
                        : clientStatistics.networkStatus == NetworkStatus.failed
                            ? Center(
                                child: InkWell(
                                    onTap: () {
                                      clientData();
                                    },
                                    child: Text(
                                        "${clientStatistics.errorMessage}")),
                              )
                            : clientStatistics.networkStatus ==
                                    NetworkStatus.error
                                ? Center(
                                    child: InkWell(
                                        onTap: () {
                                          clientData();
                                        },
                                        child: Text(
                                            "${clientStatistics.errorMessage}")),
                                  )
                                : Center(
                                    child: InkWell(
                                        onTap: () {
                                          clientData();
                                        },
                                        child: Text(
                                            "${clientStatistics.errorMessage}")),
                                  ),
              ),
            )),
            SliverPersistentHeader(
                pinned: true,
                delegate: SearchBoxSliver(
                  maxHeight: 50,
                  minHeight: 50,
                  child: Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding:
                                const EdgeInsets.only(top: 15.0, bottom: 15.0),
                            child: const Text(
                              "Clients list",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.sort,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ];
        },
        body: clientList.networkStatus == NetworkStatus.loading
            ? Center(
                child: CircularProgressIndicator(color: Colors.green.shade400),
              )
            : clientList.networkStatus == NetworkStatus.success
                ? LimitedBox(
                    child: LimitedBox(
                      maxHeight: 1000,
                      child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Slidable(
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      showDialog<void>(
                                          context: context,
                                          builder: (deleteContext) {
                                            return AlertDialog(
                                              title:
                                                  const Text('Are you sure?'),
                                              content: const Text(
                                                  "Do you want to remove this client"),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('No'),
                                                  onPressed: () {
                                                    Navigator.of(deleteContext)
                                                        .pop(); // Dismiss alert dialog
                                                  },
                                                ),
                                                TextButton(
                                                  child: const Text('Yes'),
                                                  onPressed: () async {
                                                    var deleteResponse = await ref
                                                        .read(
                                                            removeClientProvider
                                                                .notifier)
                                                        .removeClient(clientList
                                                            .data![index].id);
                                                    if (deleteResponse
                                                            .networkStatus ==
                                                        NetworkStatus.success) {
                                                      Navigator.pop(
                                                          deleteContext);
                                                      clientData();
                                                      ScaffoldMessenger.of(
                                                              deleteContext)
                                                          .showSnackBar(SnackBars
                                                              .snackBars(
                                                                  'Deleted successfully',
                                                                  Colors.green
                                                                      .shade400));
                                                    } else {
                                                      Navigator.pop(
                                                          deleteContext);
                                                      ScaffoldMessenger.of(
                                                              deleteContext)
                                                          .showSnackBar(SnackBars
                                                              .snackBars(
                                                                  '${deleteItem.errorMessage}',
                                                                  Colors
                                                                      .redAccent));
                                                    }
                                                    // Dismiss alert dialog
                                                  },
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                    icon: Icons.edit_outlined,
                                    backgroundColor: Colors.redAccent,
                                    foregroundColor: Colors.white,
                                    label: 'Delete',
                                  )
                                ],
                              ),
                              startActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      context.push(
                                          '/createClient/${clientList.data![index].id}');
                                    },
                                    label: 'Edit',
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.green.shade400,
                                  )
                                ],
                              ),
                              child: InkWell(onTap: (){
                                return context.push('/profileClient/${clientList.data![index].id}');
                              },
                                child: ClientListItem(
                                    client: clientList.data![index]),
                              )),
                          separatorBuilder: (_, idx) => const SizedBox(
                                height: 5,
                              ),
                          itemCount: clientList.data!.length),
                    ),
                  )
                : Center(child: Text("${clientList.errorMessage}")),
      ),
    );
  }
}
