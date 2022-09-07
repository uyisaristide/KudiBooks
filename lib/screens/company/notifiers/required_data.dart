import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../dio_services.dart';
import '../../../models/utilities/network_info.dart';
import '../../../providers/user_provider.dart';
import '../models/required_data.dart';

class RequireDataNotifier
    extends StateNotifier<NetworkInfo<CompanyRequiredData>> {
  RequireDataNotifier() : super(NetworkInfo());
  final Dio _dio = Dio();

  List<String> plansList = [];
  List<String> countriesList = [];
  List<String> currencies = [];
  List<String> industries = [];

  Future getRequiredData() async {
    state = NetworkInfo(networkStatus: NetworkStatus.loading)
      ..data = state.data;
    try {
      Map<String, String> mainHeader = {
        "Content-type": "application/json",
        "Authorization": "Bearer $myToken"
      };

      print('header ${mainHeader}');
      Response ResposeOfRequiredData = await _dio.get(
          '${DioServices.baseUrl}app/company/required',
          options: Options(headers: mainHeader));

      var requiredDatas =
          CompanyRequiredData.fromJson(ResposeOfRequiredData.data);

      var countries = requiredDatas.countries;

      for (var country in countries) {
        if (countriesList.contains(country.name)) {
        } else {
          countriesList.add(country.name);
        }
      }

      // print(countriesList.length);
      var currenciesList = requiredDatas.currencies;
      for (var currency in currenciesList) {
        if (currencies.contains(currency.name)) {
        } else {
          currencies.add(currency.name);
        }
      }

      var plans = requiredDatas.plans;
      for (var plan in plans) {
        if (plansList.contains(plan.name)) {
        } else {
          plansList.add(plan.name);
        }
      }
      var industriesList = requiredDatas.industries;

      for (var industry in industriesList) {
        if (industries.contains(industry.name)) {
        } else {
          industries.add(industry.name);
        }
      }

      var info = NetworkInfo<CompanyRequiredData>(
          statusCode: 200,
          networkStatus: NetworkStatus.success,
          data: requiredDatas);

      // print(info.data);
      state = info;
    } on DioError catch (e) {
      NetworkInfo<CompanyRequiredData> info =
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
          info = NetworkInfo<CompanyRequiredData>.errors(e.response?.data ?? {},
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
      NetworkInfo<CompanyRequiredData> info = NetworkInfo();
      info.errorMessage = "";
    }
  }
}
