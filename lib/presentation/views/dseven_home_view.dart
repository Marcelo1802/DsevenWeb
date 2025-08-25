import 'package:flutter/material.dart';
import '../widgets/dseven/header_widget.dart';
import '../widgets/dseven/hero_section_widget.dart';
import '../widgets/dseven/benefits_section_widget.dart';
import '../widgets/dseven/about_section_widget.dart';
import '../widgets/dseven/services_section_widget.dart';
import '../widgets/dseven/projects_section_widget.dart';
import '../widgets/dseven/clients_section_widget.dart';
import '../widgets/dseven/footer_widget.dart';
import '../widgets/common/process_card.dart';
import '../widgets/common/dseven_logo.dart';
import '../../core/constants/app_strings.dart';

class CroSoftenHomeView extends StatefulWidget {
  const CroSoftenHomeView({super.key});

  @override
  State<CroSoftenHomeView> createState() => _CroSoftenHomeViewState();
}

class _CroSoftenHomeViewState extends State<CroSoftenHomeView> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildMobileDrawer(),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: const Column(
          children: [
            HeaderWidget(),
            HeroSectionWidget(),
            BenefitsSectionWidget(),
            AboutSectionWidget(),
            ServicesSectionWidget(),
            ProjectsSectionWidget(),
            ClientsSectionWidget(),
            FooterWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileDrawer() {
    return Drawer(
      child: Container(
        color: const Color(0xFF1A1A2E),
        child: Column(
          children: [
            // Header do drawer com fundo branco
            Container(
              height: 120,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(20, 0, 0, 0),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFF2196F3).withOpacity(0.1),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      AppStrings.logoAssetPath,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: DsevenLogo(
                      height: 40,
                    ),
                  ),
                ],
              ),
            ),
            
            // Menu items
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildDrawerItem(
                    icon: Icons.home,
                    title: AppStrings.menuHome,
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(0);
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.info,
                    title: AppStrings.menuAbout,
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(3); // About section
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.build,
                    title: AppStrings.menuServices,
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(4); // Services section
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.work,
                    title: AppStrings.menuProjects,
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(5); // Projects section
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.contact_phone,
                    title: AppStrings.menuContact,
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(7); // Footer section
                    },
                  ),
                ],
              ),
            ),
            
            // Redes sociais no bottom
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    'Siga-nos nas redes sociais',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildSocialButton(
                        iconPath: AppStrings.instagramIconPath,
                        label: 'Instagram',
                        onTap: () {
                          // TODO: Abrir Instagram
                        },
                      ),
                      _buildSocialButton(
                        iconPath: AppStrings.linkedinIconPath,
                        label: 'LinkedIn',
                        onTap: () {
                          // TODO: Abrir LinkedIn
                        },
                      ),
                      _buildSocialButton(
                        iconPath: AppStrings.facebookIconPath,
                        label: 'Facebook',
                        onTap: () {
                          // TODO: Abrir Facebook
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // TODO: Abrir formulário de contato
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2196F3),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'ENTRE EM CONTATO',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: const Color(0xFF2196F3),
        size: 24,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      hoverColor: const Color(0xFF2196F3).withOpacity(0.1),
    );
  }

  Widget _buildSocialButton({
    required String iconPath,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFF2196F3).withOpacity(0.1),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: const Color(0xFF2196F3).withOpacity(0.3),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                iconPath,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.error,
                    color: const Color(0xFF2196F3),
                    size: 24,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  void _scrollToSection(int sectionIndex) {
    // TODO: Implementar scroll para seções específicas
    // Por enquanto, apenas fecha o drawer
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
