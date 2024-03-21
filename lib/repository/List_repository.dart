import 'package:multi_feature_app/features/list/model/list_model_0.dart';

import '../resourse/api_provider.dart';


class ListRepository{
  final ApiProvider _apiProvider = ApiProvider();
  Future<List<ListModel>> fetchList(){
    return _apiProvider.fetchList();
  }
}

class NetworkError extends Error {}