import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import '../common/animated_hover_card.dart';

class CompanyValuesSectionWidget extends StatelessWidget {
  const CompanyValuesSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 1200;
        final isTablet = constraints.maxWidth > 768;
        
        // Padding responsivo
        final horizontalPadding = isDesktop ? 80.0 : isTablet ? 40.0 : 20.0;
        final verticalPadding = isDesktop ? 80.0 : isTablet ? 60.0 : 40.0;
        
        // Tamanhos de fonte responsivos
        final titleFontSize = isDesktop ? 48.0 : isTablet ? 36.0 : 28.0;
        final subtitleFontSize = isDesktop ? 16.0 : isTablet ? 14.0 : 12.0;
        final descriptionFontSize = isDesktop ? 18.0 : isTablet ? 16.0 : 14.0;
        
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, 
            vertical: verticalPadding
          ),
          color: const Color(0xFF1A1A2E),
          child: Column(
            children: [
              // Título da seção
              Text(
                AppStrings.companyValuesTitle,
                style: TextStyle(
                  color: const Color(0xFF2196F3),
                  fontSize: subtitleFontSize,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              
              const SizedBox(height: 16),
              
              Text(
                AppStrings.companyValuesSubtitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 16),
              
              Text(
                AppStrings.companyValuesDescription,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: descriptionFontSize,
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
              
              SizedBox(height: isDesktop ? 80 : 60),
              
              // Grid dos 7 princípios responsivo
              isDesktop 
                ? _buildDesktopGrid(context)
                : isTablet 
                  ? _buildTabletGrid(context)
                  : _buildMobileGrid(context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDesktopGrid(BuildContext context) {
    return Column(
      children: [
        // Primeira linha - 3 princípios
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildPrincipleCard(
              context,
              '1',
              AppStrings.principle1Title,
              AppStrings.principle1Description,
              AppStrings.lightIconPath,
            ),
            _buildPrincipleCard(
              context,
              '2',
              AppStrings.principle2Title,
              AppStrings.principle2Description,
              AppStrings.checkIconPath,
            ),
            _buildPrincipleCard(
              context,
              '3',
              AppStrings.principle3Title,
              AppStrings.principle3Description,
              AppStrings.gaugeIconPath,
            ),
          ],
        ),
        
        const SizedBox(height: 40),
        
        // Segunda linha - 3 princípios
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildPrincipleCard(
              context,
              '4',
              AppStrings.principle4Title,
              AppStrings.principle4Description,
              AppStrings.eyeIconPath,
            ),
            _buildPrincipleCard(
              context,
              '5',
              AppStrings.principle5Title,
              AppStrings.principle5Description,
              AppStrings.handshakeIconPath,
            ),
            _buildPrincipleCard(
              context,
              '6',
              AppStrings.principle6Title,
              AppStrings.principle6Description,
              AppStrings.arrowIconPath,
            ),
          ],
        ),
        
        const SizedBox(height: 40),
        
        // Terceira linha - 1 princípio centralizado
        Center(
          child: _buildPrincipleCard(
            context,
            '7',
            AppStrings.principle7Title,
            AppStrings.principle7Description,
            AppStrings.rocketIconPath,
          ),
        ),
      ],
    );
  }

  Widget _buildTabletGrid(BuildContext context) {
    return Column(
      children: [
        // Primeira linha - 2 princípios
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildPrincipleCard(
              context,
              '1',
              AppStrings.principle1Title,
              AppStrings.principle1Description,
              AppStrings.lightIconPath,
            ),
            _buildPrincipleCard(
              context,
              '2',
              AppStrings.principle2Title,
              AppStrings.principle2Description,
              AppStrings.checkIconPath,
            ),
          ],
        ),
        
        const SizedBox(height: 30),
        
        // Segunda linha - 2 princípios
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildPrincipleCard(
              context,
              '3',
              AppStrings.principle3Title,
              AppStrings.principle3Description,
              AppStrings.gaugeIconPath,
            ),
            _buildPrincipleCard(
              context,
              '4',
              AppStrings.principle4Title,
              AppStrings.principle4Description,
              AppStrings.eyeIconPath,
            ),
          ],
        ),
        
        const SizedBox(height: 30),
        
        // Terceira linha - 2 princípios
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildPrincipleCard(
              context,
              '5',
              AppStrings.principle5Title,
              AppStrings.principle5Description,
              AppStrings.handshakeIconPath,
            ),
            _buildPrincipleCard(
              context,
              '6',
              AppStrings.principle6Title,
              AppStrings.principle6Description,
              AppStrings.arrowIconPath,
            ),
          ],
        ),
        
        const SizedBox(height: 30),
        
        // Quarta linha - 1 princípio centralizado
        Center(
          child: _buildPrincipleCard(
            context,
            '7',
            AppStrings.principle7Title,
            AppStrings.principle7Description,
            AppStrings.rocketIconPath,
          ),
        ),
      ],
    );
  }

  Widget _buildMobileGrid(BuildContext context) {
    return Column(
      children: [
        _buildPrincipleCard(
          context,
          '1',
          AppStrings.principle1Title,
          AppStrings.principle1Description,
          AppStrings.lightIconPath,
        ),
        const SizedBox(height: 20),
        _buildPrincipleCard(
          context,
          '2',
          AppStrings.principle2Title,
          AppStrings.principle2Description,
          AppStrings.checkIconPath,
        ),
        const SizedBox(height: 20),
        _buildPrincipleCard(
          context,
          '3',
          AppStrings.principle3Title,
          AppStrings.principle3Description,
          AppStrings.gaugeIconPath,
        ),
        const SizedBox(height: 20),
        _buildPrincipleCard(
          context,
          '4',
          AppStrings.principle4Title,
          AppStrings.principle4Description,
          AppStrings.eyeIconPath,
        ),
        const SizedBox(height: 20),
        _buildPrincipleCard(
          context,
          '5',
          AppStrings.principle5Title,
          AppStrings.principle5Description,
          AppStrings.handshakeIconPath,
        ),
        const SizedBox(height: 20),
        _buildPrincipleCard(
          context,
          '6',
          AppStrings.principle6Title,
          AppStrings.principle6Description,
          AppStrings.arrowIconPath,
        ),
        const SizedBox(height: 20),
        _buildPrincipleCard(
          context,
          '7',
          AppStrings.principle7Title,
          AppStrings.principle7Description,
          AppStrings.rocketIconPath,
        ),
      ],
    );
  }

  Widget _buildPrincipleCard(
    BuildContext context,
    String number,
    String title,
    String description,
    dynamic icon,
  ) {
    return PrincipleCard(
      number: number,
      title: title,
      description: description,
      icon: icon,
    );
  }
}

