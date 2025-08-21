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

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
