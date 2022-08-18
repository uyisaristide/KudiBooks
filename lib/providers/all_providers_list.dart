import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/Users/ProductInLoad.dart';
import '../models/Users/products_sold_model.dart';
import '../models/Users/user_model.dart';
import '../models/chart_accounts.dart';
import '../models/client_model.dart';
import '../models/company_model.dart';
import '../models/expense_model.dart';
import '../models/inventory_model.dart';
import '../models/product_model.dart';
import '../models/product_sale_model.dart';
import 'chart_of_account.dart';
import 'charts_account_list.dart';
import 'client_provider.dart';
import 'company_provider.dart';
import 'expenses_provider.dart';
import 'inventory_provider.dart';
import 'product_provider.dart';
import 'products_sale_provider.dart';
import 'user_provider.dart';
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
