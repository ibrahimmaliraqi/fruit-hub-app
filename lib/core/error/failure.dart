import 'dart:developer';

abstract class Failure {
  final String message;

  Failure({required this.message});
  @override
  toString() {
    log(message);

    return message;
  }
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});
}
