import 'dart:developer';

abstract class AppExceptions implements Exception {
  final String message;

  AppExceptions({required this.message});
  @override
  String toString() {
    log(message);
    return message;
  }
}

class ServerException extends AppExceptions {
  ServerException({required super.message});
}
