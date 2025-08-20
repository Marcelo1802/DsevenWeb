import 'package:flutter/material.dart';

class BenefitsSectionWidget extends StatelessWidget {
  const BenefitsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
      color: Colors.grey[50],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Review 3x - Card Vermelho
          Expanded(
            child: Container(
              height: 300,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: const Color(0xFF2196F3),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
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
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Review 3x',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Todas as etapas do nosso processo são revisadas 3 vezes para garantir aderência e qualidade.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(width: 24),
          
          // Mitigação de Riscos - Card Branco
          Expanded(
            child: Container(
              height: 300,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
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
                    child: const Icon(
                      Icons.public,
                      color: Color(0xFF1A1A2E),
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Mitigação de Riscos',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Consultoria para encurtar caminhos, acelerar aprendizado e desenvolver apps que resolvem.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(width: 24),
          
          // Entregas Ágeis - Card Branco
          Expanded(
            child: Container(
              height: 300,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
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
                    child: const Icon(
                      Icons.directions_run,
                      color: Color(0xFF1A1A2E),
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Entregas Ágeis',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Processo por etapas com foco em velocidade com qualidade.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
