import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/datasources/user_local_datasource.dart';
import '../../data/datasources/user_remote_datasource.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/usecases/get_users.dart';
import '../../domain/usecases/get_user_by_id.dart';
import '../../presentation/viewmodels/user_viewmodel.dart';
import '../network/network_info.dart';

final getIt = GetIt.instance;

class DependencyInjection {
  static Future<void> setup() async {
    // External dependencies
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
    getIt.registerLazySingleton<http.Client>(() => http.Client());
    getIt.registerLazySingleton<Connectivity>(() => Connectivity());

    // Core
    getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(getIt<Connectivity>()),
    );

    // Data sources
    getIt.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(client: getIt<http.Client>()),
    );
    getIt.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSourceImpl(sharedPreferences: getIt<SharedPreferences>()),
    );

    // Repository
    getIt.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(
        remoteDataSource: getIt<UserRemoteDataSource>(),
        localDataSource: getIt<UserLocalDataSource>(),
        networkInfo: getIt<NetworkInfo>(),
      ),
    );

    // Use cases
    getIt.registerLazySingleton<GetUsers>(
      () => GetUsers(getIt<UserRepository>()),
    );
    getIt.registerLazySingleton<GetUserById>(
      () => GetUserById(getIt<UserRepository>()),
    );

    // ViewModels
    getIt.registerFactory<UserViewModel>(
      () => UserViewModel(
        getUsersUseCase: getIt<GetUsers>(),
        getUserByIdUseCase: getIt<GetUserById>(),
      ),
    );
  }

  static List<ChangeNotifierProvider> get providers => [
        ChangeNotifierProvider<UserViewModel>(
          create: (_) => getIt<UserViewModel>(),
        ),
      ];
}
