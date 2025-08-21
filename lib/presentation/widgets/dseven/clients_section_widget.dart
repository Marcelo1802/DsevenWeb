import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';

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
        
        // Seção de Números/Resultados
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
          color: const Color(0xFF1A1A2E),
          child: Column(
            children: [
              Text(
                AppStrings.companyNumbersTitle,
                style: TextStyle(
                  color: const Color(0xFF2196F3),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              
              const SizedBox(height: 16),
              
              const Text(
                AppStrings.companyResultsTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 16),
              
              const Text(
                AppStrings.companyResultsDescription,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 80),
              
              // Números em destaque
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatCard(
                    context,
                    Icons.access_time,
                    '20',
                    AppStrings.yearsInMarket,
                  ),
                  _buildStatCard(
                    context,
                    Icons.engineering,
                    '800',
                    AppStrings.specialistEngineers,
                  ),
                  _buildStatCard(
                    context,
                    Icons.groups,
                    '2,500',
                    AppStrings.successfulProjects,
                  ),
                  _buildStatCard(
                    context,
                    Icons.attach_money,
                    '120',
                    AppStrings.millionsValuation,
                  ),
                ],
              ),
              
              const SizedBox(height: 80),
              
              // Citação do CEO
              Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const Text(
                      AppStrings.testimonialQuote,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        height: 1.5,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    const SizedBox(height: 24),
                    
                    Text(
                      '– Rafael Melo, CEO',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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

  Widget _buildStatCard(BuildContext context, IconData icon, String number, String label) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 40,
          ),
        ),
        
        const SizedBox(height: 24),
        
        Text(
          number,
          style: TextStyle(
            color: const Color(0xFF2196F3),
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        const SizedBox(height: 8),
        
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
