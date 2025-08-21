import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';

class DsevenLogo extends StatelessWidget {
  final double? height;
  final double? width;
  final BoxFit fit;
  final Color? color;

  const DsevenLogo({
    super.key,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Image.asset(
        'assets/TextDseven.png',
        height: height,
        width: width,
        fit: fit,
        filterQuality: FilterQuality.high,
        isAntiAlias: true,
        errorBuilder: (context, error, stackTrace) {
          print('❌ Erro ao carregar TextDseven.png: $error');
          // Fallback para texto caso a imagem não carregue
          return Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              border: Border.all(color: Colors.red, width: 2),
            ),
            child: Center(
              child: Text(
                'DSEVEN',
                style: TextStyle(
                  fontSize: height != null ? height! * 0.4 : 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1976D2),
                ),
              ),
            ),
          );
        },
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) {
            print('✅ TextDseven.png carregada com sucesso');
            return child;
          }
          return AnimatedOpacity(
            opacity: frame == null ? 0 : 1,
            duration: const Duration(milliseconds: 300),
            child: child,
          );
        },
      ),
    );
  }
}
