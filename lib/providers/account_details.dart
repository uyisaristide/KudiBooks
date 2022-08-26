import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../dio_services.dart';
import '../handle/error_handler.dart';
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
        "companyID": 29,
        // "companyID": '${Hive.box('company').get('companyId')}',
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
      state=ErrorHandler.handleError<AccountDetailsModel?>(e);
    } catch (e) {
      var errorInfo = NetworkInfo<AccountDetailsModel?>(networkStatus: NetworkStatus.error,errorMessage: "Contact system admin");
      state=errorInfo;
    }
  }
}
