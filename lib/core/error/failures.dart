import 'package:dartz/dartz.dart';

abstract class Failure {
  const Failure();
}

class ServerFailure extends Failure {
  final String message;
  const ServerFailure(this.message);
}

class CacheFailure extends Failure {
  final String message;
  const CacheFailure(this.message);
}

class NetworkFailure extends Failure {
  final String message;
  const NetworkFailure(this.message);
}

class ValidationFailure extends Failure {
  final String message;
  const ValidationFailure(this.message);
}

typedef FailureOr<T> = Either<Failure, T>;
