import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../../dio_services.dart';
import '../../handle/error_handler.dart';
import '../../models/product/unit_measure.dart';
import '../../models/utilities/network_info.dart';

class UnitMeasureNotifier extends StateNotifier<NetworkInfo<List<UnitsOfMeasureModel>>>{
  UnitMeasureNotifier() : super(NetworkInfo());
  final _dio = Dio();
  allMeasure() async{
    state=NetworkInfo(networkStatus: NetworkStatus.loading);
    try{
      Map<String, dynamic> mainHeader = {
        "Content-type": "application/json",
        "Authorization": "Bearer ${Hive.box('tokens').get('token')}",
        "companyID": 29
      };
      Response response = await _dio.get('${DioServices.baseUrl}app/unit-of-measure', options: Options(headers: mainHeader));

      List<UnitsOfMeasureModel> listMeasures = [];
      var unitMeasuresList = MeasureModel.fromJson(response.data);
      for(var productMeasures in unitMeasuresList.unitsOfMeasure){
        listMeasures.add(productMeasures);
      }

      debugPrint("fsdaf ${response.data}");

      var info =  NetworkInfo<List<UnitsOfMeasureModel>>(networkStatus: NetworkStatus.success, data: listMeasures, statusCode: 200);

      state=info;
    } on DioError catch(e){
      var errorInfo = ErrorHandler.handleError<List<UnitsOfMeasureModel>>(e);
      state=errorInfo;
    } catch (e){
      var unknownError = NetworkInfo<List<UnitsOfMeasureModel>>(networkStatus: NetworkStatus.error, errorMessage: "Contact system admin");
      state=unknownError;
    }
  }
  Future<NetworkInfo> createMeasure(UnitsOfMeasureModel unitsOfMeasureModel) async{
    state=NetworkInfo(networkStatus: NetworkStatus.loading);
    try{
      Map<String, dynamic> mainHeader = {
        "Content-type": "application/json",
        "Authorization": "Bearer ${Hive.box('tokens').get('token')}",
        "companyID": 29
      };
      var unitMeasures = unitsOfMeasureModel.toJson();
      Response response = await _dio.post('${DioServices.baseUrl}app/unit-of-measure',data: unitMeasures, options: Options(headers: mainHeader));
      var info =  NetworkInfo<List<UnitsOfMeasureModel>>(networkStatus: NetworkStatus.success, statusCode: 200);
      state=info;
      return info;
    } on DioError catch(e){
      var errorInfo = ErrorHandler.handleError<List<UnitsOfMeasureModel>>(e);
      state=errorInfo;
      return errorInfo;
    } catch (e){
      var unknownError = NetworkInfo<List<UnitsOfMeasureModel>>(networkStatus: NetworkStatus.error, errorMessage: "Contact system admin");
      state=unknownError;
      return unknownError;
    }
  }
  Future<NetworkInfo> removeMeasure(int id) async{
    state=NetworkInfo(networkStatus: NetworkStatus.loading);
    try{
      Map<String, dynamic> mainHeader = {
        "Content-type": "application/json",
        "Authorization": "Bearer ${Hive.box('tokens').get('token')}",
        "companyID": 29
      };
      Response response = await _dio.delete("${DioServices.baseUrl}app/unit-of-measure/delete/$id", options: Options(headers: mainHeader));
      var info = NetworkInfo<List<UnitsOfMeasureModel>>(networkStatus: NetworkStatus.success, statusCode: 200);
      state=info;
      return info;
    }  on DioError catch(e){
      var errorInfo = ErrorHandler.handleError<List<UnitsOfMeasureModel>>(e);
      state=errorInfo;
      return errorInfo;
    } catch (e){
      var unknownError = NetworkInfo<List<UnitsOfMeasureModel>>(networkStatus: NetworkStatus.error, errorMessage: "Contact system admin");
      state=unknownError;
      return unknownError;
    }
  }
}