import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../dio_services.dart';
import '../models/account_type.dart';
import '../models/chart_of_account_model.dart';
import '../models/utilities/network_info.dart';

class ChartAccountProvider
    extends StateNotifier<NetworkInfo<List<AccountChartModel>>> {
  ChartAccountProvider() : super(NetworkInfo());
  final _dio = Dio();
  List chartAccountList = [];

  listOfCharts() async {
    state = NetworkInfo(networkStatus: NetworkStatus.loading)..data=state.data;
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
      var info = NetworkInfo<List<AccountChartModel>>( statusCode: 200, networkStatus: NetworkStatus.success, data: data);
      state = info;
    }   on DioError catch (e) {
      NetworkInfo<List<ChartAccountModel>> info =
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
          info = NetworkInfo<List<ChartAccountModel>>.errors(e.response?.data ?? {},
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
      NetworkInfo<List<ChartAccountModel>> info = NetworkInfo();
      info.errorMessage = "";
    }
  }

  Future registerChart(ChartAccountModel accountModel) async {
    state = NetworkInfo(networkStatus: NetworkStatus.loading);
    try {
      Map<String, dynamic> chartHeader = {
        "Content-type": "application/json",
        "Authorization": "Bearer ${Hive.box('tokens').get('token')}",
        "companyID": '${Hive.box('company').get('companyId')}'
      };
      debugPrint('${Hive.box('company').get('companyId')}');
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

  Future updateChartAccount( {required ChartAccountModel chartAccountModel, required int id}) async {
    try {
      state=NetworkInfo(networkStatus: NetworkStatus.loading)..data=state.data;
      Map<String, dynamic> editChart = {
        "Content-type": "application/json",
        "Authorization": "Bearer ${Hive.box('tokens').get('token')}",
        "companyID": '${Hive.box('company').get('companyId')}'
      };

      debugPrint("${chartAccountModel.toJson()}");
      Response response = await _dio.put(
          '${DioServices.baseUrl}app/chart/update/$id',
          data: chartAccountModel.toJson(),
          options: Options(headers: editChart));
      debugPrint("On update error: ${response.data}");
      if(response.statusCode == 200){
        return response.statusCode;
      }else{
        return response.data;
      }
    }   on DioError catch (e) {
      debugPrint("Following is error: ${e.response?.data} ${e.response?.statusCode}");
      NetworkInfo<List<ChartAccountModel>> info =
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
          info = NetworkInfo<List<ChartAccountModel>>.errors(e.response?.data ?? {},
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
      NetworkInfo<List<ChartAccountModel>> info = NetworkInfo();
      info.errorMessage = "";
    }
  }

  addNewChart(ChartAccountModel chartModel) {}
}
