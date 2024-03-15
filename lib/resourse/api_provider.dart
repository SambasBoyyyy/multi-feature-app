import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:multi_feature_app/features/list/model/list_model.dart';

class ApiProvider{
  Dio dio = Dio();
  final String _url = "http://sherpur.rbfgroupbd.com/get_notification?page=1&pageSize=10";
  final String token="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzA5NzA3NzAxLCJleHAiOjE3MDk3OTQxMDF9.oejmChsdeISDX2XL1Qy_AiSnDXdaxZWMphD93z4kwsQ";

  Future<List<ListModel>> fetchList() async {
    try{
      dio.options.headers['Authorization'] = 'Bearer $token';
      final  response = (await dio.get(_url)) ;
      List<ListModel> lists = (json.decode(response as String) as List).map((data) => ListModel.fromJson(data)).toList();
      // print(lists[0].data.totalunread);
      return lists;
    }
    catch(e){
      print(e);
      rethrow;
    }
  }
}