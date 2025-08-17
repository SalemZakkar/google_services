import 'enum/server_error_code.dart';

abstract class Failure {}

class ServerFailure implements Failure {
  final ServerErrorCode errorCode;
  final String message;

  ServerFailure({required this.errorCode, this.message = ''});
}

class CustomFailure implements Failure {
  final String message;

  CustomFailure({required this.message});
}

class NetworkFailure implements Failure {
  final bool connectionTimeOut;

  NetworkFailure({this.connectionTimeOut = false});
}

class UserISNotVerifiedFailure implements Failure {
  UserISNotVerifiedFailure();
}
