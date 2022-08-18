import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../dio_services.dart';
import '../models/account_type.dart';
import '../models/chart_of_account_model.dart';

class ChartAccountProvider extends StateNotifier<List<AccountChartModel>> {
  ChartAccountProvider() : super([]);
  final _dio = Dio();
  List chartAccountList = [];

  Future<List<AccountChartModel>> listOfCharts() async {
    try {
      Response response = await _dio.get(
          '${DioServices.baseUrl}app/chart/required',
          options: Options(headers: DioServices.mainHeader));

      chartAccountList = response.data;
      //List<AccountChartModel> data = chartAccountList.map((e) => AccountChartModel.fromJson(e)).toList();
      for (var element in chartAccountList) {
        AccountChartModel.fromJson(element);
      }
      List<AccountChartModel> data = [];
      for (var d in chartAccountList) {
        data.add(AccountChartModel.fromJson(d));
      }
      return data;
    } catch (e) {
      if (e is DioError) {
        // debugPrint(" Some test sum data: ${e.response?.data["message"]}");
        throw e.response?.data["errors"] ?? e;
      } else {
        throw Exception(e);
      }
    }
  }

  Future accountDetails(int id) async {
    try {
      Map<String, dynamic> chartHeader = {
        "Content-type": "application/json",
        "Authorization": "Bearer ${Hive.box('tokens').get('token')}",
        "companyID": 29,
      };
      Response response = await _dio.get(
          '${DioServices.baseUrl}api/mobile/app/chart/edit/$id',
          options: Options(headers: chartHeader));
      if (response.statusCode == 200) {
        debugPrint("${response.data}");
        return response.data;
      }
    } catch (e) {
      if (e is DioError) {
        throw e.response?.data["error"] ?? e.response?.statusMessage;
      } else {
        throw Exception(e);
      }
    }
  }

  Future registerChart(ChartAccountModel accountModel) async {
    try {
      Map<String, dynamic> chartHeader = {
        "Content-type": "application/json",
        "Authorization": "Bearer ${Hive.box('tokens').get('token')}",
        "companyID": 29
      };
      Response response = await _dio.post("${DioServices.baseUrl}app/chart",
          options: Options(headers: chartHeader), data: accountModel.toJson());
      if (response.statusCode == 200) {
        debugPrint("${response.data}");
        return 'success';
      }
    } catch (e) {
      if (e is DioError) {
        throw e.response?.data;
      } else {
        throw Exception(e);
      }
    }
  }

  // datas(){
  //   chartAccountList.forEach((element) {
  //     debugPrint("${element}");
  //   });
  // }

  addNewChart(ChartAccountModel chartModel) {}
}
