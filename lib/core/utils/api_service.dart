import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = "https://slash-backend.onrender.com/product/";
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> get({int? id}) async {
    if (id == null) {
      var response = await _dio.get(_baseUrl);
      return response.data;
    } else {
      var response = await _dio.get("$_baseUrl$id");
      return response.data;
    }
  }
}
