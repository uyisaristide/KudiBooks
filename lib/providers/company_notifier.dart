import 'dart:math';

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

class CompanyNotifier extends StateNotifier<NetworkInfo<List<CompanyModel>>> {
  CompanyNotifier() : super(NetworkInfo());
  final Dio _dio = Dio();

  // List companiesList = [];
  List<CompanyModel> data = [];

  CompanyModel? myCompany;

  Map<String, String> mainHeader = {
    "Content-type": "application/json",
    "Authorization": "Bearer $myToken"
  };
  // CompanyModel? miCompany;
  Future getCompaniesList() async {
    state = NetworkInfo(networkStatus: NetworkStatus.loading)
      ..data = state.data;
    try {
      // Map<String, String> mainHeader = {
      //   "Content-type": "application/json",
      //   "Authorization": "Bearer $myToken"
      // };
      Response companiesListResponse = await _dio.get(
          '${DioServices.baseUrl}app/company',
          options: Options(headers: mainHeader));

      var companiesList = CompaniesList.fromJson(companiesListResponse.data);
      debugPrint("gjgjg ${companiesList.companies.length}");

      data = companiesList.companies;
      // for (var companies in companiesList.companies) {
      //   data.add(companies);
      // }

      var info = NetworkInfo<List<CompanyModel>>(
          statusCode: 200, networkStatus: NetworkStatus.success, data: data);

      // print(info.data);
      state = info;
    } on DioError catch (e) {
      NetworkInfo<CompanyModel> info =
          NetworkInfo(networkStatus: NetworkStatus.failed);
      switch (e.type) {
        case DioErrorType.connectTimeout:
          // TODO: Handle this case.
          info.errorMessage = "Connection error, check your internet";
          break;
        case DioErrorType.sendTimeout:
          // TODO: Handle this case.
          info.errorMessage = "Check connection, before send data";
          break;
        case DioErrorType.receiveTimeout:
          // TODO: Handle this case.
          info.errorMessage = "Slow network";
          break;
        case DioErrorType.response:
          // TODO: Handle this case.
          info = NetworkInfo<CompanyModel>.errors(e.response?.data ?? {},
              statusCode: e.response!.statusCode, status: NetworkStatus.failed);
          break;
        case DioErrorType.cancel:
          // TODO: Handle this case.
          info = NetworkInfo(errorMessage: "Reconnect your internet");
          break;
        case DioErrorType.other:
          // TODO: Handle this case.
          info = NetworkInfo(errorMessage: "Check your internet");
          break;
      }
    } catch (e) {
      NetworkInfo<CompanyModel> info = NetworkInfo();
      info.errorMessage = "";
    }
  }

  Future addCurrentCompanyToHive(CompanyModel company) async {
    // userProfileBox = await Hive.openBox<UserProfile?>(userProfileBoxName);
    var currentCompany = Hive.box(currentCompanyBoxName);
    await currentCompany.put('company', company);
  }

  Future<CompanyModel?> getCompanyFromHive() async {
    // userProfileBox = await Hive.openBox<UserProfile?>(userProfileBoxName);
    var currentCompany = Hive.box(currentCompanyBoxName);
    myCompany = currentCompany.get('company');
    selectedCompanyId = myCompany!.companyId;
    return myCompany;
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
      state = ErrorHandler.handleError<List<CompanyModel>>(e);
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
