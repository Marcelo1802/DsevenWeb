import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/user.dart';
import '../viewmodels/user_viewmodel.dart';
import '../widgets/loading_widget.dart';
import '../widgets/error_widget.dart';

class UserDetailView extends StatefulWidget {
  final int userId;

  const UserDetailView({super.key, required this.userId});

  @override
  State<UserDetailView> createState() => _UserDetailViewState();
}

class _UserDetailViewState extends State<UserDetailView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserViewModel>().loadUserById(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Usuário'),
      ),
      body: Consumer<UserViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const LoadingWidget();
          }

          if (viewModel.hasError) {
            return CustomErrorWidget(
              message: viewModel.errorMessage,
              onRetry: () => viewModel.loadUserById(widget.userId),
            );
          }

          final user = viewModel.selectedUser;
          if (user == null) {
            return const Center(
              child: Text('Usuário não encontrado'),
            );
          }

          return _buildUserDetails(user);
        },
      ),
    );
  }

  Widget _buildUserDetails(User user) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoCard(
            'Informações Pessoais',
            [
              _buildInfoRow('Nome', user.name),
              _buildInfoRow('Email', user.email),
              _buildInfoRow('Telefone', user.phone),
              _buildInfoRow('Website', user.website),
            ],
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            'Endereço',
            [
              _buildInfoRow('Rua', user.address.street),
              _buildInfoRow('Complemento', user.address.suite),
              _buildInfoRow('Cidade', user.address.city),
              _buildInfoRow('CEP', user.address.zipcode),
              _buildInfoRow('Latitude', user.address.geo.lat),
              _buildInfoRow('Longitude', user.address.geo.lng),
            ],
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            'Empresa',
            [
              _buildInfoRow('Nome', user.company.name),
              _buildInfoRow('Slogan', user.company.catchPhrase),
              _buildInfoRow('Negócio', user.company.bs),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, List<Widget> children) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Limpar usuário selecionado ao sair da tela
    context.read<UserViewModel>().clearSelectedUser();
    super.dispose();
  }
}
