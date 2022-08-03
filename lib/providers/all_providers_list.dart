import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kudibooks_app/models/Users/ProductInLoad.dart';
import 'package:kudibooks_app/models/Users/products_sold_model.dart';
import 'package:kudibooks_app/models/Users/user_model.dart';
import 'package:kudibooks_app/models/client_model.dart';
import 'package:kudibooks_app/models/expense_model.dart';
import 'package:kudibooks_app/models/inventory_model.dart';
import 'package:kudibooks_app/models/product_model.dart';
import 'package:kudibooks_app/models/product_sale_model.dart';
import 'package:kudibooks_app/providers/client_provider.dart';
import 'package:kudibooks_app/providers/expenses_provider.dart';
import 'package:kudibooks_app/providers/inventory_provider.dart';
import 'package:kudibooks_app/providers/product_provider.dart';
import 'package:kudibooks_app/providers/products_sale_provider.dart';
import 'package:kudibooks_app/providers/user_provider.dart';

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
