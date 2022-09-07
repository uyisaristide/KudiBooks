import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../../dio_services.dart';
import '../../handle/error_handler.dart';
import '../../models/product/item_to_sell_details.dart';
import '../../models/utilities/network_info.dart';

class ProductToSellDetailsNotifier extends StateNotifier<NetworkInfo<ItemToSellDetails>>{
  ProductToSellDetailsNotifier() : super(NetworkInfo());
  final _dio = Dio();

  Map<String, dynamic> mainHeader = {
    "Content-type": "application/json",
    "Authorization": "Bearer ${Hive.box('tokens').get('token')}",
    "companyID": 29
  };

  productItemDetails(int id) async{
    state=NetworkInfo(networkStatus: NetworkStatus.loading);
   try{
     Response response = await _dio.get("${DioServices.baseUrl}app/product-to-sell/edit/$id",options: Options(headers: mainHeader));
     var productDetails = ItemToSellDetails.fromJson(response.data);
     var itemDetails = NetworkInfo<ItemToSellDetails>(networkStatus: NetworkStatus.success, statusCode: 200);
     state=itemDetails;
   }on DioError catch(e){
     debugPrint("${e.response?.statusMessage}");
     var errorInfo = ErrorHandler.handleError<ItemToSellDetails>(e);
     state=errorInfo;
     return errorInfo;

   } catch(e){
     debugPrint("$e");
     var unknownError = NetworkInfo<ItemToSellDetails>(networkStatus: NetworkStatus.error, errorMessage: "Contact system admin");
     state=unknownError;
     return unknownError;
   }
  }
}