import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import '../common/dseven_logo.dart';

class FooterWidget extends StatefulWidget {
  const FooterWidget({super.key});

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 1200;
        final isTablet = constraints.maxWidth > 768;
        
        // Padding responsivo
        final horizontalPadding = isDesktop ? 80.0 : isTablet ? 40.0 : 20.0;
        final verticalPadding = isDesktop ? 60.0 : isTablet ? 40.0 : 30.0;
        
        return Container(
          color: const Color(0xFF2196F3),
          child: Column(
            children: [
              // Seção principal do footer
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, 
                  vertical: verticalPadding
                ),
                child: isDesktop 
                  ? _buildDesktopFooter(context)
                  : isTablet 
                    ? _buildTabletFooter(context)
                    : _buildMobileFooter(context),
              ),
              
              // Copyright responsivo
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, 
                  vertical: 20
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      color: const Color(0xFF2196F3).withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                ),
                child: isDesktop 
                  ? _buildDesktopCopyright(context)
                  : isTablet 
                    ? _buildTabletCopyright(context)
                    : _buildMobileCopyright(context),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDesktopFooter(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Mapa
        Expanded(
          flex: 4,
          child: Container(
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white.withOpacity(0.1),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.map,
                    color: Colors.white.withOpacity(0.7),
                    size: 60,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppStrings.googleMap,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'São Paulo, Brasil',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        
        const SizedBox(width: 60),
        
        // Informações de contato
        Expanded(
          flex: 3,
          child: _buildContactInfo(context),
        ),
        
        const SizedBox(width: 60),
        
        // Formulário de contato
        Expanded(
          flex: 4,
          child: _buildContactForm(context),
        ),
      ],
    );
  }

  Widget _buildTabletFooter(BuildContext context) {
    return Column(
      children: [
        // Primeira linha: Mapa e Contato
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Mapa
            Expanded(
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white.withOpacity(0.1),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.map,
                        color: Colors.white.withOpacity(0.7),
                        size: 50,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        AppStrings.googleMap,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'São Paulo, Brasil',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            const SizedBox(width: 30),
            
            // Informações de contato
            Expanded(
              child: _buildContactInfo(context),
            ),
          ],
        ),
        
        const SizedBox(height: 40),
        
        // Segunda linha: Formulário
        _buildContactForm(context),
      ],
    );
  }

  Widget _buildMobileFooter(BuildContext context) {
    return Column(
      children: [
        // Mapa
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white.withOpacity(0.1),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.map,
                  color: Colors.white.withOpacity(0.7),
                  size: 40,
                ),
                const SizedBox(height: 8),
                Text(
                  AppStrings.googleMap,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'São Paulo, Brasil',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
        
        const SizedBox(height: 30),
        
        // Informações de contato
        _buildContactInfo(context),
        
        const SizedBox(height: 30),
        
        // Formulário
        _buildContactForm(context),
      ],
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Headquarter
        const Text(
          AppStrings.headquarter,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        const SizedBox(height: 16),
        
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.location_on,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 8),
            const Expanded(
              child: Text(
                'Av. Nome Sobrenome,\n0000 - 0° Andar, São Paulo - SP',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 32),
        
        // Base Tech
        const Text(
          AppStrings.baseTech,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        const SizedBox(height: 16),
        
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.location_on,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 8),
            const Expanded(
              child: Text(
                'Av. Nome Sobrenome, 00 - numero\nandar, sala 00 - Bairro,\nUberlândia - MG',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 32),
        
        // Contato
        const Text(
          AppStrings.contactFooter,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        const SizedBox(height: 16),
        
        Row(
          children: [
            const Icon(
              Icons.email,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 8),
            const Text(
              'contato@Dseven.com.br',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 12),
        
        Row(
          children: [
            const Icon(
              Icons.phone,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 8),
            const Text(
              '34 99999 9999',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          AppStrings.scheduleConversation,
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        const SizedBox(height: 16),
        
        const Text(
          'Fale com o nosso time de especialistas para avaliarmos as melhores soluções para o seu negócio.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            height: 1.5,
          ),
        ),
        
        const SizedBox(height: 32),
        
        // Campo de email
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: AppStrings.emailPlaceholder,
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 16),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A2E),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Implementar envio do email
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                ),
                child: const Text(AppStrings.talkButton),
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 24),
        
        // Aviso
        Row(
          children: [
            Icon(
              Icons.warning,
              color: const Color.fromARGB(255, 255, 0, 0).withOpacity(0.7),
              size: 16,
            ),
            const SizedBox(width: 8),
            Text(
              AppStrings.returnMessage,
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 12,
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 32),
        
        // Redes sociais
        const Text(
          'Siga-nos',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        const SizedBox(height: 16),
        
        Row(
          children: [
            _buildSocialIcon(AppStrings.instagramIconPath),
            const SizedBox(width: 16),
            _buildSocialIcon(AppStrings.linkedinIconPath),
            const SizedBox(width: 16),
            _buildSocialIcon(AppStrings.facebookIconPath),
          ],
        ),
      ],
    );
  }

  Widget _buildDesktopCopyright(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                AppStrings.terms,
                style: TextStyle(
                  color: Color(0xFF2196F3),
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(width: 32),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Políticas',
                style: TextStyle(
                  color: Color(0xFF2196F3),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        
        // Logo Dseven
        DsevenLogo(
          height: 30,
        ),
        
        Row(
          children: [
            Text(
              '@2025 - ',
              style: TextStyle(
                color: const Color(0xFF2196F3).withOpacity(0.7),
                fontSize: 12,
              ),
            ),
            DsevenLogo(
              height: 12,
            ),
            Text(
              '| All Right Reserved',
              style: TextStyle(
                color: const Color(0xFF2196F3).withOpacity(0.7),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTabletCopyright(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    AppStrings.terms,
                    style: TextStyle(
                      color: Color(0xFF2196F3),
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Políticas',
                    style: TextStyle(
                      color: Color(0xFF2196F3),
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            
            // Logo Dseven
            DsevenLogo(
              height: 25,
            ),
          ],
        ),
        
        const SizedBox(height: 12),
        
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '@2025 - ',
                style: TextStyle(
                  color: const Color(0xFF2196F3).withOpacity(0.7),
                  fontSize: 10,
                ),
              ),
              DsevenLogo(
                height: 10,
              ),
              Text(
                '| All Right Reserved',
                style: TextStyle(
                  color: const Color(0xFF2196F3).withOpacity(0.7),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileCopyright(BuildContext context) {
    return Column(
      children: [
        // Logo Dseven
        Center(
          child: DsevenLogo(
            height: 20,
          ),
        ),
        
        const SizedBox(height: 12),
        
        // Links
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                AppStrings.terms,
                style: TextStyle(
                  color: Color(0xFF2196F3),
                  fontSize: 10,
                ),
              ),
            ),
            const SizedBox(width: 16),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Políticas',
                style: TextStyle(
                  color: Color(0xFF2196F3),
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 8),
        
        // Copyright
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '@2025 - ',
                style: TextStyle(
                  color: const Color(0xFF2196F3).withOpacity(0.7),
                  fontSize: 8,
                ),
              ),
              DsevenLogo(
                height: 8,
              ),
              Text(
                '| All Right Reserved',
                style: TextStyle(
                  color: const Color(0xFF2196F3).withOpacity(0.7),
                  fontSize: 8,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcon(String iconPath) {
    return InkWell(
      onTap: () {
        // TODO: Abrir link da rede social
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(8),
        child: Image.asset(
          iconPath,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Icon(
              Icons.error,
              color: Colors.white,
              size: 20,
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
