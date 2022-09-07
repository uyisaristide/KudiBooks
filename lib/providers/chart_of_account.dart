import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../dio_services.dart';
import '../handle/error_handler.dart';
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
      var infoDio = ErrorHandler.handleError<List<AccountChartModel>>(e);
      state=infoDio;
    } catch (e) {
      var errorInfo = NetworkInfo<List<AccountChartModel>>(networkStatus: NetworkStatus.error);
      errorInfo.errorMessage = "Contact admin";
      state=errorInfo;
    }
  }

  Future<NetworkInfo> registerChart(ChartAccountModel accountModel) async {
    state = NetworkInfo(networkStatus: NetworkStatus.loading);
    try {
      Map<String, dynamic> chartHeader = {
        "Content-type": "application/json",
        "Authorization": "Bearer ${Hive.box('tokens').get('token')}",
        "companyID": 29
        // "companyID": '${Hive.box('company').get('companyId')}'
      };
      debugPrint('${Hive.box('company').get('companyId')}');
      Response response = await _dio.post("${DioServices.baseUrl}app/chart",
          options: Options(headers: chartHeader), data: accountModel.toJson());
      var info = NetworkInfo<List<AccountChartModel>>( networkStatus: NetworkStatus.success, statusCode: 200 );
      state = info;
      return info;

    } on DioError catch (e) {
      var errorInfo = ErrorHandler.handleError<List<AccountChartModel>>(e);
      state = errorInfo;
      return errorInfo;
    } catch (e) {
      var errorInfo = NetworkInfo<List<AccountChartModel>>(errorMessage: "Contact system admin");
      state = errorInfo;
      return errorInfo;
    }
  }

  Future<NetworkInfo> updateChartAccount( {required ChartAccountModel chartAccountModel, required int id}) async {
    try {
      state=NetworkInfo(networkStatus: NetworkStatus.loading)..data=state.data;
      Map<String, dynamic> editChart = {
        "Content-type": "application/json",
        "Authorization": "Bearer ${Hive.box('tokens').get('token')}",
        "companyID": 29
        // "companyID": '${Hive.box('company').get('companyId')}'
      };
      debugPrint("${chartAccountModel.toJson()}");
      Response response = await _dio.put(
          '${DioServices.baseUrl}app/chart/update/$id',
          data: chartAccountModel.toJson(),
          options: Options(headers: editChart));
      debugPrint("On update error: ${response.data}");
      var info = NetworkInfo<List<AccountChartModel>>(networkStatus: NetworkStatus.success, statusCode: 200);
      state=info;
      return info;
    }   on DioError catch (e) {
      var errorInfo=ErrorHandler.handleError<List<AccountChartModel>>(e);
      state=errorInfo;
      return errorInfo;
    } catch (e) {
      NetworkInfo<List<ChartAccountModel>> infoError = NetworkInfo(networkStatus: NetworkStatus.error);
      infoError.errorMessage = "Contact admin";
      return infoError;
    }
  }
  addNewChart(ChartAccountModel chartModel) {}
}
