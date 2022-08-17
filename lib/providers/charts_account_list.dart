import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:kudibooks_app/dio_services.dart';
import 'package:kudibooks_app/models/chart_accounts.dart';

class AllChartAccountsProvider extends StateNotifier<List<Accounts>> {
  AllChartAccountsProvider() : super([]);
  final _dio = Dio();

  Future<List<Accounts>> chartRetrieve() async {
    try {
      Map<String, dynamic> chartHeader = {
        "Content-type": "application/json",
        "Authorization": "Bearer ${Hive.box('tokens').get('token')}",
        "companyID": 29
      };
      Response response = await _dio.get("${DioServices.baseUrl}app/chart",
          options: Options(headers: chartHeader));
      var data = ChartAccount.fromJson(response.data);
      List<Accounts> allChartAccounts = [];
      // allChartAccounts = data.accounts.map((e) => Accounts.fromJson(e)).toList();
      for (var chart in data.accounts) {
        allChartAccounts.add(chart);
      }
      debugPrint("${allChartAccounts.length}");
      return allChartAccounts;
    } catch (e) {
      if (e is DioError) {
        debugPrint("${e.response?.data['error']}");
        throw e.response?.data['error'] ?? e.error;
      } else {
        throw Exception(e);
      }
    }
  }

  Future removeChart(int chartId) async {
    debugPrint("This is id: $chartId");
    try {
      Map<String, dynamic> chartHeaders = {
        "Content-type": "application/json",
        "Authorization": "Bearer ${Hive.box('tokens').get('token')}",
        "companyID": 29
      };
      Response response = await _dio.delete(
          '${DioServices.baseUrl}app/chart/delete/$chartId}',
          options: Options(headers: chartHeaders));
      if (response.statusCode == 200) {
        return 'success';
      } else {
        return 'fail';
      }
    } catch (e) {
      if (e is DioError) {
        throw e.response?.data["error"] ?? e.response?.data["message"];
      } else {
        throw Exception(e);
      }
    }
  }
}
