import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../../../../dio_services.dart';
import '../../../../handle/error_handler.dart';
import '../../../../models/utilities/network_info.dart';
import '../../../models/client_models/client_stats.dart';

class ClientStatsNotifier extends StateNotifier<NetworkInfo<ClientStatistics>> {
  ClientStatsNotifier() : super(NetworkInfo());
  final _dio = Dio();

  clientStatistics() async {
    state = NetworkInfo(networkStatus: NetworkStatus.loading);
    try {
      Map<String, dynamic> mainHeaders = {
        "Authorization": "Bearer ${Hive.box('tokens').get('token')}",
        "companyID": 29
      };
      Response response = await _dio.get( "${DioServices.baseUrl}app/client/stats", options: Options(headers: mainHeaders));

      ClientStatistics clientStats = ClientStatistics.fromJson(response.data);
      var clientStatistics = NetworkInfo(networkStatus: NetworkStatus.success, data: clientStats);
      state = clientStatistics;
    } on DioError catch (e) {
      var errorInfo = ErrorHandler.handleError<ClientStatistics>(e);
      state = errorInfo;
    } catch (e) {
      var unknownInfo = NetworkInfo<ClientStatistics>(
          networkStatus: NetworkStatus.error,
          errorMessage: 'Contact system admin');
      state = unknownInfo;
    }
  }
}
