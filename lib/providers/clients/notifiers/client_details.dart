import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../../../../dio_services.dart';
import '../../../../handle/error_handler.dart';
import '../../../models/client_models/client_model.dart';
import '../../../../models/utilities/network_info.dart';

class ClientDetailsNotifier extends StateNotifier<NetworkInfo<ClientModel?>>{
  ClientDetailsNotifier() : super(NetworkInfo());
  final _dio = Dio();
  clientDetails(int id) async{
    state=NetworkInfo(networkStatus: NetworkStatus.loading);
    try{
      Map<String, dynamic> mainHeader = {
        "Content-type": "application/json",
        "Authorization": "Bearer ${Hive.box('tokens').get('token')}",
        "companyID":29
      };
      Response response = await _dio.get('${DioServices.baseUrl}app/client/edit/$id', options: Options(headers: mainHeader));
      var client=ClientModel.fromJson(response.data);
      state=NetworkInfo<ClientModel?>(networkStatus: NetworkStatus.success, statusCode: 200,data: client);
    } on DioError catch(e){
      var erroInfo = ErrorHandler.handleError<ClientModel>(e);
      state=erroInfo;
    } catch(e){
      var unknownInfo = NetworkInfo<ClientModel>(networkStatus: NetworkStatus.error, errorMessage: "Contact system admin");
      state=unknownInfo;
    }
  }
}