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
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 1200;
        final isTablet = constraints.maxWidth > 768;
        
        // Tamanhos responsivos
        final titleFontSize = isDesktop ? 48.0 : isTablet ? 36.0 : 28.0;
        final descriptionFontSize = isDesktop ? 18.0 : isTablet ? 16.0 : 14.0;
        final featureFontSize = isDesktop ? 14.0 : isTablet ? 13.0 : 12.0;
        final buttonFontSize = isDesktop ? 16.0 : isTablet ? 14.0 : 12.0;
        final imageHeight = isDesktop ? 500.0 : isTablet ? 400.0 : 300.0;
        final iconSize = isDesktop ? 60.0 : isTablet ? 50.0 : 40.0;
        final showcaseTitleFontSize = isDesktop ? 24.0 : isTablet ? 20.0 : 18.0;
        final demoTextFontSize = isDesktop ? 16.0 : isTablet ? 14.0 : 12.0;
        final spacing = isDesktop ? 60.0 : isTablet ? 40.0 : 20.0;
        
        if (isDesktop) {
          // Layout Desktop - Lado a lado
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Lado esquerdo - Informações do projeto
              Expanded(
                flex: 4,
                child: _buildProjectInfo(
                  titleFontSize, 
                  descriptionFontSize, 
                  featureFontSize, 
                  buttonFontSize
                ),
              ),
              
              SizedBox(width: spacing),
              
              // Lado direito - Imagem grande do projeto
              Expanded(
                flex: 6,
                child: _buildProjectImage(imageHeight, iconSize, showcaseTitleFontSize, demoTextFontSize),
              ),
            ],
          );
        } else {
          // Layout Mobile/Tablet - Em coluna
          return Column(
            children: [
              // Imagem do projeto no topo
              _buildProjectImage(imageHeight, iconSize, showcaseTitleFontSize, demoTextFontSize),
              
              SizedBox(height: spacing),
              
              // Informações do projeto abaixo
              _buildProjectInfo(
                titleFontSize, 
                descriptionFontSize, 
                featureFontSize, 
                buttonFontSize
              ),
            ],
          );
        }
      },
    );
  }

  Widget _buildProjectInfo(double titleFontSize, double descriptionFontSize, double featureFontSize, double buttonFontSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          projects[currentIndex].title,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        SizedBox(height: titleFontSize * 0.5),
        
        Text(
          projects[currentIndex].description,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            height: 1.6,
            fontSize: descriptionFontSize,
          ),
        ),
        
        SizedBox(height: titleFontSize * 0.7),
        
        // Lista de features
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: projects[currentIndex].features.map((feature) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: featureFontSize * 1.1, 
                vertical: featureFontSize * 0.6
              ),
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
                  fontSize: featureFontSize,
                ),
              ),
            );
          }).toList(),
        ),
        
        SizedBox(height: titleFontSize * 0.8),
        
        // Botões de ação
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: buttonFontSize),
              ),
              child: const Text(AppStrings.projectViewButton),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                textStyle: TextStyle(fontSize: buttonFontSize),
              ),
              child: const Text(AppStrings.projectDemoButton),
            ),
          ],
        ),
        
        SizedBox(height: titleFontSize * 0.8),
        
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
    );
  }

  Widget _buildProjectImage(double height, double iconSize, double titleFontSize, double demoFontSize) {
    return Container(
      height: height,
      width: double.infinity,
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
                  width: iconSize * 2,
                  height: iconSize * 2,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(iconSize),
                  ),
                  child: Icon(
                    _getProjectIcon(currentIndex),
                    color: Colors.white,
                    size: iconSize,
                  ),
                ),
                
                SizedBox(height: titleFontSize),
                
                Text(
                  AppStrings.projectShowcaseTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                SizedBox(height: titleFontSize * 0.5),
                
                Text(
                  AppStrings.projectDemoAvailable,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: demoFontSize,
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
