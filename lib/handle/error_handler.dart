import 'package:dio/dio.dart';
import '../models/utilities/network_info.dart';

class ErrorHandler{
  static NetworkInfo<T> handleError<T>(DioError e){
    NetworkInfo<T> info = NetworkInfo<T>(networkStatus: NetworkStatus.failed);
    switch (e.type) {
      case DioErrorType.connectTimeout:
      // TODO: Handle this case.
        info.errorMessage = "Connection error, check your internet";
        break;
      case DioErrorType.sendTimeout:
      // TODO: Handle this case.
        info.errorMessage = "Check connection, before send data";
        break;
      case DioErrorType.receiveTimeout:
      // TODO: Handle this case.
        info.errorMessage = "Slow network";
        break;
      case DioErrorType.response:
      // TODO: Handle this case.
        info = NetworkInfo<T>.errors(e.response?.data ?? {},
            statusCode: e.response!.statusCode, status: NetworkStatus.error);
        break;
      case DioErrorType.cancel:
      // TODO: Handle this case.
        info = NetworkInfo(errorMessage: "Reconnect your internet");
        break;
      case DioErrorType.other:
      // TODO: Handle this case.
        info = NetworkInfo(errorMessage: "Check your internet");
        break;
    }
    print("in handle: ${info.networkStatus}");
    print("in handle: ${info.getErrorMessage}");
    return info;
  }
}