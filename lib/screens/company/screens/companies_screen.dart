import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../providers/all_providers_list.dart';
import '../providers.dart';

class CompaniesScreen extends ConsumerStatefulWidget {
  const CompaniesScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CompaniesScreen> createState() => _CompaniesScreenState();
}

class _CompaniesScreenState extends ConsumerState<CompaniesScreen> {
  // List<CompanyModel> listCompanies = [];
  // populateCompanies() {
  //   var companyList = ref.watch(companyProvider);
  //   listCompanies = companyList.data ?? [];
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ref.read(companyProvider.notifier).getCompanyFromHive();
    ref.read(userInHiveProvider.notifier).getUserFromHive();
    ref.read(requireDataProvider.notifier).getRequiredData();
  }

  @override
  Widget build(BuildContext context) {
    ref.read(companyProvider.notifier).data;
    var selectedCompany =
        ref.read(companyProvider.notifier).getCompanyFromHive();
    var companies = ref.watch(companyProvider.notifier).data;
    var currentCompany = ref.watch(companyProvider.notifier).myCompany;

    var limit = companies.length;
    // print('company of id  : ${currentCompany!.companyId}');

    ref.read(requireDataProvider.notifier).getRequiredData;

    return Scaffold(
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: const Color(0xffFDAB30),
            padding: const EdgeInsets.all(15.0),
            elevation: 0.0,
            shape: const CircleBorder()),
        onPressed: () => context.pushNamed('newCompany'),
        child: const Text(
          '+',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              const SliverAppBar(
                systemOverlayStyle:
                    SystemUiOverlayStyle(statusBarColor: Color(0xff157253)),
                pinned: true,
                automaticallyImplyLeading: true,
                elevation: 0.0,
                backgroundColor: Color(0xff157253),
                centerTitle: true,
                title: Text("Select Company",
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ),
            ];
          },
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LimitedBox(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      // itemBuilder: (context, index) => ProductListCard(index: index),
                      itemBuilder: (context, index) {
                        if (currentCompany != null) {
                          if (currentCompany.companyId ==
                              companies.toList()[index].companyId) {}
                        }
                        // currentCompany??currentCompany!.companyId == companies.toList()[index].companyId?isCurrentlySelected =true : ;

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child:
                              //     Container(
                              //   padding: const EdgeInsets.symmetric(vertical: 5),
                              //   child:
                              //    Text('company $index'),
                              // )
                              Container(
                            decoration: BoxDecoration(
                                color: currentCompany!.companyId ==
                                        companies.toList()[index].companyId
                                    ? Colors.grey[400]
                                    : Colors.grey[100],
                                borderRadius: BorderRadius.circular(5)),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: Column(
                              children: [
                                // ListTile(
                                //   leading: const Icon(Icons.houseboat),
                                //   title: Text(
                                //     'company:${companies.toList()[index].companyName}',
                                //     // '${companies.iterator.current.companyName} $index',
                                //     style: const TextStyle(
                                //         fontWeight: FontWeight.bold,
                                //         // fontSize: 20,
                                //         color: Color(0xff157253)),
                                //   ),
                                //   subtitle: Text('admin $index'),
                                //   trailing: Text('industry $index'),
                                // ),
                                // const Divider(),
                                ListTile(
                                  leading: const Icon(Icons.houseboat),
                                  title: Text(
                                    'Company   ${companies.toList()[index].companyName}',
                                    // '${companies.iterator.current.companyName} $index',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Color(0xff157253)),
                                  ),
                                  subtitle: Text(
                                      '${companies.toList()[index].industry} Industry'),
                                  trailing: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                const Color(0xff157253))),
                                    child: Text(currentCompany.companyId ==
                                            companies.toList()[index].companyId
                                        ? 'continue'
                                        : 'choose'),
                                    onPressed: () async {
                                      ref
                                          .read(companyProvider.notifier)
                                          .getCompaniesList();

                                      ref
                                          .read(companyProvider.notifier)
                                          .addCurrentCompanyToHive(
                                              companies.toList()[index]);
                                      ref
                                          .read(companyProvider.notifier)
                                          .getCompanyFromHive();
                                      var myCompany = ref
                                          .watch(companyProvider.notifier)
                                          .myCompany;
                                      print(
                                          'now in company ${myCompany!.companyName}');

                                      context.goNamed('dashboard');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: limit),
                ),
              ],
            ),
          )),
    );
  }
}
