import 'package:multi_feature_app/features/list/model/list.dart';

import '../resourse/api_provider.dart';


class ListRepository{
  final ApiProvider _apiProvider = ApiProvider();
  Future<ListModel> fetchList(){
    return _apiProvider.fetchList();
  }
}

class NetworkError extends Error {}