import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import '../common/staggered_animation_list.dart';
import '../common/process_card.dart';

class BenefitsSectionWidget extends StatelessWidget {
  const BenefitsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Padding responsivo baseado na largura da tela
        final horizontalPadding = constraints.maxWidth > 1200 
            ? 80.0 
            : constraints.maxWidth > 768 
                ? 40.0 
                : 20.0;
        
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, 
            vertical: 80
          ),
          color: Colors.grey[50],
          child: Column(
            children: [
          // Título da seção
          Text(
            'NOSSO DIFERENCIAL',
            style: TextStyle(
              color: const Color(0xFF2196F3),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          
          const SizedBox(height: 16),
          
          Text(
            'Metodologia Comprovada Para Resultados Excepcionais',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 16),
          
          Text(
            'Aplicamos processos rigorosos e técnicas avançadas para garantir que cada projeto supere as expectativas, entregando soluções de alta qualidade com agilidade e eficiência.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.grey[600],
              fontSize: 18,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 60),
          
          // Cards com efeito escada e animação
          StaggeredAnimationList(
            children: [
              ProcessCard(
                icon: Icons.refresh,
                title: AppStrings.reviewTitle,
                description: AppStrings.reviewDescription,
                isHighlighted: true, // Primeiro card destacado
              ),
              ProcessCard(
                icon: Icons.security,
                title: AppStrings.riskMitigationTitle,
                description: AppStrings.riskMitigationDescription,
              ),
              ProcessCard(
                icon: Icons.speed,
                title: AppStrings.agileDeliveryTitle,
                description: AppStrings.agileDeliveryDescription,
              ),
            ],
          ),
        ],
          ),
        );
      },
    );
  }
}