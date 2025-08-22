import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';

class AboutSectionWidget extends StatelessWidget {
  const AboutSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
      color: const Color(0xFF1A1A2E),
      child: Column(
        children: [
          // Título da seção
          Text(
            AppStrings.aboutSectionTitle,
            style: TextStyle(
              color: const Color(0xFF2196F3),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          
          const SizedBox(height: 16),
          
          Text(
            AppStrings.aboutMainTitle,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontSize: 48,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 32),
          
          Text(
            AppStrings.aboutDescription,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              height: 1.6,
              color: Colors.white.withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 80),
          
          // Seção principal com imagem e conteúdo
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Coluna da esquerda - Imagem + CTA Button
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    // Imagem
                    Container(
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                          image: NetworkImage(
                            'https://images.unsplash.com/photo-1552664730-d307ca884978?ixlib=rb-4.0.3&auto=format&fit=crop&w=2940&q=80',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // CTA Button abaixo da imagem
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2196F3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Atendimento personalizado, focado em trazer solução ao cliente,\ngerar resultados e crescimento constante.\n\nSoluções Que Resolvem !',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(width: 60),
              
              // Coluna da direita - Conteúdo
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.consultingTitle,
                      style: TextStyle(
                        color: const Color(0xFF2196F3),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    Text(
                      AppStrings.consultingSubtitle,
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 40,
                        height: 1.2,
                        color: Colors.white,
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    Text(
                      AppStrings.consultingDescription,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        height: 1.6,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Cards de benefícios - apenas 2 lado a lado
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.creativityTitle,
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                AppStrings.creativityDescription,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  height: 1.5,
                                  color: Colors.white.withOpacity(0.6),
                                ),
                              ),
                              
                              const SizedBox(height: 32),
                              
                              Text(
                                AppStrings.expertiseTitle,
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                AppStrings.expertiseDescription,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  height: 1.5,
                                  color: Colors.white.withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(width: 40),
                        
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.riskManagementTitle,
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                AppStrings.riskManagementDescription,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  height: 1.5,
                                  color: Colors.white.withOpacity(0.6),
                                ),
                              ),
                              
                              const SizedBox(height: 32),
                              
                              Text(
                                AppStrings.supportTitle,
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                AppStrings.supportDescription,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  height: 1.5,
                                  color: Colors.white.withOpacity(0.6),
                                ),
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
        ],
      ),
    );
  }
}
