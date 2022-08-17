import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kudibooks_app/models/Users/ProductInLoad.dart';
import 'package:kudibooks_app/models/Users/products_sold_model.dart';
import 'package:kudibooks_app/models/Users/user_model.dart';
import 'package:kudibooks_app/models/chart_accounts.dart';
import 'package:kudibooks_app/models/client_model.dart';
import 'package:kudibooks_app/models/company_model.dart';
import 'package:kudibooks_app/models/expense_model.dart';
import 'package:kudibooks_app/models/inventory_model.dart';
import 'package:kudibooks_app/models/product_model.dart';
import 'package:kudibooks_app/models/product_sale_model.dart';
import 'package:kudibooks_app/providers/chart_of_account.dart';
import 'package:kudibooks_app/providers/charts_account_list.dart';
import 'package:kudibooks_app/providers/client_provider.dart';
import 'package:kudibooks_app/providers/company_provider.dart';
import 'package:kudibooks_app/providers/expenses_provider.dart';
import 'package:kudibooks_app/providers/inventory_provider.dart';
import 'package:kudibooks_app/providers/product_provider.dart';
import 'package:kudibooks_app/providers/products_sale_provider.dart';
import 'package:kudibooks_app/providers/user_provider.dart';
import '../models/chart_of_account_model.dart';
import 'authentication/auth_provider.dart';

final productProvider =
    StateNotifierProvider<ProductProvider, List<ProductModel>>(
        (ref) => ProductProvider());

final clientProvider = StateNotifierProvider<ClientNotifier, List<ClientModel>>(
    (ref) => ClientNotifier());

final expencesProvider = StateNotifierProvider<ExpensesProvider, List<Expense>>(
    (ref) => ExpensesProvider());

final inventoryProvider =
    StateNotifierProvider<InventoryProviders, List<InventoryModel>>(
        (ref) => InventoryProviders());
final usersProvider =
    StateNotifierProvider<UserProvider, List<User>>((ref) => UserProvider());

final productToSalesProvide =
    StateNotifierProvider<AddProductToSalesNotifier, List<ProductToSell>>(
        (ref) => AddProductToSalesNotifier());
final productToLoadProvider =
    StateNotifierProvider<ProductInLoadProvider, List<ProductInLoadModel>>(
        (ref) => ProductInLoadProvider());
final salesProvider =
    StateNotifierProvider<ProductSalesProvider, List<ProductSalesModel>>(
        (ref) => ProductSalesProvider());
final companyProvider = StateNotifierProvider<CompanyProvider, List<Company>>(
    (ref) => CompanyProvider());
final authProvider =
    StateNotifierProvider<AuthProvider, List<User>>((ref) => AuthProvider());
final chartAccountProvider =
    StateNotifierProvider<ChartAccountProvider, List>(
        (ref) => ChartAccountProvider());
final allAccountsProvider = StateNotifierProvider<AllChartAccountsProvider, List<Accounts>>((ref) => AllChartAccountsProvider());
