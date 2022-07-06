import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/drop_down_widget.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';
import 'package:kudibooks_app/screens/dashboard/widget/common_appBar.dart';
import 'package:kudibooks_app/screens/dashboard/widget/title_double.dart';

class AllTransaction extends StatelessWidget {
  AllTransaction({Key? key}) : super(key: key);
  List<String> transactionList = [];
  final dateFrom = TextEditingController();
  final dateTo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon.preferredSizeWidget(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SelectInputType(
                itemsToSelect: transactionList,
                dropDownHint: const Text(
                  "Transaction type",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomFormField(
                      hintText: 'From',
                      validators: (value) {},
                      fieldController: dateFrom,
                      isShown: false,
                      inputType: TextInputType.datetime,
                      fieldIcon: const Icon(Icons.calendar_today_outlined),
                    ),
                  ),
                  Expanded(
                    child: CustomFormField(
                      validators: () {},
                      hintText: 'To',
                      fieldController: dateTo,
                      isShown: false,
                      inputType: TextInputType.datetime,
                      fieldIcon: const Icon(Icons.calendar_today_outlined),
                    ),
                  )
                ],
              ),
              DoubleHeader(
                rightSide: "Transactions",
                iconButton2: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
                iconButton: const Text("View all"),
              ),
              LimitedBox(
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => ListTile(
                          subtitle: const Text("20 April 2022"),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "\$25.99",
                              ),
                              Text(
                                index % 2 == 0 ? "Approved" : "In process",
                                style: TextStyle(
                                  color: index % 2 == 0
                                      ? Colors.green
                                      : Colors.amber,
                                ),
                              )
                            ],
                          ),
                          title: const Text(
                            "Transaction name",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          leading: CircleAvatar(
                            backgroundColor: const Color(0xffC4C4C4),
                            child: Text(
                              "${++index}",
                              style: TextStyle(
                                  color: index % 2 == 0
                                      ? Colors.amber
                                      : Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
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
    );
  }
}
