import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:multi_feature_app/features/list/model/list_model.dart';

class ApiProvider{
  Dio dio = Dio();
  final String _url = "http://sherpur.rbfgroupbd.com/get_notification?page=1&pageSize=10";
  final String token="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzEwNDM1NDkwLCJleHAiOjE3MTA1MjE4OTB9.DUL9UQ5JO5bJH_IOv6Ncotx9X-YYKe9TstVbIw4KRMg";

  Future<List<ListModel>> fetchList() async {
    try {
      dio.options.headers['Authorization'] = 'Bearer $token';
      final Response response = await dio.get(_url);

      if (response.statusCode == 200) {
        final jsonData = response.data;
        List<dynamic> results = jsonData['data']['results'];

        List<ListModel> listModels = results.map((result) {
          return ListModel(
            status: jsonData['status'],
            message: jsonData['message'],
            error: Error(), // You may need to handle error parsing here
            data: Data(
              totalunread: jsonData['data']['totalunread'],
              results: results.map((result) {
                return Result(
                  id: result['id'],
                  userId: result['user_id'],
                  image: result['image'],
                  title: Title.values.firstWhere((e) => e.toString().split('.').last.toUpperCase() == result['title'].toUpperCase(), orElse: () => Title.TITLE_DESCRIPTION),
                  description: Description.values.firstWhere((e) => e.toString().split('.').last.toUpperCase() == result['description'].toUpperCase(), orElse: () => Description.DESCRIPTION_DESCRIPTION),
                  readStatus: ReadStatus.values.firstWhere((e) => e.toString().split('.').last.toUpperCase() == result['read_status'].toUpperCase(), orElse: () => ReadStatus.NO),
                  createdAt: DateTime.parse(result['created_at']),
                  updatedAt: result['updated_at'] != null ? DateTime.parse(result['updated_at']) : null,
                  deletedAt: result['deleted_at'],
                );
              }).toList(),
            ),
          );
        }).toList();

        return listModels;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}