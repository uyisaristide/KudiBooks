enum NetworkStatus { failed, success, completed, error, empty, noOne, loading,}

class NetworkInfo<T> {
  T? data;
  int? statusCode;
  String? errorMessage;
  List<String> errors;
  NetworkStatus networkStatus;

  String get getErrorMessage => errorMessage==null?errors.isNotEmpty?errors[0]:"Message":errorMessage!;

  NetworkInfo(
      {this.data,
      this.statusCode,
      this.errors = const [],
      this.errorMessage,
      this.networkStatus = NetworkStatus.noOne});

  factory NetworkInfo.errors(Map<String, dynamic> jsonData, {T? data,int? statusCode,NetworkStatus status=NetworkStatus.failed}) => NetworkInfo(
      data: data,
      statusCode: statusCode,
      networkStatus:status, errorMessage: jsonData["message"],errors:List<String>.from(jsonData["errors"]) );
}
