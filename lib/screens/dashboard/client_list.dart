import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kudibooks_app/screens/dashboard/classes/sliver_delegate_search.dart';
import 'package:kudibooks_app/screens/dashboard/client_deposit.dart';
import 'package:kudibooks_app/screens/dashboard/widget/progress_row.dart';

class ClientList extends StatelessWidget {
  ClientList({Key? key}) : super(key: key);
  List<Widget> statisticsCard = [
    Container(
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(width: 1.0, color: Colors.grey)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "123",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  " +12",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Color(0xff37833B)),
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
    Container(
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(width: 1.0, color: Colors.grey)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "3",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
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
    Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(width: 1.0, color: Colors.grey)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "126",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
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
  ];
  List<Widget> listClients = [
    ListTile(
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20.0, top: 9, bottom: 9),
            decoration: BoxDecoration(
                color: const Color(0xffE6FDE6),
                borderRadius: BorderRadius.circular(20.0)),
            child: const Text(
              "Active",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 9.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
            child: const Text(
              "\$25.99",
              style: TextStyle(fontSize: 15.0),
            ),
          ),
        ],
      ),
      leading: const CircleAvatar(
        radius: 25,
        child: Icon(Icons.person),
      ),
      subtitle: const Text("clientemail@gmail.com"),
      title: const Text(
        "Client name",
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              systemOverlayStyle:
                  const SystemUiOverlayStyle(statusBarColor: Color(0xff157253)),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.add,
                  ),
                  onPressed: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => ClientDeposit())),
                )
              ],
              elevation: 0.0,
              backgroundColor: const Color(0xff157253),
              centerTitle: true,
              title: const Text("Clients list",
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: statisticsCard
                      .map((e) => Expanded(
                            child: e,
                          ))
                      .toList(),
                ),
              ),
            )),
            SliverPersistentHeader(
                delegate: SearchBoxSliver(
              maxHeight: 165,
              minHeight: 165,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 150,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Column(children: const [
                          ProgreeRow(
                              beginningText: 'Not Yet Invoiced',
                              endigText: '0/0'),
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            child: LinearProgressIndicator(
                              minHeight: 7,
                              value: 0.3,
                            ),
                          ),
                          ProgreeRow(
                            beginningText: 'Over paying',
                            endigText: '0/0',
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            child: LinearProgressIndicator(
                              minHeight: 7,
                              value: 0.3,
                            ),
                          ),
                          ProgreeRow(
                            beginningText: 'Unpaid invoices',
                            endigText: '7',
                            textColor: Colors.red,
                          ),
                        ]),
                      ),
                    ]),
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LimitedBox(
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => ListTile(
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20.0, top: 9, bottom: 9),
                                  decoration: BoxDecoration(
                                      color: const Color(0xffE6FDE6),
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: const Text(
                                    "Active",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 9.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: const Text(
                                    "\$25.99",
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                ),
                              ],
                            ),
                            leading: const CircleAvatar(
                              radius: 25,
                              child: Icon(Icons.person),
                            ),
                            subtitle: const Text("clientemail@gmail.com"),
                            title: const Text(
                              "Client name",
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                      separatorBuilder: (_, idx) => const SizedBox(
                            height: 5,
                          ),
                      itemCount: 15),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
