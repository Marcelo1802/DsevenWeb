import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import '../common/dseven_logo.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFFFFFFFF), // Branco à esquerda
            Color.fromARGB(255, 255, 255, 255), // Azul à direita
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          children: [
            // Logo à esquerda
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 8, 0, 0).withOpacity(0.1),
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                AppStrings.logoAssetPath,
                fit: BoxFit.contain,
              ),
            ),
            
            // Logo Dseven centralizado
            Expanded(
              child: Center(
                child: DsevenLogo(
                  height: 50,
                ),
              ),
            ),
            
            // Redes sociais e botão à direita
            Row(
              children: [
                // Instagram
                _buildSocialIconButton(
                  iconPath: AppStrings.instagramIconPath,
                  onPressed: () {
                    // TODO: Abrir Instagram
                  },
                ),
                // LinkedIn
                _buildSocialIconButton(
                  iconPath: AppStrings.linkedinIconPath,
                  onPressed: () {
                    // TODO: Abrir LinkedIn
                  },
                ),
                // Facebook
                _buildSocialIconButton(
                  iconPath: AppStrings.facebookIconPath,
                  onPressed: () {
                    // TODO: Abrir Facebook
                  },
                ),
                const SizedBox(width: 16),
                // Botão Entre em Contato
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 119, 255), // azul como na imagem
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: const Text(
                    'ENTRE EM CONTATO',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIconButton({
    required String iconPath,
    required VoidCallback onPressed,
  }) {
    return AnimatedSocialIcon(
      iconPath: iconPath,
      onPressed: onPressed,
    );
  }
}

class AnimatedSocialIcon extends StatefulWidget {
  final String iconPath;
  final VoidCallback onPressed;

  const AnimatedSocialIcon({
    super.key,
    required this.iconPath,
    required this.onPressed,
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
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
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
                      size: 20,
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