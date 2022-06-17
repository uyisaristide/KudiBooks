import 'package:flutter/material.dart';
import 'package:kudibooks_app/models/plan.dart';
import 'package:kudibooks_app/screens/auth_screens/validators/validator.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/login_button.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/page_title.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/text_form_field.dart';
import 'package:kudibooks_app/screens/background.dart';
import 'package:kudibooks_app/screens/company/widgets/planCard.dart';

class NewCompany extends StatefulWidget {
  const NewCompany({Key? key}) : super(key: key);

  @override
  State<NewCompany> createState() => _NewCompanyState();
}

class _NewCompanyState extends State<NewCompany> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final companyNameController = TextEditingController();
  final industryController = TextEditingController();
  final countryController = TextEditingController();
  final currencyController = TextEditingController();
  List<PurchasePlan> planList = PurchasePlan.purchaseList();

  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
      paddingSize: 150.0,
      screens: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const PageTitle(title: 'Create new account'),
            CustomFormField(
              fieldController: companyNameController,
              fieldIcon: const Icon(Icons.person),
              hintText: 'Company Name',
              validators: (value) => Validators.validateName(value),
              isShown: false,
            ),
            CustomFormField(
              fieldController: industryController,
              fieldIcon: const Icon(Icons.person_outline),
              hintText: 'Industry',
              validators: (value) => Validators.validateName(value),
              isShown: false,
            ),
            CustomFormField(
              fieldController: countryController,
              fieldIcon: const Icon(Icons.check),
              hintText: 'Country',
              validators: (value) => Validators.validateEmail(value),
              isShown: false,
            ),
            CustomFormField(
              fieldController: currencyController,
              fieldIcon: const Icon(Icons.remove_red_eye),
              hintText: 'Currency',
              validators: (value) => Validators.validatePassword(value),
              isShown: false,
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  "Select Plan",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: 150,
              width: double.infinity,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => PlanCard(
                        purchasePlan: planList[index],
                      ),
                  separatorBuilder: (_, idx) => const SizedBox(
                        width: 5,
                      ),
                  itemCount: planList.length),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 10.0),
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: const [
                  Text(
                    "By clicking create company button you agree to our",
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "terms and conditions.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xff157253)),
                  ),
                ],
              ),
            ),
            LoginButton(text: "Create company", actionField: () {})
          ],
        ),
      ),
    );
  }
}
