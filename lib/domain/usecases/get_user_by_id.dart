import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class GetUserById implements UseCase<User, GetUserByIdParams> {
  final UserRepository repository;

  GetUserById(this.repository);

  @override
  Future<Either<Failure, User>> call(GetUserByIdParams params) async {
    return await repository.getUserById(params.id);
  }
}

class GetUserByIdParams {
  final int id;

  GetUserByIdParams({required this.id});
}
