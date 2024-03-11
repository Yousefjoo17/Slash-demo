import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(Dio dio) : _dio = dio;

  Future<Map<String, dynamic>> get({int? id}) async {
    if (id == null) {
      var response = await _dio.get("https://slash-backend.onrender.com/product/?limit=20&page=1");
      return response.data;
    } else {
      var response = await _dio.get("https://slash-backend.onrender.com/product/$id");
      return response.data;
    }
  }
}
