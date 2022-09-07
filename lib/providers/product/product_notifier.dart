import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../../dio_services.dart';
import '../../handle/error_handler.dart';
import '../../models/product/product_sell_model.dart';
import '../../models/product/retrive_product_model.dart';
import '../../models/utilities/network_info.dart';

class ProductNotifier extends StateNotifier<NetworkInfo<List<ProductSellModel>>>{
  ProductNotifier() : super(NetworkInfo());
  final _dio = Dio();

  Map<String, dynamic> mainHeader = {
    "Content-type": "application/json",
    "Authorization": "Bearer ${Hive.box('tokens').get('token')}",
    "companyID": 29
  };

  Future<NetworkInfo> createProduct(ProductSellModel productSellModel) async{
    state=NetworkInfo(networkStatus: NetworkStatus.loading);
    try{

      var dataProduct = productSellModel.toJson();
      debugPrint("Sent product Data: ${jsonEncode(dataProduct)}");
      Response response = await _dio.post("${DioServices.baseUrl}app/product-to-sell", data: dataProduct, options: Options(headers: mainHeader));
      var info = NetworkInfo<List<ProductSellModel>>(networkStatus: NetworkStatus.success, statusCode: 200);
      state=info;
      return info;

    } on DioError catch(e){
      debugPrint("${e.response?.statusMessage}");
      var errorInfo = ErrorHandler.handleError<List<ProductSellModel>>(e);
      state=errorInfo;
      return errorInfo;

    } catch(e){
      debugPrint("$e");
      var unknownError = NetworkInfo<List<ProductSellModel>>(networkStatus: NetworkStatus.error, errorMessage: "Contact system admin");
      state=unknownError;
      return unknownError;

    }
  }
  Future<NetworkInfo> createProductSecond(ProductSellModel productSellModel) async{
    state=NetworkInfo(networkStatus: NetworkStatus.loading);
    try{

      var dataProduct = productSellModel.toJsonNotInventory();
      debugPrint("Sent product Data: ${jsonEncode(dataProduct)}");
      Response response = await _dio.post("${DioServices.baseUrl}app/product-to-sell", data: dataProduct, options: Options(headers: mainHeader));
      var info = NetworkInfo<List<ProductSellModel>>(networkStatus: NetworkStatus.success, statusCode: 200);
      state=info;
      return info;

    } on DioError catch(e){
      debugPrint("${e.response?.statusMessage}");
      var errorInfo = ErrorHandler.handleError<List<ProductSellModel>>(e);
      state=errorInfo;
      return errorInfo;

    } catch(e){
      debugPrint("$e");
      var unknownError = NetworkInfo<List<ProductSellModel>>(networkStatus: NetworkStatus.error, errorMessage: "Contact system admin");
      state=unknownError;
      return unknownError;

    }
  }
}