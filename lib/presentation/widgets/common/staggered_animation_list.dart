import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class StaggeredAnimationList extends StatefulWidget {
  final List<Widget> children;
  final Duration initialDelay;
  final Duration itemDelay;
  final Duration animationDuration;
  final Curve curve;
  final double staggerOffset;

  const StaggeredAnimationList({
    super.key,
    required this.children,
    this.initialDelay = const Duration(milliseconds: 300),
    this.itemDelay = const Duration(milliseconds: 200),
    this.animationDuration = const Duration(milliseconds: 800),
    this.curve = Curves.bounceOut,
    this.staggerOffset = 50.0,
  });

  @override
  State<StaggeredAnimationList> createState() => _StaggeredAnimationListState();
}

class _StaggeredAnimationListState extends State<StaggeredAnimationList>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<Offset>> _slideAnimations;
  late List<Animation<double>> _fadeAnimations;
  late List<Animation<double>> _scaleAnimations;
  bool _hasAnimated = false;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    // Não iniciar animação automaticamente
  }

  void _initializeAnimations() {
    _controllers = List.generate(
      widget.children.length,
      (index) => AnimationController(
        duration: widget.animationDuration,
        vsync: this,
      ),
    );

    _slideAnimations = _controllers.map((controller) {
      return Tween<Offset>(
        begin: const Offset(0, -3.0), // Caindo de bem mais alto
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: controller,
        curve: widget.curve,
      ));
    }).toList();

    _fadeAnimations = _controllers.map((controller) {
      return Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ));
    }).toList();

    _scaleAnimations = _controllers.map((controller) {
      return Tween<double>(
        begin: 0.3, // Começar pequeno
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: controller,
        curve: widget.curve,
      ));
    }).toList();
  }

  void _startStaggeredAnimations() async {
    if (_hasAnimated) return; // Só animar uma vez
    _hasAnimated = true;
    
    await Future.delayed(widget.initialDelay);

    for (int i = 0; i < _controllers.length; i++) {
      if (mounted) {
        _controllers[i].forward();
        if (i < _controllers.length - 1) {
          await Future.delayed(widget.itemDelay);
        }
      }
    }
  }

  void _onVisibilityChanged(bool isVisible) {
    if (isVisible && !_hasAnimated) {
      _startStaggeredAnimations();
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('staggered_animation_${widget.hashCode}'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.3) { // 30% visível
          _onVisibilityChanged(true);
        }
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
        // Responsividade: adaptar layout baseado na largura
        final isDesktop = constraints.maxWidth > 1200;
        final isTablet = constraints.maxWidth > 768;
        
        if (isDesktop) {
          // Desktop: 3 cards em linha com efeito escada
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(widget.children.length, (index) {
              final staggerHeight = index * widget.staggerOffset;
              
                              return Expanded(
                  child: AnimatedBuilder(
                    animation: _controllers[index],
                    builder: (context, child) {
                      return SlideTransition(
                        position: _slideAnimations[index],
                        child: ScaleTransition(
                          scale: _scaleAnimations[index],
                          child: FadeTransition(
                            opacity: _fadeAnimations[index],
                            child: Container(
                              margin: EdgeInsets.only(
                                left: index > 0 ? 20 : 0,
                                right: index < widget.children.length - 1 ? 20 : 0,
                                bottom: staggerHeight,
                              ),
                              child: widget.children[index],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
            }),
          );
        } else if (isTablet) {
          // Tablet: 2 cards por linha, depois 1
          return Column(
            children: [
              Row(
                children: [
                  for (int i = 0; i < 2 && i < widget.children.length; i++)
                    Expanded(
                      child: AnimatedBuilder(
                        animation: _controllers[i],
                        builder: (context, child) {
                          return SlideTransition(
                            position: _slideAnimations[i],
                            child: FadeTransition(
                              opacity: _fadeAnimations[i],
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: i > 0 ? 10 : 0,
                                  right: i < 1 ? 10 : 0,
                                ),
                                child: widget.children[i],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
              if (widget.children.length > 2) ...[
                const SizedBox(height: 40),
                Center(
                  child: SizedBox(
                    width: constraints.maxWidth * 0.5,
                    child: AnimatedBuilder(
                      animation: _controllers[2],
                      builder: (context, child) {
                        return SlideTransition(
                          position: _slideAnimations[2],
                          child: FadeTransition(
                            opacity: _fadeAnimations[2],
                            child: widget.children[2],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ],
          );
        } else {
          // Mobile: 1 card por linha
          return Column(
            children: List.generate(widget.children.length, (index) {
              return AnimatedBuilder(
                animation: _controllers[index],
                builder: (context, child) {
                  return SlideTransition(
                    position: _slideAnimations[index],
                    child: FadeTransition(
                      opacity: _fadeAnimations[index],
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                          bottom: index < widget.children.length - 1 ? 20 : 0,
                        ),
                        child: widget.children[index],
                      ),
                    ),
                  );
                },
              );
            }),
          );
        }
        },
      ),
    );
  }
}
