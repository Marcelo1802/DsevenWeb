import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import 'animated_hover_card.dart';
import 'staggered_animation_list.dart';

class ProcessCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color? iconColor;
  final bool isHighlighted;

  const ProcessCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.iconColor,
    this.isHighlighted = false,
  });

  @override
  State<ProcessCard> createState() => _ProcessCardState();
}

class _ProcessCardState extends State<ProcessCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isBlue = widget.isHighlighted || _isHovered;
    
    final cardColor = isBlue 
        ? const Color(0xFF2196F3) 
        : Colors.white;
    
    final textColor = isBlue 
        ? Colors.white 
        : Colors.black;
    
    final iconColorFinal = isBlue 
        ? Colors.white 
        : (widget.iconColor ?? const Color(0xFF2196F3));

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 300,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: cardColor,
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
          mainAxisSize: MainAxisSize.min,
          children: [
            // Ícone em destaque
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isBlue 
                    ? Colors.white.withOpacity(0.2)
                    : const Color(0xFF2196F3).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                widget.icon,
                size: 32,
                color: iconColorFinal,
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Título
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: textColor,
                height: 1.2,
              ),
              child: Text(widget.title),
            ),
            
            const SizedBox(height: 12),
            
            // Descrição
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                fontSize: 16,
                color: isBlue 
                    ? Colors.white.withOpacity(0.9)
                    : Colors.grey[600],
                height: 1.5,
              ),
              child: Text(widget.description),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget de exemplo usando os cards de processo
class ProcessCardsSection extends StatelessWidget {
  const ProcessCardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
      color: Colors.grey[50],
      child: Column(
        children: [
          // Título da seção
          Text(
            'Nosso Processo',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 16),
          
          Text(
            'Metodologia comprovada para resultados excepcionais',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.grey[600],
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 60),
          
          // Cards com efeito escada
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
  }
}
