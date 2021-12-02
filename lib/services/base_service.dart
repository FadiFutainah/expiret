abstract class BaseService {
  final String baseUrl = '';

  Future<Map<String, dynamic>> getRequest(String url);
}
