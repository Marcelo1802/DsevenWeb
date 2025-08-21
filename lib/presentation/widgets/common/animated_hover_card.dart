import 'package:flutter/material.dart';

class AnimatedHoverCard extends StatefulWidget {
  final Widget child;
  final Duration animationDuration;
  final Color hoverColor;
  final Color defaultColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final double? elevation;
  final VoidCallback? onTap;

  const AnimatedHoverCard({
    super.key,
    required this.child,
    this.animationDuration = const Duration(milliseconds: 200),
    this.hoverColor = const Color(0xFF2196F3),
    this.defaultColor = Colors.white,
    this.borderRadius,
    this.padding,
    this.elevation,
    this.onTap,
  });

  @override
  State<AnimatedHoverCard> createState() => _AnimatedHoverCardState();
}

class _AnimatedHoverCardState extends State<AnimatedHoverCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _hoverController;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _colorAnimation = ColorTween(
      begin: widget.defaultColor,
      end: widget.hoverColor,
    ).animate(CurvedAnimation(
      parent: _hoverController,
      curve: Curves.easeInOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.02,
    ).animate(CurvedAnimation(
      parent: _hoverController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _hoverController.dispose();
    super.dispose();
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });

    if (isHovered) {
      _hoverController.forward();
    } else {
      _hoverController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _hoverController,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: AnimatedContainer(
                duration: widget.animationDuration,
                padding: widget.padding,
                decoration: BoxDecoration(
                  color: _isHovered ? widget.hoverColor : widget.defaultColor,
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(_isHovered ? 0.15 : 0.08),
                      blurRadius: _isHovered ? 15 : 8,
                      offset: Offset(0, _isHovered ? 6 : 3),
                    ),
                  ],
                ),
                child: widget.child,
              ),
            );
          },
        ),
      ),
    );
  }
}
