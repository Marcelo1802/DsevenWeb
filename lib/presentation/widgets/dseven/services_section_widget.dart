import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import '../common/animated_hover_card.dart';

class ServicesSectionWidget extends StatelessWidget {
  const ServicesSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 1200;
        final isTablet = constraints.maxWidth > 768;
        
        // Padding responsivo
        final horizontalPadding = isDesktop ? 80.0 : isTablet ? 40.0 : 20.0;
        final verticalPadding = isDesktop ? 80.0 : isTablet ? 60.0 : 40.0;
        
        // Grid responsivo
        final crossAxisCount = isDesktop ? 4 : isTablet ? 2 : 1;
        final childAspectRatio = isDesktop ? 0.9 : isTablet ? 1.1 : 1.3;
        final spacing = isDesktop ? 24.0 : isTablet ? 20.0 : 16.0;
        
        // Tamanhos de fonte responsivos
        final titleFontSize = isDesktop ? 48.0 : isTablet ? 36.0 : 28.0;
        final subtitleFontSize = isDesktop ? 16.0 : isTablet ? 14.0 : 12.0;
        
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, 
            vertical: verticalPadding
          ),
          color: Colors.grey[50],
          child: Column(
            children: [
              // Título da seção
              Text(
                'SERVIÇOS SOB MEDIDA',
                style: TextStyle(
                  color: const Color(0xFF2196F3),
                  fontSize: subtitleFontSize,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              
              const SizedBox(height: 16),
              
              Text(
                'Soluções Para Seu Negócio Crescer',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: titleFontSize,
                ),
                textAlign: TextAlign.center,
              ),
              
              SizedBox(height: isDesktop ? 80 : 60),
              
              // Grid de serviços responsivo
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: spacing,
                mainAxisSpacing: spacing,
                childAspectRatio: childAspectRatio,
                children: [
                  _buildServiceCard(
                    context,
                    AppStrings.lightIconPath,
                    AppStrings.productThinking,
                    'Estruturação de produtos digitais inovadores, monetizáveis e escaláveis.',
                  ),
                  _buildServiceCard(
                    context,
                    AppStrings.designIconPath,
                    AppStrings.uxDesign,
                    'Criação de experiências de usuário com foco em retenção e conforto.',
                  ),
                  _buildServiceCard(
                    context,
                    AppStrings.iphoneIconPath,
                    AppStrings.mobileApp,
                    'Desenvolvimento Android e iOS, aplicativos híbridos e nativos, com soluções personalizadas.',
                  ),
                  _buildServiceCard(
                    context,
                    AppStrings.webIconPath,
                    AppStrings.webApp,
                    'Desenvolvimento Angular, React, Vue, plataformas Web e aplicativos responsivos.',
                  ),
                  _buildServiceCard(
                    context,
                    AppStrings.serverIconPath,
                    AppStrings.database,
                    'Bancos de dados relacionais, não relacionais, elásticos e LGPD compliance.',
                  ),
                  _buildServiceCard(
                    context,
                    AppStrings.programmerIconPath,
                    'Integração',
                    'Desenvolvimento de integrações entre softwares, ERP, CRM, Gateways.',
                  ),
                  _buildServiceCard(
                    context,
                    AppStrings.checkIconPath,
                    'Garantia de 5 anos',
                    'Resolução de bugs e defeitos sem custo, garantindo disponibilidade.',
                  ),
                  _buildServiceCard(
                    context,
                    AppStrings.arrowIconPath,
                    'Evolução Contínua',
                    'Suporte e execução de roadmaps de evolução de produtos digitais.',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildServiceCard(BuildContext context, dynamic icon, String title, String description) {
    return ServiceCard(
      icon: icon,
      title: title,
      description: description,
    );
  }
}

class ServiceCard extends StatefulWidget {
  final dynamic icon; // Pode ser IconData ou String (path)
  final String title;
  final String description;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isBlue = _isHovered;
    
    final textColor = isBlue ? Colors.white : Colors.black;
    final iconColor = isBlue ? Colors.white : const Color(0xFF2196F3);
    final iconBgColor = isBlue 
        ? Colors.white.withOpacity(0.2)
        : const Color(0xFF2196F3).withOpacity(0.1);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isBlue ? const Color(0xFF2196F3) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_isHovered ? 0.15 : 0.08),
              blurRadius: _isHovered ? 15 : 8,
              offset: Offset(0, _isHovered ? 6 : 3),
            ),
          ],
        ),
        transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: widget.icon is String 
                ? Image.asset(
                    widget.icon,
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.error,
                        color: iconColor,
                        size: 80,
                      );
                    },
                  )
                : Icon(
                    widget.icon,
                    color: iconColor,
                    size: 80,
                  ),
            ),
            const SizedBox(height: 20),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ) ?? TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
              child: Text(widget.title),
            ),
            const SizedBox(height: 12),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                height: 1.4,
                fontSize: 14,
                color: isBlue ? Colors.white.withOpacity(0.9) : Colors.grey[600],
              ) ?? TextStyle(
                height: 1.4,
                fontSize: 14,
                color: isBlue ? Colors.white.withOpacity(0.9) : Colors.grey[600],
              ),
              child: Text(widget.description),
            ),
          ],
        ),
      ),
    );
  }
}
