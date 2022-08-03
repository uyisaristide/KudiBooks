import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kudibooks_app/models/product_model.dart';
import 'package:kudibooks_app/screens/auth_screens/login.dart';
import 'package:kudibooks_app/screens/auth_screens/phone_login.dart';
import 'package:kudibooks_app/screens/auth_screens/phone_signup.dart';
import 'package:kudibooks_app/screens/auth_screens/signup.dart';
import 'package:kudibooks_app/screens/dashboard/account_transfer.dart';
import 'package:kudibooks_app/screens/dashboard/all_transaction.dart';
import 'package:kudibooks_app/screens/dashboard/chart_of_account.dart';
import 'package:kudibooks_app/screens/dashboard/client_deposit.dart';
import 'package:kudibooks_app/screens/dashboard/client_list.dart';
import 'package:kudibooks_app/screens/dashboard/inventory_deduction.dart';
import 'package:kudibooks_app/screens/dashboard/loads.dart';
import 'package:kudibooks_app/screens/dashboard/new_account.dart';
import 'package:kudibooks_app/screens/dashboard/new_client.dart';
import 'package:kudibooks_app/screens/dashboard/new_expense.dart';
import 'package:kudibooks_app/screens/dashboard/new_inventory.dart';
import 'package:kudibooks_app/screens/dashboard/new_product.dart';
import 'package:kudibooks_app/screens/dashboard/product_details.dart';
import 'package:kudibooks_app/screens/dashboard/product_sale.dart';
import 'package:kudibooks_app/screens/dashboard/products.dart';
import 'package:kudibooks_app/screens/dashboard/reports.dart';
import 'package:kudibooks_app/screens/dashboard/settings_screen.dart';
import 'package:kudibooks_app/screens/dashboard/widget/bottom_navigation.dart';
import 'package:kudibooks_app/screens/splash_screen/green_splash_screen.dart';
import 'package:kudibooks_app/screens/splash_screen/white_splash_screen.dart';
import 'package:kudibooks_app/screens/welcome/welcome_screen.dart';

GoRouter router = GoRouter(
    initialLocation: '/',
    errorBuilder: (context, state) => MaterialApp(
            home: Scaffold(
          body: Center(
              child: Column(
            children: [
              TextButton(
                  onPressed: () => context.goNamed('sell'),
                  child: Text("404 ${state.error.toString()},")),
            ],
          )),
        )),
    routes: [
      //Auth screens
      GoRoute(
          name: "index",
          path: '/',
          builder: (context, state) => const GreenSplashScreen()),
      GoRoute(
          name: 'whiteSplash',
          path: '/whiteSplash',
          builder: (context, state) => const WhiteSplashScreen()),
      GoRoute(
          name: 'welcome',
          path: '/welcome',
          builder: (context, state) => const WelcomeScreen()),
      GoRoute(
          name: 'signup',
          path: '/createUserEmail',
          builder: (context, state) =>  SignUp()),
      GoRoute(
          name: 'signin',
          path: '/login',
          builder: (context, state) => const Login()),
      GoRoute(
          name: 'loginPhone',
          path: '/signinPhone',
          builder: (context, state) =>  PhoneLogin()),
      GoRoute(
          name: 'signupPhone',
          path: '/createUserPhone',
          builder: (context, state) =>  PhoneSignup()),

      //Dashboard screen routes
      GoRoute(
          name: 'dashboard',
          path: '/homeScreen',
          builder: (context, state) =>
              NavigationBottom(loggedUser: state.extra as String)),
      GoRoute(
          name: 'sell',
          path: '/sellProduct',
          builder: (context, state) => const ProductSale()),
      GoRoute(
          name: 'createInventory',
          path: '/newInventory',
          builder: (context, state) => NewInventory()),
      GoRoute(
          name: 'createExpense',
          path: '/newExpense',
          builder: (context, state) => const NewExpense()),
      GoRoute(
          name: 'inventoryDeduction',
          path: '/newInventoryDeduction',
          builder: (context, state) => InventoryDeduction()),
      GoRoute(
          name: 'depositClient',
          path: '/clientDeposit',
          builder: (context, state) => ClientDeposit()),
      GoRoute(
          name: 'accountTransfer',
          path: '/transferAccount',
          builder: (context, state) => AccountTransfer()),
      GoRoute(
          name: 'transactionsAll',
          path: '/allTransactions',
          builder: (context, state) => AllTransaction()),
      GoRoute(
          name: 'newChartAccount',
          path: '/newChartOfAccounts',
          builder: (context, state) => NewAccount()),
      GoRoute(
          name: 'chartAccount',
          path: '/newChartOfAccounts',
          builder: (context, state) => const ChartAccount()),
      GoRoute(
          name: 'newProduct',
          path: '/createProduct',
          builder: (context, state) => NewProduct()),
      GoRoute(
          name: 'screenProducts',
          path: '/productScreens',
          builder: (context, state) => ProductsScreen()),
      GoRoute(
          name: 'loadsScreens',
          path: '/allLoads',
          builder: (context, state) => Loads()),
      GoRoute(
          name: 'clientList',
          path: '/allClients',
          builder: (context, state) => ClientList()),
      GoRoute(
          name: 'newClient',
          path: '/createClient',
          builder: (context, state) => NewClient()),
      GoRoute(
          name: 'reports',
          path: '/reportsScreen',
          builder: (context, state) => const Reports()),
      GoRoute(
          name: 'pDetails',
          path: '/productDetails',
          builder: (context, state) =>
              ProductDetails(productModel: state.extra as ProductModel)),
      GoRoute(
          name: 'settingScreens',
          path: '/settings',
          builder: (context, state) => const Settings()),
    ]);
