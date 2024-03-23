import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:multi_feature_app/features/list/model/list.dart';

class ApiProvider{
  Dio dio = Dio();
  final String _url = "http://sherpur.rbfgroupbd.com/get_notification?page=1&pageSize=18";
  final String token="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzExMTMzNDEzLCJleHAiOjE3MTEyMTk4MTN9.37EnXGuuizA6nzVXxvSEsV8NxJGzIE8aAdO9PMb79b4";

  Future<ListModel> fetchList() async {
    try{
      dio.options.headers['Authorization'] = 'Bearer $token';
      Response response = (await dio.get(_url)) ;
       print(response.data);
      // ListModel lists = (json.decode(response.data as String)).map((data) => ListModel.fromJson(data));
      ListModel list = ListModel.fromJson(response.data);
      print(list.data.results[5].title);
      return list;
    }
    catch(e){
      print(e);
      rethrow;
    }
  }
}