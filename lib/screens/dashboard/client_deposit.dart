import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../auth_screens/validators/validator.dart';
import '../auth_screens/widgets/drop_down_widget.dart';
import '../auth_screens/widgets/login_button.dart';
import '../auth_screens/widgets/text_form_field.dart';
import 'classes/sliver_delegate_search.dart';

class ClientDeposit extends StatelessWidget {
  ClientDeposit({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeys = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final transactionController = TextEditingController();
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
                    context.pop();
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
            margin: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ),
            child: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          SelectInputType(
                            itemsToSelect: clientList,
                            dropDownHint: const Text(
                              "Select client",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          SelectInputType(
                            itemsToSelect: bankList,
                            dropDownHint: const Text(
                              "Cash / Bank",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          CustomFormField(
                              fieldIcon: const Icon(
                                Icons.calendar_today_outlined,
                                color: Colors.grey,
                              ),
                              validators: (value) {
                                Validators.validateName(value);
                              },
                              hintText: 'Transaction date',
                              fieldController: transactionController,
                              isShown: false,
                              inputType: TextInputType.datetime),
                          Container(
                            padding: const EdgeInsets.all(30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Client balance",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(" 0.0",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                          CustomFormField(
                            validators: (value) {},
                            hintText: 'Memo',
                            fieldController: nameController,
                            isShown: false,
                            maxLining: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Form(
                    key: _formKeys,
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          SelectInputType(
                            itemsToSelect: clientList,
                            dropDownHint: const Text(
                              "Select client",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          SelectInputType(
                            itemsToSelect: bankList,
                            dropDownHint: const Text(
                              "Cash / Bank",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          CustomFormField(
                              fieldIcon: const Icon(
                                Icons.calendar_today_outlined,
                                color: Colors.grey,
                              ),
                              validators: (value) {
                                Validators.validateName(value);
                              },
                              hintText: 'Transaction date',
                              fieldController: transactionController,
                              isShown: false,
                              inputType: TextInputType.datetime),
                          Container(
                            padding: const EdgeInsets.all(30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Client balance",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(" 0.0",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                          CustomFormField(
                            validators: (value) {},
                            hintText: 'Memo',
                            fieldController: nameController,
                            isShown: false,
                            maxLining: 5,
                          )
                        ],
                      ),
                    ),
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
