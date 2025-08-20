import 'package:flutter/material.dart';
import 'project_carousel_widget.dart';

class ProjectsSectionWidget extends StatelessWidget {
  const ProjectsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
      color: Colors.white,
      child: Column(
        children: [
          // Título da seção
          Text(
            'RECENT WORK',
            style: TextStyle(
              color: const Color(0xFF2196F3),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          
          const SizedBox(height: 16),
          
          Text(
            'Innovative Projects, Amazing Results',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontSize: 48,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 16),
          
          Text(
            'Transforming ideas into successful digital solutions.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 80),
          
          // Seção de Projetos com Carousel
          const ProjectCarouselWidget(),
          
          const SizedBox(height: 80),
          
          // Banner do Podcast
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A2E),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Text(
                  'DSEVEN PODCAST',
                  style: TextStyle(
                    color: const Color(0xFF2196F3),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                
                const SizedBox(height: 16),
                
                const Text(
                  'Step by step guide to create an application.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                const SizedBox(height: 40),
                
                // Embed do YouTube (placeholder)
                Container(
                  height: 400,
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
                          size: 80,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Dseven PodCast - Step by step guide to create an application.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
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
  }
}