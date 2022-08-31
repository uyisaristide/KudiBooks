import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/account_type.dart';
import '../../../models/product/required_data_product.dart';
import '../../../models/utilities/network_info.dart';
import '../../../providers/product/providers.dart';
import '../new_account.dart';
import '../new_inventory.dart';
import '../widget/search_input.dart';

class LoadProductRequiredData extends ConsumerStatefulWidget {
  bool? inInventory;
  Function(RevenueAccounts revenueAccounts)? revenueExpenseFunction;
  Function(InventoryExpenseAccounts inventoryAccount)? inventoryAccount;
  LoadProductRequiredData({this.inInventory,this.inventoryAccount, this.revenueExpenseFunction,  Key? key}) : super(key: key);

  @override
  ConsumerState<LoadProductRequiredData> createState() =>
      _LoadProductRequiredDataState();
}

class _LoadProductRequiredDataState
    extends ConsumerState<LoadProductRequiredData> {
  void runRequiredData() {
    ref.read(productToSellRequiredDataProvider.notifier).productRequiredData();
  }

  final searchController = TextEditingController();
  List<RevenueAccounts> revenueAccountsList = [];
  List<InventoryExpenseAccounts> inventoryAccountsList = [];

  populateRequiredData() {
    var requiredDataWatcher = ref.watch(productToSellRequiredDataProvider);
    //revenue account
    revenueAccountsList = requiredDataWatcher.data?.revenueAccounts ?? [];
    //
  }

  populateRequiredDataInventory() {
    var requiredDataWatcherInventory = ref.watch(productToSellRequiredDataProvider);
    //revenue account
    inventoryAccountsList = requiredDataWatcherInventory.data?.inventoryExpenseAccounts ?? [];
    //
  }

  createExpenseAccount(AccountName accountName) {}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      runRequiredData();
    });
  }

  @override
  Widget build(BuildContext context) {
    var listWatcher = ref.watch(productToSellRequiredDataProvider);
    ref.listen<NetworkInfo<RequiredDataProduct>>(
        productToSellRequiredDataProvider, (previous, next) {
      if (next.networkStatus == NetworkStatus.success) {
        populateRequiredData();
      }
    });
    ref.listen<NetworkInfo<RequiredDataProduct>>(
        productToSellRequiredDataProvider, (previous, next) {
      if (next.networkStatus == NetworkStatus.success) {
        populateRequiredDataInventory();
      }
    });
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: listWatcher.networkStatus == NetworkStatus.loading
          ? Center(
              child: CircularProgressIndicator(color: Colors.green.shade400),
            )
          : widget.inInventory == true
              ? Column(children: [
                  SearchTextField(
                    searchContent: searchController,
                    hintTexts: 'Search inventory expense account',
                    fieldIcon: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => DialogBox.dialogBox(
                          NewAccount(accountId: 0), context, 0.60),
                      color: Colors.grey,
                    ),
                  ),
                  RefreshIndicator(
                    onRefresh: () {
                      return ref.read(productToSellRequiredDataProvider.notifier).productRequiredData();
                    },
                    child: ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      children: inventoryAccountsList
                          .map((e) => ListTile(
                                onTap: () {
                                  widget.inventoryAccount!(e);
                                  Navigator.pop(context);
                                },
                                title: Text("${e.name}"),
                                leading: const Icon(
                                    Icons.account_balance_wallet_outlined),
                              ))
                          .toList(),
                    ),
                  )
                ])
              : listWatcher.networkStatus == NetworkStatus.success
                  ? Column(children: [
                      SearchTextField(
                        searchContent: searchController,
                        hintTexts: 'Search revenue account',
                        fieldIcon: IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => DialogBox.dialogBox(
                              NewAccount(accountId: 0), context, 0.60),
                          color: Colors.grey,
                        ),
                      ),
                      RefreshIndicator(
                        onRefresh: () {
                          return ref.read(productToSellRequiredDataProvider.notifier).productRequiredData();
                        },
                        child: ListView(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          children: revenueAccountsList
                              .map((e) => ListTile(
                                    onTap: () {
                                      widget.revenueExpenseFunction!(e);
                                      Navigator.pop(context);
                                    },
                                    title: Text("${e.name}"),
                                    leading: const Icon(
                                        Icons.account_balance_wallet_outlined),
                                  ))
                              .toList(),
                        ),
                      )
                    ])
                  : listWatcher.networkStatus == NetworkStatus.failed
                      ? Center(
                          child: Text(listWatcher.getErrorMessage),
                        )
                      : Center(child: Text("${listWatcher.errorMessage}")),
    );
  }
}
