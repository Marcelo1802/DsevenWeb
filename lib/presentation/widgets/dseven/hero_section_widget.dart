import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';

class HeroSectionWidget extends StatelessWidget {
  const HeroSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 1200;
        final isTablet = constraints.maxWidth > 768;
        
        // Tamanhos responsivos
        final sectionHeight = isDesktop ? 700.0 : isTablet ? 600.0 : 500.0;
        final horizontalPadding = isDesktop ? 80.0 : isTablet ? 40.0 : 20.0;
        final verticalPadding = isDesktop ? 60.0 : isTablet ? 40.0 : 30.0;
        final titleFontSize = isDesktop ? 58.0 : isTablet ? 42.0 : 32.0;
        final descriptionFontSize = isDesktop ? 20.0 : isTablet ? 18.0 : 16.0;
        final buttonFontSize = isDesktop ? 18.0 : isTablet ? 16.0 : 14.0;
        
        return Container(
          height: sectionHeight,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/banner.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.4),
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, 
                vertical: verticalPadding
              ),
              child: isDesktop 
                ? Row(
                    children: [
                      // Lado esquerdo com o conteúdo
                      Expanded(
                        flex: 6,
                        child: _buildContent(context, titleFontSize, descriptionFontSize, buttonFontSize),
                      ),
                      // Lado direito (espaçador)
                      const Expanded(
                        flex: 4,
                        child: SizedBox(),
                      ),
                    ],
                  )
                : _buildContent(context, titleFontSize, descriptionFontSize, buttonFontSize),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, double titleFontSize, double descriptionFontSize, double buttonFontSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Título Principal com destaque
        Text(
          AppStrings.heroTitle,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            fontSize: titleFontSize,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            height: 1.2,
            letterSpacing: 1,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.8),
                offset: const Offset(4, 4),
                blurRadius: 12,
              ),
              Shadow(
                color: const Color(0xFF2196F3).withOpacity(0.6),
                offset: const Offset(-2, -2),
                blurRadius: 20,
              ),
              Shadow(
                color: Colors.white.withOpacity(0.4),
                offset: const Offset(1, 1),
                blurRadius: 5,
              ),
            ],
          ),
          textAlign: TextAlign.left,
        ),
        
        SizedBox(height: titleFontSize * 0.5),
        
        // Descrição com destaque
        Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.15),
                Colors.white.withOpacity(0.08),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
              BoxShadow(
                color: const Color(0xFF2196F3).withOpacity(0.2),
                blurRadius: 25,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Text(
            AppStrings.heroDescription,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white,
              fontSize: descriptionFontSize,
              height: 1.6,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.7),
                  offset: const Offset(2, 2),
                  blurRadius: 6,
                ),
                Shadow(
                  color: const Color(0xFF2196F3).withOpacity(0.5),
                  offset: const Offset(-1, -1),
                  blurRadius: 10,
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
        
        SizedBox(height: titleFontSize * 0.8),
        
        // Botão CTA com destaque
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                  spreadRadius: 2,
                ),
                BoxShadow(
                  color: const Color(0xFF2196F3).withOpacity(0.6),
                  blurRadius: 30,
                  offset: const Offset(0, 0),
                  spreadRadius: 5,
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2196F3),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: titleFontSize * 0.7,
                  vertical: titleFontSize * 0.3,
                ),
                elevation: 10,
                shadowColor: const Color(0xFF2196F3).withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: Colors.white.withOpacity(0.3),
                    width: 1.5,
                  ),
                ),
                textStyle: TextStyle(
                  fontSize: buttonFontSize,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                  shadows: [
                    Shadow(
                      color: Colors.black54,
                      offset: const Offset(1, 1),
                      blurRadius: 3,
                    ),
                  ],
                ),
              ),
              child: Text(AppStrings.heroButtonText),
            ),
          ),
        ),
      ],
    );
  }
}
