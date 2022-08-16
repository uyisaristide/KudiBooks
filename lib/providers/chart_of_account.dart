import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kudibooks_app/dio_services.dart';
import 'package:kudibooks_app/models/account_type.dart';
import 'package:kudibooks_app/models/chart_of_account_model.dart';

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
        chartAccountList.forEach((element) {
          AccountChartModel.fromJson(element);
        });
        List<AccountChartModel> data=[];
        for(var d in chartAccountList){
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

  // datas(){
  //   chartAccountList.forEach((element) {
  //     debugPrint("${element}");
  //   });
  // }

  addNewChart(ChartAccountModel chartModel) {}
}
