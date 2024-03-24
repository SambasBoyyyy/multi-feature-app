import 'package:multi_feature_app/features/list/model/list.dart';

import '../resourse/api_provider.dart';


class ListRepository{
  final ApiProvider _apiProvider = ApiProvider();
  Future<ListModel> fetchList(int page){
    return _apiProvider.fetchList(page);
  }
}

class NetworkError extends Error {}