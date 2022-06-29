import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/dashboard/new_account.dart';

class ChartAccount extends StatelessWidget {
  const ChartAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: const Color(0xffFDAB30),
            padding: const EdgeInsets.all(15.0),
            elevation: 0.0,
            shape: const CircleBorder()),
        onPressed: () => Navigator.push(
            context, CupertinoPageRoute(builder: (context) => NewAccount())),
        child: const Text(
          '+',
          style: TextStyle(fontSize: 25),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppBar(
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.pop(context)),
              automaticallyImplyLeading: true,
              elevation: 0.0,
              backgroundColor: const Color(0xff157253),
              centerTitle: true,
              title: const Text("Chart of account",
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: SizedBox(
            height: 1000,
            child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => ListTile(
                      subtitle: const Text("Account type"),
                      trailing: Column(
                        children: [
                          const Text(
                            "\$25.99",
                            style: TextStyle(fontSize: 16),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                "IN: ",
                                style: TextStyle(
                                  fontSize: 8,
                                ),
                              ),
                              Text(
                                "\$0.0",
                                style: TextStyle(
                                    fontSize: 8, color: Color(0xff78C278)),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                "OUT: ",
                                style: TextStyle(fontSize: 8),
                              ),
                              Text(
                                "\$0.0",
                                style: TextStyle(
                                    fontSize: 8, color: Color(0xffFF8787)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      title: const Text(
                        "Account name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xffC4C4C4),
                        child: Text(
                          "${++index}",
                          style: TextStyle(
                              color:
                                  index % 2 == 0 ? Colors.amber : Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                separatorBuilder: (_, idx) => const SizedBox(
                      height: 5,
                    ),
                itemCount: 15)),
      ),
    );
  }
}
