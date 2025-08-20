import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/user_viewmodel.dart';
import '../views/user_detail_view.dart';
import 'user_card_widget.dart';

class UserListWidget extends StatelessWidget {
  const UserListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.users.isEmpty) {
          return const Center(
            child: Text(
              'Nenhum usuário encontrado',
              style: TextStyle(fontSize: 16),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: viewModel.users.length,
          itemBuilder: (context, index) {
            final user = viewModel.users[index];
            return UserCardWidget(
              user: user,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserDetailView(userId: user.id),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
