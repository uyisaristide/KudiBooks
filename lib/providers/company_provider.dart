import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../dio_services.dart';
import '../handle/error_handler.dart';
import '../models/company_model.dart';
import '../models/utilities/network_info.dart';

class CompanyProvider extends StateNotifier<NetworkInfo<List<Company>>> {
  CompanyProvider() : super(NetworkInfo());
  final Dio _dio = Dio();

  Future<NetworkInfo> createCompany(Company company) async {
    state = NetworkInfo(networkStatus: NetworkStatus.loading);
    try {
      debugPrint("${company.toJson()}");
      var response = await _dio.post("${DioServices.baseUrl}app/company",
          data: company.toJson(),
          options: Options(headers: DioServices.mainHeader));
      await Hive.openBox('company');
      await Hive.box('company').put('companyId', '${response.data['companyID']}');
      debugPrint("${Hive.box('company').get('companyId')}");
      var info = NetworkInfo<List<Company>>(networkStatus: NetworkStatus.success, statusCode: 200);
      return info;
    } on DioError catch(e){
      state = ErrorHandler.handleError<List<Company>>(e);
      return state;
    }
    catch (e) {
      var info = NetworkInfo<List<Company>>(networkStatus: NetworkStatus.error);
      return info;
    }
  }
  allCompanies() async{
    Response response = await _dio.get('${DioServices.baseUrl}app/company', options: Options(headers: DioServices.mainHeader));

  }
}
