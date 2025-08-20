import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class GetUsers implements UseCaseNoParams<List<User>> {
  final UserRepository repository;

  GetUsers(this.repository);

  @override
  Future<Either<Failure, List<User>>> call() async {
    return await repository.getUsers();
  }
}
