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
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    color: Color.fromARGB(255, 0, 119, 246),
                    size: 24,
                  ),
                ),
                // LinkedIn
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.business_center_outlined,
                    color: Color.fromARGB(255, 0, 119, 246),
                    size: 24,
                  ),
                ),
                // Facebook
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.facebook_outlined,
                    color: Color.fromARGB(255, 0, 119, 246),
                    size: 24,
                  ),
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
}