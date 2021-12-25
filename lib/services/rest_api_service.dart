abstract class RestApiService {
  final String baseUrl = '';

  dynamic getRequest(String url);
  dynamic postRequest(String url, Map<String, dynamic> body);
  dynamic deleteRequest(String url, Map<String, dynamic> body);
  dynamic putRequest(String url, Map<String, dynamic> body);
}
