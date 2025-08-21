import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          children: [
            // Logo e Texto à esquerda
            Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 8, 0, 0).withOpacity(0.1),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    AppStrings.logoAssetPath,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 16),
                const Text(
                  AppStrings.appName,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 64, 255),
                  ),
                ),
              ],
            ),
            
            // Espaçador
            const Spacer(),
            
            // Menu à direita
            Row(
              children: [
                _buildMenuItem(AppStrings.homeIconPath, AppStrings.menuHome),
                _buildMenuItem(AppStrings.aboutIconPath, AppStrings.menuAbout),
                _buildMenuItem(AppStrings.servicesIconPath, AppStrings.menuServices),
                _buildMenuItem(AppStrings.projectsIconPath, AppStrings.menuProjects),
                _buildMenuItem(AppStrings.contactIconPath, AppStrings.menuContact),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String iconPath, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                iconPath,
                height: 32,
                width: 32,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}