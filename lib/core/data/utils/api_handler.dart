import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:google_services/core/domain/entity/enum/server_error_code.dart';
import 'package:google_services/core/domain/entity/failures.dart';
import 'package:logger/logger.dart';

typedef FutureEitherFailureOrData<T> = Future<Either<Failure, T>> Function();

mixin ApiHandler {
  final Logger _logger = Logger();

  Future<Either<Failure, T>> request<T>(
    FutureEitherFailureOrData<T> body,
  ) async {
    try {
      return await body();
    } on DioException catch (e, stack) {
      _logger.e(e.toString(), error: e, stackTrace: stack);
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return left(NetworkFailure(connectionTimeOut: true));
      } else if (e.type == DioExceptionType.badResponse) {
        return left(
          ServerFailure(
            errorCode: getServ(e.response?.statusCode ?? 500),
            message: e.response?.data['error']['message'] ?? 'Error',
          ),
        );
      } else {
        return left(NetworkFailure(connectionTimeOut: false));
      }
    } catch (e, stack) {
      _logger.e(e.toString(), error: e, stackTrace: stack);
      return left(ServerFailure(errorCode: ServerErrorCode.serverError));
    }
  }

  ServerErrorCode getServ(int code) {
    switch (code) {
      case 404:
        return ServerErrorCode.notFound;
      case 403:
        return ServerErrorCode.forbidden;
      case 500:
        return ServerErrorCode.serverError;
      case 401:
        return ServerErrorCode.unauthenticated;
      case 400:
        return ServerErrorCode.wrongInput;
      default:
        return ServerErrorCode.serverError;
    }
  }
}
