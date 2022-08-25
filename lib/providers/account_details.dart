import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../dio_services.dart';
import '../models/account_details_model.dart';
import '../models/utilities/network_info.dart';

class AccountDetailsNotifier
    extends StateNotifier<NetworkInfo<AccountDetailsModel?>> {
  AccountDetailsNotifier() : super(NetworkInfo());
  final _dio = Dio();

  accountDetailsData(int? id) async {
    state = NetworkInfo(networkStatus: NetworkStatus.loading);
    try {
      Map<String, dynamic> chartHeader = {
        "Content-type": "application/json",
        "Authorization": "Bearer ${Hive.box('tokens').get('token')}",
        "companyID": '${Hive.box('company').get('companyId')}',
      };

      Response response = await _dio.get(
          '${DioServices.baseUrl}app/chart/edit/$id',
          options: Options(headers: chartHeader));

      var accountDetails = AccountDetailsModel.fromJson(response.data);
      state = NetworkInfo(
          data: accountDetails,
          networkStatus: NetworkStatus.success,
          statusCode: 200);
    } on DioError catch (e) {
      NetworkInfo<AccountDetailsModel?> info =
          NetworkInfo(networkStatus: NetworkStatus.failed);
      switch (e.type) {
        case DioErrorType.connectTimeout:
          info.errorMessage = 'Can not reach to server';
          break;
        case DioErrorType.sendTimeout:
          info.errorMessage = "Poor connection";
          break;
        case DioErrorType.receiveTimeout:
          // TODO: Handle this case.
          info.errorMessage = "Poor connection";
          break;
        case DioErrorType.response:
          // TODO: Handle this case.
          info = NetworkInfo<AccountDetailsModel?>.errors(
              e.response?.data ?? {},
              statusCode: e.response?.statusCode,
              status: NetworkStatus.error);
          break;
        case DioErrorType.cancel:
          // TODO: Handle this case.
          break;
        case DioErrorType.other:
          // TODO: Handle this case.
          break;
      }
    } catch (e) {}
  }
}
