import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../dio_services.dart';
import '../models/chart_accounts.dart';
import '../models/utilities/network_info.dart';

class AllChartAccountsProvider
    extends StateNotifier<NetworkInfo<List<Accounts>>> {
  AllChartAccountsProvider() : super(NetworkInfo());
  final _dio = Dio();

  chartRetrieve() async {
    state = NetworkInfo(networkStatus: NetworkStatus.loading);
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

      var info = NetworkInfo<List<Accounts>>(
          data: allChartAccounts,
          networkStatus: NetworkStatus.success,
          statusCode: 200);
      state = info;
    } on DioError catch (e) {
      NetworkInfo<List<Accounts>> info =
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
          info = NetworkInfo<List<Accounts>>.errors(e.response?.data ?? {},
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
      state = info;
    } catch (e) {
      NetworkInfo<List<Accounts>> info = NetworkInfo();
      info.errorMessage = "";
    }
  }

  Future removeChart(int chartId) async {
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
