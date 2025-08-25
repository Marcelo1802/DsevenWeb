import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import '../common/dseven_logo.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 1200;
        final isTablet = constraints.maxWidth > 768;
        
        // Padding responsivo
        final horizontalPadding = isDesktop ? 80.0 : isTablet ? 40.0 : 16.0;
        final verticalPadding = isDesktop ? 0.0 : isTablet ? 0.0 : 8.0;
        
        // Tamanhos responsivos
        final logoSize = isDesktop ? 60.0 : isTablet ? 50.0 : 36.0;
        final textHeight = isDesktop ? 50.0 : isTablet ? 40.0 : 28.0;
        final headerHeight = isDesktop ? 80.0 : isTablet ? 70.0 : 72.0; // Aumentado para mobile
        
        return Container(
          height: headerHeight,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFFFFFFFF), // Branco à esquerda
                Color.fromARGB(255, 255, 255, 255), // Branco à direita
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(20, 0, 0, 0),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding, 
              vertical: verticalPadding
            ),
            child: Row(
              children: [
                // Logo à esquerda
                Container(
                  height: logoSize,
                  width: logoSize,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(isDesktop ? 8 : 6),
                    color: const Color.fromARGB(255, 8, 0, 0).withOpacity(0.1),
                  ),
                  padding: EdgeInsets.all(isDesktop ? 8 : isTablet ? 6 : 4),
                  child: Image.asset(
                    AppStrings.logoAssetPath,
                    fit: BoxFit.contain,
                  ),
                ),
                
                // Logo Dseven centralizado
                Expanded(
                  child: Center(
                    child: DsevenLogo(
                      height: textHeight,
                    ),
                  ),
                ),
                
                // Redes sociais e botão à direita
                if (isTablet || isDesktop) ...[
                  Row(
                    children: [
                      // Instagram
                      _buildSocialIconButton(
                        iconPath: AppStrings.instagramIconPath,
                        onPressed: () {
                          // TODO: Abrir Instagram
                        },
                        isDesktop: isDesktop,
                      ),
                      // LinkedIn
                      _buildSocialIconButton(
                        iconPath: AppStrings.linkedinIconPath,
                        onPressed: () {
                          // TODO: Abrir LinkedIn
                        },
                        isDesktop: isDesktop,
                      ),
                      // Facebook
                      _buildSocialIconButton(
                        iconPath: AppStrings.facebookIconPath,
                        onPressed: () {
                          // TODO: Abrir Facebook
                        },
                        isDesktop: isDesktop,
                      ),
                      SizedBox(width: isDesktop ? 16 : 12),
                      // Botão Entre em Contato
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 0, 119, 255),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: isDesktop ? 20 : 16,
                            vertical: isDesktop ? 10 : 8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Text(
                          'ENTRE EM CONTATO',
                          style: TextStyle(
                            fontSize: isDesktop ? 12 : 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ] else ...[
                  // Menu hambúrguer para mobile
                  Builder(
                    builder: (context) => IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Color(0xFF2196F3),
                        size: 28,
                      ),
                      padding: const EdgeInsets.all(8),
                      constraints: const BoxConstraints(
                        minWidth: 40,
                        minHeight: 40,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSocialIconButton({
    required String iconPath,
    required VoidCallback onPressed,
    required bool isDesktop,
  }) {
    return AnimatedSocialIcon(
      iconPath: iconPath,
      onPressed: onPressed,
      isDesktop: isDesktop,
    );
  }
}

class AnimatedSocialIcon extends StatefulWidget {
  final String iconPath;
  final VoidCallback onPressed;
  final bool isDesktop;

  const AnimatedSocialIcon({
    super.key,
    required this.iconPath,
    required this.onPressed,
    required this.isDesktop,
  });

  @override
  State<AnimatedSocialIcon> createState() => _AnimatedSocialIconState();
}

class _AnimatedSocialIconState extends State<AnimatedSocialIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onEnter(PointerEvent details) {
    setState(() {
      _isHovered = true;
    });
    _animationController.forward();
  }

  void _onExit(PointerEvent details) {
    setState(() {
      _isHovered = false;
    });
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final iconSize = widget.isDesktop ? 40.0 : 36.0;
    final padding = widget.isDesktop ? 8.0 : 6.0;
    
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                width: iconSize,
                height: iconSize,
                padding: EdgeInsets.all(padding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(iconSize / 2),
                  border: Border.all(
                    color: const Color(0xFF2196F3).withOpacity(0.3),
                    width: 1,
                  ),
                  color: _isHovered
                      ? const Color(0xFF2196F3).withOpacity(0.1)
                      : Colors.transparent,
                ),
                child: Image.asset(
                  widget.iconPath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.error,
                      color: Colors.grey,
                      size: iconSize * 0.5,
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}