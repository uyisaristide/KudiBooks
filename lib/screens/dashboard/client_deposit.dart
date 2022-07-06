import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/dashboard/classes/sliver_delegate_search.dart';

class ClientDeposit extends StatelessWidget {
  ClientDeposit({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeys = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final memoController = TextEditingController();
  List<String> clientList = [];
  List<String> bankList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0.0,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: LoginButton(
                text: 'Deposit',
                actionField: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                }),
          )),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              const SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: true,
                elevation: 0.0,
                backgroundColor: Color(0xff157253),
                centerTitle: true,
                title: Text("Client/Vendor deposit", style: TextStyle()),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: SearchBoxSliver(
                  maxHeight: 60,
                  minHeight: 60,
                  child: Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: const TabBar(
                      labelColor: Color(0xff157253),
                      labelStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xff157253),
                          fontWeight: FontWeight.bold),
                      unselectedLabelStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xff157253),
                          fontWeight: FontWeight.bold),
                      unselectedLabelColor: Colors.grey,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Color(0xff157253),
                      indicatorWeight: 3.0,
                      tabs: [
                        Tab(
                          child: Text(
                            "DEPOSIT",
                          ),
                        ),
                        Tab(
                          child: Text(
                            "WITHDRAW",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ];
          },
          body: Container(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: TabBarView(
              children: [
                Form(
                  child: Column(
                    children: const [Text("Tab 1")],
                  ),
                ),
                Form(
                  child: Column(
                    children: const [Text("Tab 2")],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
