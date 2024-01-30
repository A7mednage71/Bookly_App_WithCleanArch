import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('connection timeout with api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('send Timeout with api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('receive Timeout with api server');
      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate with api server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponsefailure(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to api server cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure(
            'OOPS there was an unknown error , please try again!');
    }
  }

  factory ServerFailure.fromResponsefailure(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('Your Request was not found , please try again!');
    } else if (statusCode == 500) {
      return ServerFailure('the server has a problem , please try again!');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else {
      return ServerFailure(
          'OOPS there was an unknown error , please try again!');
    }
  }
}
