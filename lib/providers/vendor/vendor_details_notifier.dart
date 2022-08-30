import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../../dio_services.dart';
import '../../handle/error_handler.dart';
import '../../models/utilities/network_info.dart';
import '../../models/vendor_model.dart';

class VendorDetailsNotifier extends StateNotifier<NetworkInfo<VendorModel>> {
  VendorDetailsNotifier() : super(NetworkInfo());
  final _dio = Dio();

  vendorDetails(int id) async {
    debugPrint("$id");
    state = NetworkInfo(networkStatus: NetworkStatus.loading);
    try {
      Map<String, dynamic> mainHeader = {
        "Content-type": "application/json",
        "Authorization": "Bearer ${Hive.box('tokens').get('token')}",
        "companyID": 29
      };
      Response response = await _dio.get(
          '${DioServices.baseUrl}app/client/edit/$id',
          options: Options(headers: mainHeader));
      debugPrint("in function: ${response.data}");
      var client = VendorModel.fromJson(response.data);

      state = NetworkInfo<VendorModel>(
          networkStatus: NetworkStatus.success, statusCode: 200, data: client);
    } on DioError catch (e) {

      var erroInfo = ErrorHandler.handleError<VendorModel>(e);
      state = erroInfo;
    } catch (e) {
      var unknownInfo = NetworkInfo<VendorModel>(
          networkStatus: NetworkStatus.error,
          errorMessage: "Contact system admin");
      state = unknownInfo;
    }
  }
}
