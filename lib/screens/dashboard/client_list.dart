import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/dashboard/client_deposit.dart';

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
      margin: EdgeInsets.only(right: 5.0),
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AppBar(
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.pop(context)),
              automaticallyImplyLeading: false,
              bottomOpacity: .4,
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
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: statisticsCard
                    .map((e) => Expanded(
                          child: e,
                        ))
                    .toList(),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 150,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(15.0)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
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
              SizedBox(
                height: 350,
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => listClients[index],
                    separatorBuilder: (_, idx) => const SizedBox(
                          height: 5,
                        ),
                    itemCount: listClients.length),
              )
            ],
          ),
        ),
      ),
    );
  }
}