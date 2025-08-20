import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Espaçador esquerdo
          Expanded(child: Container()),
          
          // Logo Dseven no centro
          Text(
            'Dseven',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2196F3),
            ),
          ),
          
          // Social Media Icons e Botão de Contato
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              // Instagram
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.camera_alt,
                  color: Colors.grey,
                ),
              ),
              // LinkedIn
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.business,
                  color: Colors.grey,
                ),
              ),
              // Facebook
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.facebook,
                  color: Colors.grey,
                ),
              ),
                const SizedBox(width: 16),
                // Botão Entre em Contato
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('ENTRE EM CONTATO'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
