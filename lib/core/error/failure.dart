abstract class Failure {
  final String message;

  Failure({required this.message});
  @override
  toString() => message;
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});
}
