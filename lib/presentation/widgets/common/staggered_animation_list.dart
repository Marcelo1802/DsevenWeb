import 'package:flutter/material.dart';

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
    this.itemDelay = const Duration(milliseconds: 150),
    this.animationDuration = const Duration(milliseconds: 600),
    this.curve = Curves.easeOutBack,
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

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startStaggeredAnimations();
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
        begin: const Offset(0, 1),
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
  }

  void _startStaggeredAnimations() async {
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

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(widget.children.length, (index) {
        // Calcula a altura do efeito escada (crescente)
        final staggerHeight = index * widget.staggerOffset;
        
        return AnimatedBuilder(
          animation: _controllers[index],
          builder: (context, child) {
            return SlideTransition(
              position: _slideAnimations[index],
              child: FadeTransition(
                opacity: _fadeAnimations[index],
                child: Container(
                  margin: EdgeInsets.only(
                    right: index < widget.children.length - 1 ? 40 : 0,
                    bottom: staggerHeight,
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
}
