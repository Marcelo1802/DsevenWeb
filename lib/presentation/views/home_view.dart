import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/user_viewmodel.dart';
import '../widgets/user_list_widget.dart';
import '../widgets/loading_widget.dart';
import '../widgets/error_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    // Carregar usuários quando a tela inicializar
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserViewModel>().loadUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clean Architecture Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<UserViewModel>().loadUsers(),
          ),
        ],
      ),
      body: Consumer<UserViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const LoadingWidget();
          }

          if (viewModel.hasError) {
            return CustomErrorWidget(
              message: viewModel.errorMessage,
              onRetry: () => viewModel.loadUsers(),
            );
          }

          return const UserListWidget();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<UserViewModel>().loadUsers(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
