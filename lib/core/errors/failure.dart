import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioexception(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: "connection timeout");
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: "send connection timeout");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: "receive connection timeout");
      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: "Bad certificate");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(
            errMessage: "connection to API has been cancelled");
      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: "connection Error to API");

      case DioExceptionType.unknown:
        if (dioException.message!.contains("SocketException")) {
          return ServerFailure(errMessage: "No internet connection");
        }
        return ServerFailure(errMessage: "unexpected Error, please try agian");
      default:
        return ServerFailure(errMessage: "Server Failure, please try again");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMessage: response["error"]["message"]);
    } else if (statusCode == 404) {
      return ServerFailure(errMessage: "Your request is not found");
    } else if (statusCode == 500) {
      return ServerFailure(errMessage: "internal server Error");
    } else {
      return ServerFailure(errMessage: "Server Failure, please try again");
    }
  }
}
