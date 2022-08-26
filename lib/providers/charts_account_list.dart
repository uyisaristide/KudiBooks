
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../dio_services.dart';
import '../handle/error_handler.dart';
import '../models/chart_accounts.dart';
import '../models/utilities/network_info.dart';

class AllChartAccountsProvider extends StateNotifier<NetworkInfo<List<Accounts>>> {
  AllChartAccountsProvider() : super(NetworkInfo());
  final _dio = Dio();

  chartRetrieve() async {

    state = NetworkInfo(networkStatus: NetworkStatus.loading);
    try {
      Map<String, dynamic> chartHeader = {
        "Content-type": "application/json",
        "Authorization": "Bearer ${Hive.box('tokens').get('token')}",
        "companyID": 29
        // "companyID": '${Hive.box('company').get('companyId')}'
      };
      debugPrint('${Hive.box('company').get('companyId')}');
      Response response = await _dio.get("${DioServices.baseUrl}app/chart",
          options: Options(headers: chartHeader));
      var data = ChartAccount.fromJson(response.data);
      List<Accounts> allChartAccounts = [];
      // allChartAccounts = data.accounts.map((e) => Accounts.fromJson(e)).toList();
      for (var chart in data.accounts) {
        allChartAccounts.add(chart);
      }

      var info = NetworkInfo<List<Accounts>>(
          data: allChartAccounts,
          networkStatus: NetworkStatus.success,
          statusCode: 200);
      state = info;
    } on DioError catch (e) {
      state = ErrorHandler.handleError<List<Accounts>>(e);
    } catch (e) {
      NetworkInfo<List<Accounts>> info = NetworkInfo(networkStatus: NetworkStatus.error);
      info.errorMessage = "Not found! contact admin";
      state=info;
    }
  }

  Future<NetworkInfo> removeChart(int chartId) async {
    try {
      Map<String, dynamic> chartHeaders = {
        "Content-type": "application/json",
        "Authorization": "Bearer ${Hive.box('tokens').get('token')}",
        "companyID": 29
        // "companyID": '${Hive.box('company').get('companyId')}'
      };
      debugPrint('${Hive.box('company').get('companyId')}');
      Response response = await _dio.delete(
          '${DioServices.baseUrl}app/chart/delete/$chartId}',
          options: Options(headers: chartHeaders));
       var removeInfo = NetworkInfo<List<Accounts>>(networkStatus: NetworkStatus.success, statusCode: 200);
      // state = removeInfo;
      return removeInfo;
    }  on DioError catch (e) {
      var info = ErrorHandler.handleError<List<Accounts>>(e);
      state=info;
      return info;
    } catch (e) {
      NetworkInfo<List<Accounts>> info = NetworkInfo();
      info.errorMessage = "Contact system admin";
      return info;
    }
  }

}
