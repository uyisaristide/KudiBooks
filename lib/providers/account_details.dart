import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../dio_services.dart';
import '../models/account_details_model.dart';
import '../models/utilities/network_info.dart';

class AccountDetailsNotifier extends StateNotifier<NetworkInfo<AccountDetailsModel?>> {
  AccountDetailsNotifier() : super(NetworkInfo());
  final _dio = Dio();
  accountDetailsData(int? id) async {
    state = NetworkInfo(networkStatus: NetworkStatus.loading);
    try {
      debugPrint("This is id account: $id");
      Map<String, dynamic> chartHeader = {
        "Content-type": "application/json",
        "Authorization": "Bearer ${Hive.box('tokens').get('token')}",
        "companyID": 29,
      };
      Response response = await _dio.get(
          '${DioServices.baseUrl}app/chart/edit/$id',
          options: Options(headers: chartHeader));
        var accountDetails = AccountDetailsModel.fromJson(response.data);
        // debugPrint("Some data: ${accountDetailsModel.accountDetails.note}");
        state = NetworkInfo(data: accountDetails);
    } on DioError catch (e) {

    } catch(e){

    }
  }
}