class PrincipleCard extends StatefulWidget {
  final String number;
  final String title;
  final String description;
  final dynamic icon; // Pode ser IconData ou String (path)

  const PrincipleCard({
    super.key,
    required this.number,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  State<PrincipleCard> createState() => _PrincipleCardState();
}

class _PrincipleCardState extends State<PrincipleCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 1200;
        final isTablet = constraints.maxWidth > 768;
        
        // Tamanhos responsivos do card
        final cardWidth = isDesktop ? 300.0 : isTablet ? 280.0 : double.infinity;
        final cardHeight = isDesktop ? 280.0 : isTablet ? 260.0 : 240.0;
        final padding = isDesktop ? 24.0 : isTablet ? 20.0 : 16.0;
        final iconSize = isDesktop ? 60.0 : isTablet ? 50.0 : 40.0;
        
        return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: cardWidth,
            height: cardHeight,
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
              color: _isHovered 
                  ? const Color(0xFF2196F3) 
                  : Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: _isHovered 
                    ? const Color(0xFF2196F3)
                    : Colors.white.withOpacity(0.2),
                width: 1,
              ),
            ),
            transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Número e ícone
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Número
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: _isHovered 
                            ? Colors.white.withOpacity(0.2)
                            : const Color(0xFF2196F3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          widget.number,
                          style: TextStyle(
                            color: _isHovered ? Colors.white : Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    
                    // Ícone
                    widget.icon is String 
                      ? Image.asset(
                          widget.icon,
                          width: iconSize,
                          height: iconSize,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.error,
                              color: _isHovered 
                                  ? Colors.white 
                                  : const Color(0xFF2196F3),
                              size: iconSize * 0.5,
                            );
                          },
                        )
                      : Icon(
                          widget.icon,
                          color: _isHovered 
                              ? Colors.white 
                              : const Color(0xFF2196F3),
                          size: iconSize * 0.5,
                        ),
                  ],
                ),
                
                const SizedBox(height: 24),
                
                // Título
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 200),
                  style: TextStyle(
                    color: _isHovered ? Colors.white : Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                  child: Text(widget.title),
                ),
                
                const SizedBox(height: 16),
                
                // Descrição
                Expanded(
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    style: TextStyle(
                      color: _isHovered 
                          ? Colors.white.withOpacity(0.9)
                          : Colors.white.withOpacity(0.7),
                      fontSize: 16,
                      height: 1.5,
                    ),
                    child: Text(widget.description),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
