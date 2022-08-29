import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../../dio_services.dart';
import '../../handle/error_handler.dart';
import '../../models/utilities/network_info.dart';
import '../../models/vendor_model.dart';

class VendorNotifier extends StateNotifier<NetworkInfo<List<VendorModel>>> {
  VendorNotifier() : super(NetworkInfo());
  final _dio = Dio();
  Map<String, dynamic> mainHeader = {
    "Authorization": "Bearer  ${Hive.box('tokens').get('token')}",
    "companyID": 29
  };

  allVendors() async {
    try {
      Response response = await _dio.get('${DioServices.baseUrl}app/vendor',
          options: Options(headers: mainHeader));

      var vendors = AllVendor.fromJson(response.data);
      List<VendorModel> vendorModels = [];
      for(var singleVendor in vendors.vendors??[]){
        vendorModels.add(singleVendor);
      }
      var info = NetworkInfo<List<VendorModel>>(networkStatus: NetworkStatus.success, statusCode: 200, data: vendorModels);
      debugPrint("some data in vendor: ${info.data?.length??'nulling'}");
      state = info;
    } on DioError catch (e) {
      var errorInfo = ErrorHandler.handleError<List<VendorModel>>(e);
      state = errorInfo;
    } catch (e) {
      var unknownError = NetworkInfo<List<VendorModel>>(
          networkStatus: NetworkStatus.error,
          errorMessage: 'Check internet connection');
      state = unknownError;
    }
  }
  Future<NetworkInfo> registerVendor(VendorModel vendorModel) async {
    try {
      Map<String, dynamic> mainHeader = {
        "Authorization": "Bearer  ${Hive.box('tokens').get('token')}",
        "companyID": 29
      };
      Response response = await _dio.post('${DioServices.baseUrl}app/vendor',
          data: vendorModel, options: Options(headers: mainHeader));
      var vandor = vendorModel.vendorToJson();
      var info = NetworkInfo<List<VendorModel>>(
          networkStatus: NetworkStatus.success, statusCode: 200);
      state = info;
      return info;
    } on DioError catch (e) {
      var errorInfo = ErrorHandler.handleError<List<VendorModel>>(e);
      state = errorInfo;
      return errorInfo;
    } catch (e) {
      var errorInfo = NetworkInfo<List<VendorModel>>(errorMessage: "Contact system admin");
      state = errorInfo;
      return errorInfo;
    }
  }
}
