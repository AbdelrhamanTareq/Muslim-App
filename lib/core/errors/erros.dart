// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:muslim_app/core/utils/app_strings.dart';

abstract class Faliure {
  final String errorMessage;

  Faliure(this.errorMessage);
}

class LocalDataFaliure implements Faliure {
  @override
  String get errorMessage => ErrorStrings.localDataError;
  // String get errorMessage => "Local data error";
}

class ServerFailure extends Faliure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(ErrorStrings.connectionTimeOut);
        // return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        // return ServerFailure('Send timeout with ApiServer');
        return ServerFailure(ErrorStrings.sendTimeOut);

      case DioExceptionType.receiveTimeout:
        return ServerFailure(ErrorStrings.receiveTimeOut);
        // return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(ErrorStrings.requestTimeOut);
        // return ServerFailure('Request to ApiServer was canceld');

      case DioExceptionType.unknown:
        if (dioError.message == null) {
          return ServerFailure(ErrorStrings.unExpectedError);
          // return ServerFailure('Unexpected Error, Please try again!');
        }
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure(ErrorStrings.noInternetConnection);
          // return ServerFailure('No Internet Connection');
        }

        return ServerFailure(ErrorStrings.unExpectedError);
        // return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure(ErrorStrings.oppsError);
        // return ServerFailure('Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['data']);
    } else if (statusCode == 404) {
      return ServerFailure(ErrorStrings.requestTimeOut);
      // return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure(ErrorStrings.internalError);
    } else {
      return ServerFailure(ErrorStrings.oppsError);
      // return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}

class NoConnectionFaliure implements Faliure {
  @override
  String get errorMessage => ErrorStrings.noInternetConnection;
  // String get errorMessage => "There is no internet connection, Please check you connectiom and try again";

}

class OtherFaliure implements Faliure {
  @override
  String get errorMessage => ErrorStrings.oppsError;

}
