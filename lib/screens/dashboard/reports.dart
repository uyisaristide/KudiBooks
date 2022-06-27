import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/drop_down_widget.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final dateFrom = TextEditingController();
  final dateTo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              title: const Text("Reports",
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SelectInputType(
                      itemsToSelect: [],
                      dropDownHint: const Text(
                        'Financial report',
                        style: TextStyle(color: Colors.grey),
                      )),
                  SelectInputType(
                      itemsToSelect: [],
                      dropDownHint: const Text(
                        'Report type',
                        style: TextStyle(color: Colors.grey),
                      )),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomFormField(
                            hintText: 'From',
                            validators: (value) {},
                            fieldController: dateFrom,
                            isShown: false,
                            inputType: TextInputType.datetime,
                            fieldIcon:
                                const Icon(Icons.calendar_today_outlined),
                          ),
                        ),
                        Expanded(
                          child: CustomFormField(
                            validators: () {},
                            hintText: 'To',
                            fieldController: dateTo,
                            isShown: false,
                            inputType: TextInputType.datetime,
                            fieldIcon:
                                const Icon(Icons.calendar_today_outlined),
                          ),
                        )
                      ],
                    ),
                  ),
                  LoginButton(text: 'View report', actionField: () {})
                ],
              ),
            ),
          )),
    );
  }
}
