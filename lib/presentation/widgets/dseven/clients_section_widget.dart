import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import 'company_values_section_widget.dart';

class ClientsSectionWidget extends StatelessWidget {
  const ClientsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Seção de Clientes
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
          color: Colors.grey[50],
          child: Column(
            children: [
                              Text(
                  AppStrings.clientsTrustTitle,
                  style: TextStyle(
                    color: const Color(0xFF2196F3),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 60),
              
              // Logos dos clientes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildClientLogo(AppStrings.clientPortoSeguro, Icons.security),
                  _buildClientLogo(AppStrings.clientRedBull, Icons.sports_motorsports),
                  _buildClientLogo(AppStrings.clientGlobo, Icons.public),
                  _buildClientLogo(AppStrings.clientTim, Icons.signal_cellular_4_bar),
                  _buildClientLogo(AppStrings.clientCarrefour, Icons.shopping_cart),
                ],
              ),
            ],
          ),
        ),
        
        // Seção de Valores da Empresa (importada de outro widget)
        const CompanyValuesSectionWidget(),
      ],
    );
  }

  Widget _buildClientLogo(String name, IconData icon) {
    return Container(
      width: 140,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 32,
            color: Colors.grey[700],
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }


}
