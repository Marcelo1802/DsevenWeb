import 'package:flutter/material.dart';

class HeroSectionWidget extends StatelessWidget {
  const HeroSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
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
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
          child: Row(
            children: [
              // Lado esquerdo com o conteúdo
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Título Principal com destaque
                    Text(
                      'Innovative Software Solutions for Your Business',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 58,
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
                    
                    const SizedBox(height: 32),
                    
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
                        'Transform your ideas into reality with our expert software development services. We specialize in creating custom applications tailored to your unique business needs.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                          fontSize: 20,
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
                    
                    const SizedBox(height: 48),
                    
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 18,
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
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1,
                              shadows: [
                                Shadow(
                                  color: Colors.black54,
                                  offset: Offset(1, 1),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                          ),
                          child: const Text('Get a Free Consultation'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Lado direito (espaçador ou conteúdo futuro)
              const Expanded(
                flex: 4,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
