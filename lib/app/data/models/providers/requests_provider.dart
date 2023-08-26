import 'package:get/get.dart';

import '../requests_model.dart';

class RequestsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Requests.fromJson(map);
      if (map is List)
        return map.map((item) => Requests.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Requests?> getRequests(int id) async {
    final response = await get('requests/$id');
    return response.body;
  }

  Future<Response<Requests>> postRequests(Requests requests) async =>
      await post('requests', requests);
  Future<Response> deleteRequests(int id) async => await delete('requests/$id');
}
