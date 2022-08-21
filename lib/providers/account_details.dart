import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../dio_services.dart';
import '../models/account_details_model.dart';

class AccountDetailsNotifier extends StateNotifier<AccountDetailsModel?> {
  AccountDetailsNotifier() : super(null);
  final _dio = Dio();
  Future<AccountDetailsModel?> accountDetailsData(int? id) async {
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
        state = accountDetails;
    } catch (e) {
      if (e is DioError) {
        throw e.response?.data["message"] ?? e.response?.statusCode;
      } else {
        throw Exception(e);
      }
    }
  }
}
