import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import '../../../models/company_model.dart';
import '../../../models/plan.dart';
import '../../../models/utilities/network_info.dart';
import '../../../providers/all_providers_list.dart';
import '../../auth_screens/widgets/drop_down_widget.dart';
import '../../auth_screens/widgets/login_button.dart';
import '../../auth_screens/widgets/page_title.dart';
import '../../auth_screens/widgets/text_form_field.dart';
import '../../background.dart';
import '../../dashboard/classes/snack_bars.dart';

import '../models/create_company_model.dart';
import '../providers.dart';
import '../widgets/planCard.dart';

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
  // List<PurchasePlan> planList = PurchasePlan.purchaseList();
  // List<String> industryList = [];
  // // List<String> countryList = [];
  // List<String> currencyList = ['rwf', 'dolla', 'rwf', 'euro'];
  int? selectedIndustry;
  int? selectedCountry;
  int? selectedCurrency;
  int? selectedPlan;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(requireDataProvider.notifier).getRequiredData();
  }

  @override
  Widget build(BuildContext context) {
    ref.read(requireDataProvider.notifier).getRequiredData();
    var countries = ref.watch(requireDataProvider.notifier).countriesList;
    var planList = ref.watch(requireDataProvider.notifier).plansList;
    var industryList = ref.watch(requireDataProvider.notifier).industries;
    // List<String> countryList = [];

    List<String> currencyList =
        ref.watch(requireDataProvider.notifier).currencies;
    // var nOfPlans = planList.length;
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
                itemsToSelect: countries,
                dropDownHint: const Text("Select Country"),
                selectedValue: (value) {
                  int selectedIndexCountry =
                      countries.indexOf(value.toString());
                  setState(() {
                    selectedCountry = selectedIndexCountry;
                    print(selectedIndexCountry);
                  });
                }),
            SelectInputType(
                itemsToSelect: currencyList,
                dropDownHint: const Text("Select currency"),
                selectedValue: (value) {
                  int selectedIndexCurrency =
                      currencyList.indexOf(value.toString());
                  setState(() {
                    selectedCurrency = ++selectedIndexCurrency;
                    print(selectedIndexCurrency);
                  });
                }),
            SelectInputType(
                itemsToSelect: planList,
                dropDownHint: const Text("Select Plan"),
                selectedValue: (value) {
                  int selectedIndexPlanList =
                      planList.indexOf(value.toString());
                  setState(() {
                    selectedPlan = ++selectedIndexPlanList;
                    // print('selected : $selectedIndexCurrency');
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
            // Container(
            //   margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            //   height: 150,
            //   width: double.infinity,
            //   child: ListView.separated(
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (context, index) => Container(
            //             margin: const EdgeInsets.only(left: 10),
            //             decoration: BoxDecoration(
            //                 border: Border.all(width: 1.0, color: Colors.grey),
            //                 // color: const Color(0xff157253),
            //                 borderRadius: BorderRadius.circular(10.0)),
            //             child: Padding(
            //               padding: const EdgeInsets.all(10.0),
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   Text(
            //                     planList.toList()[index].name,
            //                     style: const TextStyle(fontSize: 15),
            //                   ),
            //                   const Flexible(
            //                     child: SizedBox(
            //                       height: 10,
            //                     ),
            //                   ),
            //                   Row(
            //                     children: [
            //                       Text(
            //                         planList.toList()[index].description,
            //                         style: const TextStyle(
            //                             fontWeight: FontWeight.bold,
            //                             fontSize: 18),
            //                       ),
            //                       Text(
            //                         planList.toList()[index].name,
            //                         style: const TextStyle(fontSize: 12),
            //                       ),
            //                     ],
            //                   ),
            //                   const Flexible(
            //                     child: SizedBox(
            //                       height: 10,
            //                     ),
            //                   ),
            //                   Text(
            //                     planList.toList()[index].id.toString(),
            //                     style: const TextStyle(
            //                         fontSize: 15, color: Colors.grey),
            //                   ),
            //                   const Flexible(
            //                     child: SizedBox(
            //                       height: 50,
            //                     ),
            //                   ),
            //                   const Text(
            //                     "Feature ?",
            //                     style: TextStyle(color: Color(0xff157253)),
            //                   )
            //                 ],
            //               ),
            //             ),
            //           ),
            //       separatorBuilder: (_, idx) => const SizedBox(
            //             width: 5,
            //           ),
            //       itemCount: nOfPlans),

            // ),
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
                      .createCompany(CreateCompanyModel(
                          companyName: companyNameController.text,
                          industry: selectedCountry,
                          country: selectedCountry,
                          currency: selectedCurrency,
                          plan: selectedPlan));
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
