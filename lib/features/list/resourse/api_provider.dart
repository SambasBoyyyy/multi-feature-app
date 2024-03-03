import 'package:dio/dio.dart';
import 'package:multi_feature_app/features/list/model/list_model.dart';

class ApiProvider{
  Dio dio = Dio();
  final String _url = "http://sherpur.rbfgroupbd.com/get_notification?page=1&pageSize=10";
  final token="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzA5NDYwMDE3LCJleHAiOjE3MDk1NDY0MTd9.xJp9TbsSTX-PJtxNSLqDUGLfN_HMPWP6OTKgYVVOpLc";

  Future<List<ListModel>> fetchList() async {
    try{
      Response response = await dio.get(_url);
      dio.options.headers['Authorization'] = 'Bearer $token';
      List<dynamic> value = response.data;
      return value.map((e) => ListModel.fromJson(e)).toList();
    }
    catch(e){
      print(e);
      rethrow;
    }
  }
}