import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);
  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure("Connection timeout with ApiServer");
      case DioErrorType.sendTimeout:
        return ServerFailure("Send timeout with ApiServer");
      case DioErrorType.receiveTimeout:
        return ServerFailure("Receive timeout with ApiServer");
      case DioErrorType.badCertificate:
        return ServerFailure(" Bad Certification connection ");
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFailure(" Request to ApiServer was canceld ");
      case DioErrorType.connectionError:
        return ServerFailure(" connection Error ");
      case DioErrorType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure("No Internet Connection");
        }
        return ServerFailure("Unexpected error Please try again later ...");
      default:
        return ServerFailure('Opps There was an Error, Please try Late');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (response == 404) {
      return ServerFailure('Your request not found');
    } else if (response == 500) {
      return ServerFailure("Internal Server Error ,Please try again later ...");
    } else {
      return ServerFailure("Opps There was an Error, Please try Later");
    }
  }
}
