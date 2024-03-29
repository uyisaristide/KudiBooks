import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/Users/ProductInLoad.dart';
import '../models/Users/products_sold_model.dart';
import '../models/Users/user_model.dart';
import '../models/Users/user_profile_model.dart';
import '../models/account_details_model.dart';
import '../models/account_type.dart';
import '../models/chart_accounts.dart';
import '../models/company_model.dart';
import '../models/expense_model.dart';
import '../models/inventory_model.dart';
import '../models/product/product_model.dart';
import '../models/product_sale_model.dart';
import '../models/utilities/network_info.dart';
import 'account_details.dart';
import 'chart_of_account.dart';
import 'charts_account_list.dart';

import 'company/get_company_list.dart';
import 'company_notifier.dart';
import 'expenses_provider.dart';
import 'inventory_provider.dart';
import 'mode_notifier.dart';
import 'product/product_provider.dart';
import 'product/products_sale_provider.dart';
import 'user_profile_provider.dart';
import 'user_provider.dart';
import 'authentication/auth_provider.dart';

final productProvider =
    StateNotifierProvider<ProductProvider, List<ProductModel>>(
        (ref) => ProductProvider());

final expenseProvider = StateNotifierProvider<ExpensesProvider, List<Expense>>(
    (ref) => ExpensesProvider());

final inventoryProvider =
    StateNotifierProvider<InventoryProviders, List<InventoryModel>>(
        (ref) => InventoryProviders());

//User Providers
final usersProvider =
    StateNotifierProvider<UserNotifier, NetworkInfo<List<User>>>(
        (ref) => UserNotifier(ref));
final createUserEmailProvider =
    StateNotifierProvider<UserNotifier, NetworkInfo<List<User>>>(
        (ref) => UserNotifier(ref));
final createUserPhoneProvider =
    StateNotifierProvider<UserNotifier, NetworkInfo<List<User>>>(
        (ref) => UserNotifier(ref));
final loginEmailProvider =
    StateNotifierProvider<UserNotifier, NetworkInfo<List<User>>>(
        (ref) => UserNotifier(ref));
final loginPhoneProvider =
    StateNotifierProvider<UserNotifier, NetworkInfo<List<User>>>(
        (ref) => UserNotifier(ref));
final logoutProvider =
    StateNotifierProvider<UserNotifier, NetworkInfo<List<User>>>(
        (ref) => UserNotifier(ref));

final productToSalesProvide =
    StateNotifierProvider<AddProductToSalesNotifier, List<ProductToSell>>(
        (ref) => AddProductToSalesNotifier());
final productToLoadProvider =
    StateNotifierProvider<ProductInLoadProvider, List<ProductInLoadModel>>(
        (ref) => ProductInLoadProvider());
final salesProvider =
    StateNotifierProvider<ProductSalesProvider, List<ProductSalesModel>>(
        (ref) => ProductSalesProvider());

//Company providers
final companyListProvider =
    StateNotifierProvider<CompanyListNotifier, NetworkInfo<List<CompanyModel>>>(
        (ref) => CompanyListNotifier());
final companyProvider =
    StateNotifierProvider<CompanyNotifier, NetworkInfo<CompanyModel>>(
        (ref) => CompanyNotifier());
final createCompanyProvider =
    StateNotifierProvider<CompanyNotifier, NetworkInfo<CompanyModel>>(
        (ref) => CompanyNotifier());

//Auth
final authProvider =
    StateNotifierProvider<AuthProvider, NetworkInfo<List<User>>>(
        (ref) => AuthProvider());
final requestingOtpProvider =
    StateNotifierProvider<AuthProvider, NetworkInfo<List<User>>>(
        (ref) => AuthProvider());
final verifyOtpProvider =
    StateNotifierProvider<AuthProvider, NetworkInfo<List<User>>>(
        (ref) => AuthProvider());
final resetUserInfoProvider =
    StateNotifierProvider<AuthProvider, NetworkInfo<List<User>>>(
        (ref) => AuthProvider());
final forgetPasswordProvider =
    StateNotifierProvider<AuthProvider, NetworkInfo<List<User>>>(
        (ref) => AuthProvider());

final modeProvider =
    StateNotifierProvider<ModeNotifier, ThemeMode?>((ref) => ModeNotifier());

final userProfileProvider =
    StateNotifierProvider<UserProfileNotifier, NetworkInfo<UserProfile>>(
        (ref) => UserProfileNotifier(ref));
final userInHiveProvider =
    StateNotifierProvider<UserProfileNotifier, NetworkInfo<UserProfile>>(
        (ref) => UserProfileNotifier(ref));

//Chart of account providers
final removeChartProvider = StateNotifierProvider<AllChartAccountsProvider,
    NetworkInfo<List<Accounts>>>((ref) => AllChartAccountsProvider());
final editChartProvider = StateNotifierProvider<AllChartAccountsProvider,
    NetworkInfo<List<Accounts>>>((ref) => AllChartAccountsProvider());
final chartAccountProvider = StateNotifierProvider<ChartAccountProvider,
    NetworkInfo<List<AccountChartModel>>>((ref) => ChartAccountProvider());
final allAccountsProvider = StateNotifierProvider<AllChartAccountsProvider,
    NetworkInfo<List<Accounts>>>((ref) => AllChartAccountsProvider());
final accountDetailsProvider = StateNotifierProvider<AccountDetailsNotifier,
    NetworkInfo<AccountDetailsModel?>>((ref) => AccountDetailsNotifier());
