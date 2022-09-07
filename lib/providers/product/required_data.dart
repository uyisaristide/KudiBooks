import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../../dio_services.dart';
import '../../handle/error_handler.dart';
import '../../models/product/required_data_product.dart';
import '../../models/utilities/network_info.dart';

class ProductRequiredData extends StateNotifier<NetworkInfo<RequiredDataProduct>> {
  ProductRequiredData() : super(NetworkInfo());
  final _dio = Dio();
  productRequiredData() async {
    state = NetworkInfo<RequiredDataProduct>(networkStatus: NetworkStatus.loading);
    try {
      Map<String, dynamic> mainHeader = {
        "Content-type": "application/json",
        "Authorization": "Bearer ${Hive.box('tokens').get('token')}",
        "companyID": 29
      };
      Response response = await _dio.get( '${DioServices.baseUrl}app/product-to-sell/required',options: Options(headers: mainHeader));

      var requiredData = RequiredDataProduct.fromJson(response.data);

      debugPrint("Required data: ${requiredData.inventoryExpenseAccounts.length}");

      var infoData = NetworkInfo<RequiredDataProduct>(networkStatus: NetworkStatus.success, data: requiredData, statusCode: 200);
      state=infoData;
    } on DioError catch (e) {
      var errorInfo = ErrorHandler.handleError<RequiredDataProduct>(e);
      state = errorInfo;
    } catch (e) {
      var unknown = NetworkInfo<RequiredDataProduct>(
          networkStatus: NetworkStatus.error,
          errorMessage: "Contact system admin");
      state = unknown;
    }
  }
}
