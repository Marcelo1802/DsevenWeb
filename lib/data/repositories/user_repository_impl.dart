import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../../core/network/network_info.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_local_datasource.dart';
import '../datasources/user_remote_datasource.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<User>>> getUsers() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUsers = await remoteDataSource.getUsers();
        await localDataSource.cacheUsers(remoteUsers);
        return Right(remoteUsers.map((model) => model.toEntity()).toList());
      } catch (e) {
        return Left(ServerFailure('Erro ao buscar usuários do servidor: $e'));
      }
    } else {
      try {
        final cachedUsers = await localDataSource.getCachedUsers();
        return Right(cachedUsers.map((model) => model.toEntity()).toList());
      } catch (e) {
        return Left(CacheFailure('Erro ao carregar usuários do cache: $e'));
      }
    }
  }

  @override
  Future<Either<Failure, User>> getUserById(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await remoteDataSource.getUserById(id);
        await localDataSource.cacheUser(remoteUser);
        return Right(remoteUser.toEntity());
      } catch (e) {
        return Left(ServerFailure('Erro ao buscar usuário do servidor: $e'));
      }
    } else {
      try {
        final cachedUser = await localDataSource.getCachedUserById(id);
        if (cachedUser != null) {
          return Right(cachedUser.toEntity());
        } else {
          return Left(CacheFailure('Usuário não encontrado no cache'));
        }
      } catch (e) {
        return Left(CacheFailure('Erro ao carregar usuário do cache: $e'));
      }
    }
  }

  @override
  Future<Either<Failure, User>> createUser(User user) async {
    if (await networkInfo.isConnected) {
      try {
        final userModel = UserModel.fromEntity(user);
        final createdUser = await remoteDataSource.createUser(userModel);
        return Right(createdUser.toEntity());
      } catch (e) {
        return Left(ServerFailure('Erro ao criar usuário: $e'));
      }
    } else {
      return Left(NetworkFailure('Sem conexão com a internet'));
    }
  }

  @override
  Future<Either<Failure, User>> updateUser(User user) async {
    if (await networkInfo.isConnected) {
      try {
        final userModel = UserModel.fromEntity(user);
        final updatedUser = await remoteDataSource.updateUser(userModel);
        await localDataSource.cacheUser(updatedUser);
        return Right(updatedUser.toEntity());
      } catch (e) {
        return Left(ServerFailure('Erro ao atualizar usuário: $e'));
      }
    } else {
      return Left(NetworkFailure('Sem conexão com a internet'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser(int id) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteUser(id);
        return const Right(null);
      } catch (e) {
        return Left(ServerFailure('Erro ao deletar usuário: $e'));
      }
    } else {
      return Left(NetworkFailure('Sem conexão com a internet'));
    }
  }
}
