import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../../dio_services.dart';
import '../../handle/error_handler.dart';
import '../../models/product/unit_measure.dart';
import '../../models/utilities/network_info.dart';

class UnitMeasure extends StateNotifier<NetworkInfo<UnitsOfMeasureModel>>{
  UnitMeasure(NetworkInfo state) : super(NetworkInfo());
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
      var unitMeasures = UnitsOfMeasureModel.fromJson(response.data);
      var info =  NetworkInfo<UnitsOfMeasureModel>(networkStatus: NetworkStatus.success, data: unitMeasures, statusCode: 200);
      state=info;
    } on DioError catch(e){
      var errorInfo = ErrorHandler.handleError<UnitsOfMeasureModel>(e);
      state=errorInfo;
    } catch (e){
      var unknownError = NetworkInfo<UnitsOfMeasureModel>(networkStatus: NetworkStatus.error, errorMessage: "Contact system admin");
      state=unknownError;
    }
  }
}