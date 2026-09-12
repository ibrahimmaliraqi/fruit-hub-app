abstract class AppExceptions implements Exception {
  final String message;

  AppExceptions({required this.message});
}

class ServerException extends AppExceptions {
  ServerException({required super.message});
}
