import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../dio_services.dart';
import '../handle/error_handler.dart';
import '../models/client_model.dart';
import '../models/utilities/network_info.dart';

class ClientNotifier extends StateNotifier<NetworkInfo<List<ClientModel>>> {
  ClientNotifier() : super(NetworkInfo());
  final _dio = Dio();
  //
  // addClient(ClientModel clientModel) {
  //   state = [...state, clientModel];
  // }

  Future<NetworkInfo> registerClient(ClientModel client) async {
    state=NetworkInfo(networkStatus: NetworkStatus.loading);
    try {
      Map<String, dynamic> newClientHeader = {
        "Authorization": "Bearer  ${Hive.box('tokens').get('token')}",
        "companyID": 29
      };
      var responses = await _dio.post("${DioServices.baseUrl}app/client",
          data: client.clientToJson(),
          options: Options(headers: newClientHeader));

      var clients = NetworkInfo<List<ClientModel>>(networkStatus: NetworkStatus.success, statusCode: 200);
      state=clients;
      return clients;
    } on DioError catch(e){
      var errorInfo = ErrorHandler.handleError<List<ClientModel>>(e);
      state=errorInfo;
      return errorInfo;
    } catch (e) {
      NetworkInfo<List<ClientModel>> info = NetworkInfo();
      info.errorMessage = "Contact system admin";
      return info;
    }
  }

  Future<NetworkInfo> removeClient(int? id) async{
    state=NetworkInfo(networkStatus: NetworkStatus.loading);
    try{
      Map<String, dynamic> chartHeaders = {
        "Content-type": "application/json",
        "Authorization": "Bearer ${Hive.box('tokens').get('token')}",
        "companyID": 29
      };
      Response response = await _dio.delete('${DioServices.baseUrl}app/client/delete/$id', options: Options(headers: chartHeaders));
      var info = NetworkInfo<List<ClientModel>>(networkStatus: NetworkStatus.success, statusCode: 200);
      state=info;
      return info;
    } on DioError catch(e){
      var errorInfo = ErrorHandler.handleError<List<ClientModel>>(e);
      state=errorInfo;
      return errorInfo;
    } catch(e){
      var networkInfo = NetworkInfo(networkStatus: NetworkStatus.error);
      networkInfo.errorMessage = "Contact admin";
      return networkInfo;
    }
  }

}
