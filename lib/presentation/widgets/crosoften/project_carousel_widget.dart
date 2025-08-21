import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';

class ProjectCarouselWidget extends StatefulWidget {
  const ProjectCarouselWidget({super.key});

  @override
  State<ProjectCarouselWidget> createState() => _ProjectCarouselWidgetState();
}

class _ProjectCarouselWidgetState extends State<ProjectCarouselWidget> {
  int currentIndex = 0;
  final PageController _pageController = PageController();

  final List<ProjectData> projects = [
    ProjectData(
      title: AppStrings.projectEcommerce,
      description: AppStrings.projectEcommerceDesc,
      features: AppStrings.ecommerceFeatures,
      color: const Color(0xFF2196F3),
    ),
    ProjectData(
      title: AppStrings.projectHealthcare,
      description: AppStrings.projectHealthcareDesc,
      features: AppStrings.healthcareFeatures,
      color: const Color(0xFF4CAF50),
    ),
    ProjectData(
      title: AppStrings.projectFinance,
      description: AppStrings.projectFinanceDesc,
      features: AppStrings.financeFeatures,
      color: const Color(0xFFFF9800),
    ),
    ProjectData(
      title: AppStrings.projectEducation,
      description: AppStrings.projectEducationDesc,
      features: AppStrings.educationFeatures,
      color: const Color(0xFF9C27B0),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Lado esquerdo - Informações do projeto
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                projects[currentIndex].title,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const SizedBox(height: 24),
              
              Text(
                projects[currentIndex].description,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  height: 1.6,
                  fontSize: 18,
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Lista de features
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: projects[currentIndex].features.map((feature) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: projects[currentIndex].color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: projects[currentIndex].color.withOpacity(0.3),
                      ),
                    ),
                    child: Text(
                      feature,
                      style: TextStyle(
                        color: projects[currentIndex].color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }).toList(),
              ),
              
              const SizedBox(height: 40),
              
              // Botões de ação
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(AppStrings.projectViewButton),
                  ),
                  const SizedBox(width: 16),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text(AppStrings.projectDemoButton),
                  ),
                ],
              ),
              
              const SizedBox(height: 40),
              
              // Indicadores de navegação
              Row(
                children: [
                  // Botão anterior
                  IconButton(
                    onPressed: currentIndex > 0 ? _previousProject : null,
                    icon: const Icon(Icons.arrow_back_ios),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      disabledBackgroundColor: Colors.grey[50],
                    ),
                  ),
                  
                  const SizedBox(width: 16),
                  
                  // Indicadores de pontos
                  ...List.generate(projects.length, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: index == currentIndex 
                            ? projects[currentIndex].color
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(6),
                      ),
                    );
                  }),
                  
                  const SizedBox(width: 16),
                  
                  // Botão próximo
                  IconButton(
                    onPressed: currentIndex < projects.length - 1 ? _nextProject : null,
                    icon: const Icon(Icons.arrow_forward_ios),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      disabledBackgroundColor: Colors.grey[50],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        
        const SizedBox(width: 60),
        
        // Lado direito - Imagem grande do projeto
        Expanded(
          flex: 6,
          child: Container(
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  projects[currentIndex].color.withOpacity(0.8),
                  projects[currentIndex].color,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: projects[currentIndex].color.withOpacity(0.3),
                  blurRadius: 30,
                  offset: const Offset(0, 15),
                ),
              ],
            ),
            child: Stack(
              children: [
                // Padrão de fundo
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.1),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                
                // Conteúdo central
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          _getProjectIcon(currentIndex),
                          color: Colors.white,
                          size: 60,
                        ),
                      ),
                      
                      const SizedBox(height: 24),
                      
                      Text(
                        AppStrings.projectShowcaseTitle,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                      const SizedBox(height: 12),
                      
                      Text(
                        AppStrings.projectDemoAvailable,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Número do projeto
                Positioned(
                  top: 24,
                  right: 24,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        '${currentIndex + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _nextProject() {
    if (currentIndex < projects.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void _previousProject() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  IconData _getProjectIcon(int index) {
    switch (index) {
      case 0:
        return Icons.shopping_cart;
      case 1:
        return Icons.local_hospital;
      case 2:
        return Icons.trending_up;
      case 3:
        return Icons.school;
      default:
        return Icons.web;
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class ProjectData {
  final String title;
  final String description;
  final List<String> features;
  final Color color;

  ProjectData({
    required this.title,
    required this.description,
    required this.features,
    required this.color,
  });
}
