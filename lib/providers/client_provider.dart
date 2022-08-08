import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kudibooks_app/dio_services.dart';
import 'package:kudibooks_app/models/client_model.dart';
import 'package:kudibooks_app/providers/user_provider.dart';

class ClientNotifier extends StateNotifier<List<ClientModel>> {
  ClientNotifier() : super([]);
  final _dio = Dio();

  addClient(ClientModel clientModel) {
    state = [...state, clientModel];
  }

  Future<Response> registerClient(ClientModel client) async {
    try {
      Map<String, dynamic> newClientHeader = {
        "Authorization": "Bearer $myToken",
        "companyID": 29
      };
      var responses = _dio.post("${DioServices.baseUrl}app/client",
          data: client.clientToJson(),
          options: Options(headers: newClientHeader));
      debugPrint("Client created successfully");
      return responses;
    } catch (e) {
      if (e is DioError) {
        throw e.response?.data['errors'][0] ?? "Error";
      } else {
        throw Exception(e);
      }
    }
  }

  // Future<ClientModel> allClients() async {
  //   Response response;
  //   response = await _dio.get('${DioServices.mainHeader}');
  // }

}
