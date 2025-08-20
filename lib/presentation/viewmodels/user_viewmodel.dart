import '../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/get_users.dart';
import '../../domain/usecases/get_user_by_id.dart';
import 'base_viewmodel.dart';

class UserViewModel extends BaseViewModel {
  final GetUsers getUsersUseCase;
  final GetUserById getUserByIdUseCase;

  UserViewModel({
    required this.getUsersUseCase,
    required this.getUserByIdUseCase,
  });

  List<User> _users = [];
  User? _selectedUser;

  List<User> get users => _users;
  User? get selectedUser => _selectedUser;

  Future<void> loadUsers() async {
    setLoading();
    
    final result = await getUsersUseCase();
    
    result.fold(
      (failure) => setError(_mapFailureToMessage(failure)),
      (users) {
        _users = users;
        setSuccess();
      },
    );
  }

  Future<void> loadUserById(int id) async {
    setLoading();
    
    final result = await getUserByIdUseCase(GetUserByIdParams(id: id));
    
    result.fold(
      (failure) => setError(_mapFailureToMessage(failure)),
      (user) {
        _selectedUser = user;
        setSuccess();
      },
    );
  }

  void clearSelectedUser() {
    _selectedUser = null;
    notifyListeners();
  }

  String _mapFailureToMessage(failure) {
    switch (failure.runtimeType) {
      case const (ServerFailure):
        return 'Erro no servidor. Tente novamente.';
      case const (CacheFailure):
        return 'Erro no cache. Verifique sua conexão.';
      case const (NetworkFailure):
        return 'Sem conexão com a internet.';
      default:
        return 'Erro inesperado. Tente novamente.';
    }
  }
}
