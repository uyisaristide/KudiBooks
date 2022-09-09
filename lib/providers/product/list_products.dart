import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../../dio_services.dart';
import '../../handle/error_handler.dart';
import '../../models/product/retrive_product_model.dart';
import '../../models/utilities/network_info.dart';
import '../company_notifier.dart';
import '../user_provider.dart';

class RetrieveProductNotifier extends StateNotifier<NetworkInfo<List<RetrieveProductModel>>>{
  RetrieveProductNotifier() : super(NetworkInfo());
  final _dio = Dio();


  Map<String, dynamic> mainHeader = {
    "Content-type": "application/json",
    "Authorization": "Bearer $myToken",
    "companyID": selectedCompanyId
  };

  allProducts() async{
    state=NetworkInfo(networkStatus: NetworkStatus.loading);
    try{
      Response response = await _dio.get('${DioServices.baseUrl}app/product-to-sell', options: Options(headers: mainHeader));
      var productListData = ProductList.fromJson(response.data);
      List<RetrieveProductModel> allProductsToSell = [];
      for(var productItem in productListData.items??[]){
        allProductsToSell.add(productItem);
      }
      debugPrint("This is product list: ${productListData.items?.length}");
      var info = NetworkInfo<List<RetrieveProductModel>>(networkStatus: NetworkStatus.success, statusCode: 200, data: allProductsToSell);
      state=info;
    } on DioError catch(e){
      debugPrint("${e.response?.statusMessage}");
      var errorInfo = ErrorHandler.handleError<List<RetrieveProductModel>>(e);
      state=errorInfo;
      return errorInfo;

    } catch(e){
      debugPrint("in unknown: $e");
      var unknownError = NetworkInfo<List<RetrieveProductModel>>(networkStatus: NetworkStatus.error, errorMessage: "Contact system admin");
      state=unknownError;
      return unknownError;
    }
  }

}