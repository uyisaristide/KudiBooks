import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'models/product_model.dart';
import 'screens/auth_screens/login.dart';
import 'screens/auth_screens/otp_verification.dart';
import 'screens/auth_screens/phone_login.dart';
import 'screens/auth_screens/phone_reset_screen.dart';
import 'screens/auth_screens/phone_signup.dart';
import 'screens/auth_screens/request_token_email_screen.dart';
import 'screens/auth_screens/reset_password.dart';
import 'screens/auth_screens/reset_pin.dart';
import 'screens/auth_screens/signup.dart';
import 'screens/company/companies_screen.dart';
import 'screens/company/new_company.dart';
import 'screens/dashboard/account_transfer.dart';
import 'screens/dashboard/all_transaction.dart';
import 'screens/dashboard/chart_of_account.dart';
import 'screens/dashboard/client_deposit.dart';
import 'screens/dashboard/client_list.dart';
import 'screens/dashboard/edit_chart_screen.dart';
import 'screens/dashboard/inventory_deduction.dart';
import 'screens/dashboard/loads.dart';
import 'screens/dashboard/new_account.dart';
import 'screens/dashboard/new_client.dart';
import 'screens/dashboard/new_expense.dart';
import 'screens/dashboard/new_inventory.dart';
import 'screens/dashboard/new_product.dart';
import 'screens/dashboard/product_details.dart';
import 'screens/dashboard/product_sale.dart';
import 'screens/dashboard/products.dart';
import 'screens/dashboard/reports.dart';
import 'screens/dashboard/settings_screen.dart';
import 'screens/dashboard/widget/bottom_navigation.dart';
import 'screens/splash_screen/green_splash_screen.dart';
import 'screens/splash_screen/white_splash_screen.dart';
import 'screens/welcome/welcome_screen.dart';

GoRouter router = GoRouter(
    // redirect: (state) {
    //   var token = Hive.box('tokens').get('token');
    //   debugPrint("Kigali Token: $token");
    //
    //   final goingToLogin = state.location == '/';
    //   if (token == null && goingToLogin) {
    //     return '/login';
    //   } else if (token != null && goingToLogin) {
    //     return '/homeScreen';
    //   }
    //   return null;
    // },
    urlPathStrategy: UrlPathStrategy.path,
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
          builder: (context, state) => const SignUp()),
      GoRoute(
          name: 'signin',
          path: '/login',
          builder: (context, state) => const Login()),
      GoRoute(
          name: "editChart",
          path: '/editChart',
          builder: (context, state) {
            return const EditCharts();
          }),
      GoRoute(
          name: 'loginPhone',
          path: '/signinPhone',
          builder: (context, state) => const PhoneLogin()),
      GoRoute(
          name: 'signupPhone',
          path: '/createUserPhone',
          builder: (context, state) => const PhoneSignup()),

      //Dashboard screen routes
      GoRoute(
          name: 'companiesScreen',
          path: '/companiesSreen',
          builder: (context, state) => const CompaniesScreen()),
      GoRoute(
          name: 'dashboard',
          path: '/homeScreen',
          builder: (context, state) => const NavigationBottom()),
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
          builder: (context, state) => const InventoryDeduction()),
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
          path: '/newChartOfAccounts/:id',
          builder: (context, state) {
            final id = state.params['id'];
            return NewAccount(accountId: int.parse(id.toString()));
          }),
      GoRoute(
          name: 'chartAccount',
          path: '/listOfAccounts',
          builder: (context, state) => const ChartAccount()),
      GoRoute(
          name: 'newProduct',
          path: '/createProduct',
          builder: (context, state) => const NewProduct()),
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
          builder: (context, state) => const NewClient()),
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
      GoRoute(
          name: 'newCompany',
          path: '/createCompany',
          builder: (context, state) => NewCompany(
                email: state.extra.toString(),
              )),
      GoRoute(
        name: 'forget',
        path: '/forgetPassword',
        builder: (context, state) =>
            PhoneReset(sentPhoneNumber: state.extra as String),
      ),
      GoRoute(
        name: 'otpVerification',
        path: '/verifyOTP',
        builder: (context, state) =>
            OtpVerification(phoneNumber: state.extra.toString()),
      ),
      GoRoute(
          name: 'recoverScreen',
          path: '/recoverScreens',
          builder: (context, state) {
            final phoneNumber = state.queryParams["phoneNumber"];
            final otps = state.queryParams["otps"];
            return ResetPin(
              phoneNumber: phoneNumber,
              sentOTP: otps,
            );
          }),
      GoRoute(
          name: 'requestTokenEmail',
          path: '/requestEmail',
          builder: (context, state) => EmailReset(
                sentEmail: state.extra.toString(),
              )),
      GoRoute(
          path: '/password/reset/:token',
          builder: (context, state) {
            final token = state.params["token"];
            final email = state.queryParams["email"];
            return ResetEmailPassword(
              recoverEmail: email,
              token: token,
            );
          })
    ]);
