import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dio_services.dart';
import '../../models/company_model.dart';
import '../../models/utilities/network_info.dart';
import '../all_providers_list.dart';

class CompanyListNotifier
    extends StateNotifier<NetworkInfo<List<CompanyModel>>> {
  CompanyListNotifier() : super(NetworkInfo());

  // Ref ref;
  final Dio _dio = Dio();

  tokenMainHeader(token) {
    Map<String, String> mainHeader = {
      "Content-type": "application/json",
      "Authorization": "Bearer $token"
    };
    return mainHeader;
  }

  Future<NetworkInfo<List<CompanyModel>>> getCompaniesList(token) async {
    state = NetworkInfo(networkStatus: NetworkStatus.loading)
      ..data = state.data;
    try {
      // Map<String, String> mainHeader = {
      //   "Content-type": "application/json",
      //   "Authorization": "Bearer $myToken"
      // };
      Response companiesListResponse = await _dio.get(
          '${DioServices.baseUrl}app/company',
          options: Options(headers: tokenMainHeader(token)));

      var companiesList = CompaniesList.fromJson(companiesListResponse.data);
      debugPrint("gjgjg ${companiesList.companies.length}");

      var data = companiesList.companies;

      var info = NetworkInfo<List<CompanyModel>>(
          statusCode: 200, networkStatus: NetworkStatus.success, data: data);
      // await ref.read(companyProvider.notifier).getCompanyFromHive();
      state = info;

      return info;
    } on DioError catch (e) {
      NetworkInfo<List<CompanyModel>> info =
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
          info = NetworkInfo<List<CompanyModel>>.errors(e.response?.data ?? {},
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
      return info;
    } catch (e) {
      NetworkInfo<List<CompanyModel>> info = NetworkInfo();
      info.errorMessage = "$e";
      return info;
    }
  }
}
