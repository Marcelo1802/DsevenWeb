import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';

class ServicesSectionWidget extends StatelessWidget {
  const ServicesSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
      color: Colors.grey[50],
      child: Column(
        children: [
          // Título da seção
          Text(
            'SERVIÇOS SOB MEDIDA',
            style: TextStyle(
              color: const Color(0xFF2196F3),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          
          const SizedBox(height: 16),
          
          Text(
            'Soluções Para Seu Negócio Crescer',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontSize: 48,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 80),
          
          // Grid de serviços
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: 0.9,
            children: [
              _buildServiceCard(
                context,
                Icons.lightbulb_outline,
                AppStrings.productThinking,
                'Estruturação de produtos digitais inovadores, monetizáveis e escaláveis.',
              ),
              _buildServiceCard(
                context,
                Icons.design_services,
                AppStrings.uxDesign,
                'Criação de experiências de usuário com foco em retenção e conforto.',
              ),
              _buildServiceCard(
                context,
                Icons.phone_android,
                AppStrings.mobileApp,
                'Desenvolvimento Android e iOS, aplicativos híbridos e nativos, com soluções personalizadas.',
              ),
              _buildServiceCard(
                context,
                Icons.web,
                AppStrings.webApp,
                'Desenvolvimento Angular, React, Vue, plataformas Web e aplicativos responsivos.',
              ),
              _buildServiceCard(
                context,
                Icons.storage,
                AppStrings.database,
                'Bancos de dados relacionais, não relacionais, elásticos e LGPD compliance.',
              ),
              _buildServiceCard(
                context,
                Icons.integration_instructions,
                'Integração',
                'Desenvolvimento de integrações entre softwares, ERP, CRM, Gateways.',
              ),
              _buildServiceCard(
                context,
                Icons.verified_user,
                'Garantia de 5 anos',
                'Resolução de bugs e defeitos sem custo, garantindo disponibilidade.',
              ),
              _buildServiceCard(
                context,
                Icons.trending_up,
                'Evolução Contínua',
                'Suporte e execução de roadmaps de evolução de produtos digitais.',
              ),
            ],
          ),
          
          const SizedBox(height: 80),
          
          // Seção de processo
          Container(
            padding: const EdgeInsets.symmetric(vertical: 60),
            child: Column(
              children: [
                Text(
                  AppStrings.servicesProcessTitle,
                  style: TextStyle(
                    color: const Color(0xFF2196F3),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                
                const SizedBox(height: 80),
                
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Imersão
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color(0xFF2196F3),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'IMERSÃO',
                            style: TextStyle(
                              color: const Color(0xFF2196F3),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Nossa imersão é o primeiro passo para avaliarmos a solução ideal para o cliente, nossos engenheiros de requisitos realizam um entendimento aprofundado em busca de detalhes.',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(width: 60),
                    
                    // Proposta
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color(0xFF2196F3),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Icon(
                              Icons.description,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            AppStrings.proposalTitle,
                            style: TextStyle(
                              color: const Color(0xFF2196F3),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Feita a imersão, nosso time de engenharia desenvolve uma proposta de projeto, envolvendo todos os detalhes necessários para construção da solução sob medida para o cliente.',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(width: 60),
                    
                    // Execução
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color(0xFF2196F3),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Icon(
                              Icons.build,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'EXECUÇÃO, PLANEJAMENTO E\nPUBLICAÇÃO',
                            style: TextStyle(
                              color: const Color(0xFF2196F3),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Iniciados os trabalhos, prestamos toda a consultoria para planejamento e execução do projeto, mitigando riscos, resolvendo desafios e publicando a solução tecnológica.',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, IconData icon, String title, String description) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF1A1A2E),
              size: 32,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              height: 1.4,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
