abstract class BaseService {
  final String baseUrl = '';

  Future<Map<String, dynamic>> getRequest(String url);
  Future<Map<String, dynamic>> postRequest(
      String url, Map<String, dynamic> body);
}
