import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import 'company_values_section_widget.dart';

class ClientsSectionWidget extends StatelessWidget {
  const ClientsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 1200;
        final isTablet = constraints.maxWidth > 768;
        
        // Tamanhos responsivos
        final horizontalPadding = isDesktop ? 80.0 : isTablet ? 40.0 : 20.0;
        final verticalPadding = isDesktop ? 60.0 : isTablet ? 40.0 : 30.0;
        final titleFontSize = isDesktop ? 16.0 : isTablet ? 14.0 : 12.0;
        final logoSize = isDesktop ? 140.0 : isTablet ? 120.0 : 100.0;
        final logoHeight = isDesktop ? 80.0 : isTablet ? 70.0 : 60.0;
        final iconSize = isDesktop ? 32.0 : isTablet ? 28.0 : 24.0;
        final textFontSize = isDesktop ? 12.0 : isTablet ? 11.0 : 10.0;
        
        return Column(
          children: [
            // Seção de Clientes
            Container(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
              color: Colors.grey[50],
              child: Column(
                children: [
                  Text(
                    AppStrings.clientsTrustTitle,
                    style: TextStyle(
                      color: const Color(0xFF2196F3),
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  SizedBox(height: isDesktop ? 60 : isTablet ? 40 : 30),
                  
                  // Logos dos clientes - Layout responsivo
                  if (isDesktop) ...[
                    // Desktop: 5 logos em linha
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildClientLogo(AppStrings.clientPortoSeguro, Icons.security, logoSize, logoHeight, iconSize, textFontSize),
                        _buildClientLogo(AppStrings.clientRedBull, Icons.sports_motorsports, logoSize, logoHeight, iconSize, textFontSize),
                        _buildClientLogo(AppStrings.clientGlobo, Icons.public, logoSize, logoHeight, iconSize, textFontSize),
                        _buildClientLogo(AppStrings.clientTim, Icons.signal_cellular_4_bar, logoSize, logoHeight, iconSize, textFontSize),
                        _buildClientLogo(AppStrings.clientCarrefour, Icons.shopping_cart, logoSize, logoHeight, iconSize, textFontSize),
                      ],
                    ),
                  ] else if (isTablet) ...[
                    // Tablet: 3 logos na primeira linha, 2 na segunda
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildClientLogo(AppStrings.clientPortoSeguro, Icons.security, logoSize, logoHeight, iconSize, textFontSize),
                            _buildClientLogo(AppStrings.clientRedBull, Icons.sports_motorsports, logoSize, logoHeight, iconSize, textFontSize),
                            _buildClientLogo(AppStrings.clientGlobo, Icons.public, logoSize, logoHeight, iconSize, textFontSize),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildClientLogo(AppStrings.clientTim, Icons.signal_cellular_4_bar, logoSize, logoHeight, iconSize, textFontSize),
                            _buildClientLogo(AppStrings.clientCarrefour, Icons.shopping_cart, logoSize, logoHeight, iconSize, textFontSize),
                          ],
                        ),
                      ],
                    ),
                  ] else ...[
                    // Mobile: 2 logos por linha
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildClientLogo(AppStrings.clientPortoSeguro, Icons.security, logoSize, logoHeight, iconSize, textFontSize),
                            _buildClientLogo(AppStrings.clientRedBull, Icons.sports_motorsports, logoSize, logoHeight, iconSize, textFontSize),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildClientLogo(AppStrings.clientGlobo, Icons.public, logoSize, logoHeight, iconSize, textFontSize),
                            _buildClientLogo(AppStrings.clientTim, Icons.signal_cellular_4_bar, logoSize, logoHeight, iconSize, textFontSize),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildClientLogo(AppStrings.clientCarrefour, Icons.shopping_cart, logoSize, logoHeight, iconSize, textFontSize),
                          ],
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            
            // Seção de Valores da Empresa (importada de outro widget)
            const CompanyValuesSectionWidget(),
          ],
        );
      },
    );
  }

  Widget _buildClientLogo(String name, IconData icon, double width, double height, double iconSize, double fontSize) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: iconSize,
            color: Colors.grey[700],
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
