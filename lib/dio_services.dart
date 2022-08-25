import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class DioServices {
  Dio dioInstance = Dio();
  static const baseUrl = "http://68.183.25.174/api/mobile/";
  static Map<String, String> mainHeader = {
    "Content-type": "application/json",
    "Authorization": "Bearer ${Hive.box('tokens').get('token')}"
  };

  DioServices() {
    dioInstance.interceptors
        .add(InterceptorsWrapper(onError: (options, errors) {
      print(options.error);
    }, onRequest: (options, request) {
      print(options.data);
    }, onResponse: (options, response) {
      print(options.statusMessage);
    }));
  }
}
