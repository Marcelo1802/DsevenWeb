import 'package:flutter/material.dart';
import 'project_carousel_widget.dart';
import '../../../core/constants/app_strings.dart';

class ProjectsSectionWidget extends StatelessWidget {
  const ProjectsSectionWidget({super.key});

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
        final subtitleFontSize = isDesktop ? 16.0 : isTablet ? 14.0 : 12.0;
        final descriptionFontSize = isDesktop ? 18.0 : isTablet ? 16.0 : 14.0;
        final videoTitleFontSize = isDesktop ? 36.0 : isTablet ? 28.0 : 24.0;
        final videoHeight = isDesktop ? 400.0 : isTablet ? 300.0 : 250.0;
        final spacing = isDesktop ? 80.0 : isTablet ? 60.0 : 40.0;
        
        return Container(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
          color: Colors.white,
          child: Column(
            children: [
              // Título da seção
              Text(
                AppStrings.projectsTitle,
                style: TextStyle(
                  color: const Color(0xFF2196F3),
                  fontSize: subtitleFontSize,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              
              SizedBox(height: isDesktop ? 16 : 12),
              
              Text(
                AppStrings.projectsSubtitle,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: titleFontSize,
                ),
                textAlign: TextAlign.center,
              ),
              
              SizedBox(height: isDesktop ? 16 : 12),
              
              Text(
                AppStrings.projectsDescription,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[600],
                  fontSize: descriptionFontSize,
                ),
                textAlign: TextAlign.center,
              ),
              
              SizedBox(height: spacing),
              
              // Seção de Projetos com Carousel
              const ProjectCarouselWidget(),
              
              SizedBox(height: spacing),
              
              // Banner do Podcast/Vídeo
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(isDesktop ? 40 : isTablet ? 30 : 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A2E),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Text(
                      AppStrings.podcastTitle,
                      style: TextStyle(
                        color: const Color(0xFF2196F3),
                        fontSize: subtitleFontSize,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                    
                    SizedBox(height: isDesktop ? 16 : 12),
                    
                    Text(
                      AppStrings.podcastSubtitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: videoTitleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    SizedBox(height: isDesktop ? 40 : isTablet ? 30 : 20),
                    
                    // Embed do YouTube (placeholder)
                    Container(
                      height: videoHeight,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.play_circle_filled,
                              color: const Color(0xFF2196F3),
                              size: isDesktop ? 80 : isTablet ? 60 : 50,
                            ),
                            SizedBox(height: isDesktop ? 16 : 12),
                            Text(
                              AppStrings.podcastVideoTitle,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: isDesktop ? 18 : isTablet ? 16 : 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}