import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';

class AboutSectionWidget extends StatelessWidget {
  const AboutSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 1200;
        final isTablet = constraints.maxWidth > 768;
        
        // Tamanhos responsivos
        final horizontalPadding = isDesktop ? 80.0 : isTablet ? 40.0 : 20.0;
        final verticalPadding = isDesktop ? 80.0 : isTablet ? 60.0 : 40.0;
        final titleFontSize = isDesktop ? 48.0 : isTablet ? 36.0 : 28.0;
        final subtitleFontSize = isDesktop ? 40.0 : isTablet ? 32.0 : 24.0;
        final cardTitleFontSize = isDesktop ? 20.0 : isTablet ? 18.0 : 16.0;
        final imageHeight = isDesktop ? 400.0 : isTablet ? 300.0 : 250.0;
        final spacing = isDesktop ? 80.0 : isTablet ? 60.0 : 40.0;
        final cardSpacing = isDesktop ? 40.0 : isTablet ? 30.0 : 20.0;
        
        return Container(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
          color: const Color(0xFF1A1A2E),
          child: Column(
            children: [
              // Título da seção
              Text(
                AppStrings.aboutSectionTitle,
                style: TextStyle(
                  color: const Color(0xFF2196F3),
                  fontSize: isDesktop ? 16 : 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              
              SizedBox(height: isDesktop ? 16 : 12),
              
              Text(
                AppStrings.aboutMainTitle,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: titleFontSize,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              
              SizedBox(height: isDesktop ? 32 : 24),
              
              Text(
                AppStrings.aboutDescription,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  height: 1.6,
                  color: Colors.white.withOpacity(0.6),
                  fontSize: isDesktop ? 18 : isTablet ? 16 : 14,
                ),
                textAlign: TextAlign.center,
              ),
              
              SizedBox(height: spacing),
              
              // Seção principal com imagem e conteúdo
              if (isDesktop) ...[
                // Layout desktop (mantido original)
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
                            height: imageHeight,
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
                              fontSize: subtitleFontSize,
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
                                        fontSize: cardTitleFontSize,
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
                                        fontSize: cardTitleFontSize,
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
                                        fontSize: cardTitleFontSize,
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
                                        fontSize: cardTitleFontSize,
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
              ] else ...[
                // Layout mobile/tablet (responsivo)
                Column(
                  children: [
                    // Imagem no topo
                    Container(
                      height: imageHeight,
                      width: double.infinity,
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
                    
                    SizedBox(height: isTablet ? 40 : 30),
                    
                    // CTA Button
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(isTablet ? 24 : 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2196F3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Atendimento personalizado, focado em trazer solução ao cliente, gerar resultados e crescimento constante.\n\nSoluções Que Resolvem !',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isTablet ? 16 : 14,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    
                    SizedBox(height: spacing),
                    
                    // Conteúdo
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.consultingTitle,
                          style: TextStyle(
                            color: const Color(0xFF2196F3),
                            fontSize: isTablet ? 14 : 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        
                        SizedBox(height: isTablet ? 16 : 12),
                        
                        Text(
                          AppStrings.consultingSubtitle,
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontSize: subtitleFontSize,
                            height: 1.2,
                            color: Colors.white,
                          ),
                        ),
                        
                        SizedBox(height: isTablet ? 24 : 20),
                        
                        Text(
                          AppStrings.consultingDescription,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            height: 1.6,
                            color: Colors.white.withOpacity(0.6),
                            fontSize: isTablet ? 16 : 14,
                          ),
                        ),
                        
                        SizedBox(height: isTablet ? 40 : 30),
                        
                        // Cards de benefícios em coluna para mobile
                        Column(
                          children: [
                            // Primeira linha de cards
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppStrings.creativityTitle,
                                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                          fontSize: cardTitleFontSize,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        AppStrings.creativityDescription,
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          height: 1.5,
                                          color: Colors.white.withOpacity(0.6),
                                          fontSize: isTablet ? 14 : 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                
                                SizedBox(width: cardSpacing),
                                
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppStrings.riskManagementTitle,
                                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                          fontSize: cardTitleFontSize,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        AppStrings.riskManagementDescription,
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          height: 1.5,
                                          color: Colors.white.withOpacity(0.6),
                                          fontSize: isTablet ? 14 : 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            
                            SizedBox(height: isTablet ? 32 : 24),
                            
                            // Segunda linha de cards
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppStrings.expertiseTitle,
                                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                          fontSize: cardTitleFontSize,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        AppStrings.expertiseDescription,
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          height: 1.5,
                                          color: Colors.white.withOpacity(0.6),
                                          fontSize: isTablet ? 14 : 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                
                                SizedBox(width: cardSpacing),
                                
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppStrings.supportTitle,
                                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                          fontSize: cardTitleFontSize,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        AppStrings.supportDescription,
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          height: 1.5,
                                          color: Colors.white.withOpacity(0.6),
                                          fontSize: isTablet ? 14 : 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

