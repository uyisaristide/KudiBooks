import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import '../../../models/utilities/network_info.dart';
import '../classes/snack_bars.dart';
import 'single_vendor.dart';
import '../../../providers/vendor/vendor_providers.dart';
import '../classes/sliver_delegate_search.dart';

class Vendors extends ConsumerStatefulWidget {
  const Vendors({Key? key}) : super(key: key);

  @override
  ConsumerState<Vendors> createState() => _VendorsState();
}

class _VendorsState extends ConsumerState<Vendors> {
  @override
  void loadVendors() {
    ref.read(allVendorsProvider.notifier).allVendors();
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadVendors();
    });
  }

  @override
  Widget build(BuildContext context) {
    var allVendors = ref.watch(allVendorsProvider);
    return Scaffold(
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: const Color(0xffFDAB30),
            padding: const EdgeInsets.all(15.0),
            elevation: 0.0,
            shape: const CircleBorder()),
        onPressed: () => context.push('/createVendor/0'),
        child: const Text(
          '+',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const SliverAppBar(
              pinned: true,
              systemOverlayStyle:
                  SystemUiOverlayStyle(statusBarColor: Color(0xff157253)),
              elevation: 0.0,
              backgroundColor: Color(0xff157253),
              centerTitle: true,
              title: Text("Vendors",
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
            SliverPersistentHeader(
                pinned: true,
                delegate: SearchBoxSliver(
                  maxHeight: 50,
                  minHeight: 50,
                  child: Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding:
                                const EdgeInsets.only(top: 15.0, bottom: 15.0),
                            child: const Text(
                              "All Vendors",
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
                    ),
                  ),
                )),
          ];
        },
        body: allVendors.networkStatus == NetworkStatus.loading
            ? Center(
                child: CircularProgressIndicator(color: Colors.green.shade400),
              )
            :allVendors.networkStatus == NetworkStatus.success?
        RefreshIndicator(color: Colors.green.shade400,
          onRefresh: (){return ref.read(allVendorsProvider.notifier).allVendors();},
          child: LimitedBox(
            maxHeight: 1000,
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => Slidable(
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) {
                                  showDialog<void>(
                                      context: context,
                                      builder: (deleteContext) {
                                        return AlertDialog(
                                          title: const Text('Are you sure?'),
                                          content: const Text(
                                              "Do you want to remove this vendor"),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text('No'),
                                              onPressed: () {
                                                Navigator.of(deleteContext)
                                                    .pop(); // Dismiss alert dialog
                                              },
                                            ),
                                            TextButton(
                                              child: const Text('Yes'),
                                              onPressed: () async {
                                                var deleteResponse = await ref.read(deleteVendorProvider.notifier)
                                                    .removeVendor(int.parse(allVendors.data![index].id.toString()));
                                                if (deleteResponse.networkStatus == NetworkStatus.success) {
                                                  Navigator.pop(deleteContext);
                                                  loadVendors();
                                                  ScaffoldMessenger.of(
                                                      deleteContext).showSnackBar(SnackBars.snackBars('Deleted successfully',Colors.green.shade400));
                                                } else {
                                                  Navigator.pop(deleteContext);
                                                  ScaffoldMessenger.of(deleteContext).showSnackBar(SnackBars.snackBars(
                                                      deleteResponse.getErrorMessage,Colors.redAccent));
                                                }
                                                // Dismiss alert dialog
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                },
                                icon: Icons.edit_outlined,
                                backgroundColor: Colors.redAccent,
                                foregroundColor: Colors.white,
                                label: 'Delete',
                              )
                            ],
                          ),
                          startActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) {
                                  context.push('/createVendor/${allVendors.data![index].id}');
                                },
                                label: 'Edit',
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.green.shade400,
                              )
                            ],
                          ),
                          child: InkWell(
                            onTap: () {
                              return context.push(
                                  '/profileVendor/${allVendors.data![index].id}');
                            },
                            child:
                                VendorListItem(vendor: allVendors.data![index]),
                          )),
                      separatorBuilder: (_, idx) => const SizedBox(
                            height: 5,
                          ),
                      itemCount: allVendors.data?.length??0),
                ),
        ):allVendors.networkStatus == NetworkStatus.error?
        Center(child: Text('${allVendors.errorMessage}'),):
        Center(child: Text('${allVendors.errorMessage}'),),
      ),
    );
  }
}
