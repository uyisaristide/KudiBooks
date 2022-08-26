import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../dio_services.dart';
import '../handle/error_handler.dart';
import '../models/client_list_model.dart';
import '../models/utilities/network_info.dart';

class AllClientsNotifier extends StateNotifier<NetworkInfo<List<Clients>>> {
  AllClientsNotifier() : super(NetworkInfo());
  final _dio = Dio();
  //
  // addClient(ClientModel clientModel) {
  //   state = [...state, clientModel];
  // }

  allClients() async {
    state=NetworkInfo(networkStatus: NetworkStatus.loading)..data=state.data;
    try{
      Map<String, dynamic> mainHeaders = {
        "Authorization": "Bearer ${Hive.box('tokens').get('token')}",
        "companyID":29
      };

      Response response = await _dio.get("${DioServices.baseUrl}app/client", options: Options(headers: mainHeaders));
      var datas = AllClients.fromJson(response.data);
      List<Clients> clientList = [];
      for(var client in datas.clients??[]){
        clientList.add(client);
      }
      var info = NetworkInfo<List<Clients>>(networkStatus: NetworkStatus.success, statusCode: 200, data: clientList);
      state=info;
      return info;
    } on DioError catch(e){
      var errorInfo = ErrorHandler.handleError<List<Clients>>(e);
      state=errorInfo;
    } catch(e){
      debugPrint("${e}");
      NetworkInfo<List<Clients>> info = NetworkInfo(networkStatus: NetworkStatus.error);
      info.errorMessage="Contact system admin";
      state=info;
    }
  }
}
