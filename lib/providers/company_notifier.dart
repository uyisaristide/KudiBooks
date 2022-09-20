import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../dio_services.dart';
import '../handle/error_handler.dart';
import '../main.dart';
import '../models/company_model.dart';
import '../models/utilities/network_info.dart';
import '../screens/company/models/create_company_model.dart';
import 'user_provider.dart';

int? selectedCompanyId;

class CompanyNotifier extends StateNotifier<NetworkInfo<CompanyModel>> {
  CompanyNotifier() : super(NetworkInfo());
  final Dio _dio = Dio();

  Map<String, String> mainHeader = {
    "Content-type": "application/json",
    "Authorization": "Bearer $myToken"
  };
  // CompanyModel? miCompany;

  Future addCurrentCompanyToHive(CompanyModel company) async {
    // userProfileBox = await Hive.openBox<UserProfile?>(userProfileBoxName);
    var currentCompany = Hive.box(currentCompanyBoxName);
    await currentCompany.put('company', company);
  }

  CompanyModel? getCompanyFromHive()  {
    // userProfileBox = await Hive.openBox<UserProfile?>(userProfileBoxName);
    var company = Hive.box(currentCompanyBoxName);
    // state = currentCompany.get('company');
    var currentCompany = company.get('company');
    return currentCompany;
  }

  Future<NetworkInfo> createCompany(CreateCompanyModel company) async {
    state = NetworkInfo(networkStatus: NetworkStatus.loading);
    try {
      // debugPrint(" company: ${company.toJson()}");
      var response = await _dio.post("${DioServices.baseUrl}app/company",
          data: company.toJson(), options: Options(headers: mainHeader));

      print(mainHeader);
      print(response);
      var info = NetworkInfo<List<CreateCompanyModel>>(
          networkStatus: NetworkStatus.success, statusCode: 200);
      return info;
    } on DioError catch (e) {
      state = ErrorHandler.handleError<CompanyModel>(e);
      return state;
    } catch (e) {
      var info =
          NetworkInfo<List<CompanyModel>>(networkStatus: NetworkStatus.error);
      return info;
    }
  }

  // allCompanies() async {
  //   Response response = await _dio.get('${DioServices.baseUrl}app/company',
  //       options: Options(headers: DioServices.mainHeader));
  // }
}
