import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kudibooks_app/dio_services.dart';
import 'package:kudibooks_app/models/company_model.dart';

class CompanyProvider extends StateNotifier<List<Company>> {
  CompanyProvider() : super([]);
  final Dio _dio = Dio();

  Future<String?> createCompany(Company company) async {
    try {
      var response = await _dio.post("${DioServices.baseUrl}app/company",
          data: company.toJson(),
          options: Options(headers: DioServices.mainHeader));
      if (response.statusCode == 200) {
        debugPrint("${response.data['message']}");
        return response.data['message'];
      } else {
        debugPrint(
            "This is the error: ${response.statusCode} ${response.statusMessage}");
      }
    } catch (e) {
      if (e is DioError) {
        //This is the custom message coming from the backend
        throw e.response?.data['errors'][0] ?? "Error";
      } else {
        throw Exception("Error");
      }
    }
  }
}
