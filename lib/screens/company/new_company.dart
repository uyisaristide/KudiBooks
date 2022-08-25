import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import '../../models/company_model.dart';
import '../../models/plan.dart';
import '../../models/utilities/network_info.dart';
import '../../providers/all_providers_list.dart';
import '../auth_screens/widgets/drop_down_widget.dart';
import '../auth_screens/widgets/login_button.dart';
import '../auth_screens/widgets/page_title.dart';
import '../auth_screens/widgets/text_form_field.dart';
import '../background.dart';
import '../dashboard/classes/snack_bars.dart';
import 'widgets/planCard.dart';

class NewCompany extends ConsumerStatefulWidget {
  String? email;
  NewCompany({this.email, Key? key}) : super(key: key);

  @override
  ConsumerState<NewCompany> createState() => _NewCompanyState();
}

class _NewCompanyState extends ConsumerState<NewCompany> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final companyNameController = TextEditingController();
  final industryController = TextEditingController();
  final countryController = TextEditingController();
  final currencyController = TextEditingController();
  List<PurchasePlan> planList = PurchasePlan.purchaseList();
  List<String> industryList = ["Marketing", "TV Selling", "Carpentry"];
  List<String> countryList = ["Rwanda", "Burundi", "Uganda", "Country"];
  List<String> currencyList = ["US", "RWF", "EURO"];
  int? selectedIndustry;
  int? selectedCountry;
  int? selectedCurrency;

  @override
  Widget build(BuildContext context) {
    print('${Hive.box('company').get('companyId')}');
    print("Logged Email: ${widget.email}");
    ref.watch(createCompanyProvider);
    return BackgroundScreen(
      paddingSize: 150.0,
      screens: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const PageTitle(title: 'Create new account'),
            LoginButton(
                text: "Skip",
                actionField: () {
                  var tokenId = '${Hive.box('company').get('companyId')}';
                  tokenId.isNotEmpty
                      ? context.goNamed('dashboard')
                      : ScaffoldMessenger.of(context).showSnackBar(
                          SnackBars.snackBars('Register Company first',
                              Colors.redAccent.shade400));
                }),
            CustomFormField(
              fieldController: companyNameController,
              fieldIcon: const Icon(Icons.person),
              hintText: 'Company Name',
              validators: (value) {
                if (value.toString().isEmpty) {
                  return "Company Name required";
                }
                return null;
              },
              isShown: false,
            ),
            SelectInputType(
                itemsToSelect: industryList,
                dropDownHint: const Text("Select Industry"),
                selectedValue: (value) {
                  int selectedIndex = industryList.indexOf(value.toString());
                  setState(() {
                    selectedIndustry = ++selectedIndex;
                    print(selectedIndex);
                  });
                }),
            SelectInputType(
                itemsToSelect: countryList,
                dropDownHint: const Text("Select Country"),
                selectedValue: (value) {
                  int selectedIndexCountry =
                      countryList.indexOf(value.toString());
                  setState(() {
                    selectedCountry = ++selectedIndexCountry;
                    print(selectedIndexCountry);
                  });
                }),
            SelectInputType(
                itemsToSelect: currencyList,
                dropDownHint: const Text("Select Country"),
                selectedValue: (value) {
                  int selectedIndexCurrency =
                      currencyList.indexOf(value.toString());
                  setState(() {
                    selectedCurrency = ++selectedIndexCurrency;
                    print(selectedIndexCurrency);
                  });
                }),
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
            LoginButton(
                text: "Create company",
                actionField: () async {
                  var createCompany = await ref
                      .read(createCompanyProvider.notifier)
                      .createCompany(Company(
                          companyName: companyNameController.text,
                          industry: int.parse(selectedIndustry.toString()),
                          country: int.parse(selectedCountry.toString()),
                          currency: 2,
                          plan: 1),email: widget.email);
                  if (createCompany.networkStatus == NetworkStatus.success) {
                    context.goNamed("dashboard");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBars.snackBars('${createCompany.getErrorMessage}',
                            Colors.redAccent.shade400));
                  }
                })
          ],
        ),
      ),
    );
  }
}
