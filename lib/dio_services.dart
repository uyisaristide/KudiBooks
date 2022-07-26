import 'package:dio/dio.dart';

class DioServices {
  Dio dioInstance = Dio();
  static const baseUrl = "http://68.183.25.174/api/mobile/";

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
