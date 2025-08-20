import 'package:flutter/material.dart';

class AboutSectionWidget extends StatelessWidget {
  const AboutSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
      color: Colors.white,
      child: Column(
        children: [
          // Título da seção
          Text(
            'CONHEÇA MAIS SOBRE NÓS',
            style: TextStyle(
              color: const Color(0xFF2196F3),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          
          const SizedBox(height: 16),
          
          Text(
            'Entre as 3 maiores do mundo',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontSize: 48,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 32),
          
          Text(
            'Estamos entre as 3 empresas do mundo, com maior volume de projetos, isso\nsignifica expertise em resolver problemas e desenvolver tecnologias de ponta.\nSabemos os melhores caminhos.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 80),
          
          // Seção principal com imagem e conteúdo
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagem
              Expanded(
                flex: 5,
                child: Container(
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
              ),
              
              const SizedBox(width: 60),
              
              // Conteúdo
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CONSULTORIA TECH',
                      style: TextStyle(
                        color: const Color(0xFF2196F3),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    Text(
                      'Ajudamos sua empresa\na tomar as melhores\ndecisões',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 40,
                        height: 1.2,
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    Text(
                      'Ao desenvolver um produto de tecnologia, diversos desafios são enfrentados ao longo do caminho, nós ajudamos sua empresa a escolher os caminhos mais curtos e que dão resultados reais.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        height: 1.6,
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Cards de benefícios
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Criatividade',
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Times criativos com alta capacidade de inovação e desenvolvimento.',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  height: 1.5,
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
                                'Gestão de Riscos',
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Engenheiros com alta bagagem de projetos e conhecimento tech.',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 32),
                    
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Expertise',
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Experiência em volume, alta capacidade de resolução e construção de projetos.',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  height: 1.5,
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
                                'Suporte',
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Apoio constante, consultoria sob medida, parceria de longo prazo.',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // CTA Button
                    Container(
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
            ],
          ),
        ],
      ),
    );
  }
}
