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

class DsevenHomeView extends StatefulWidget {
  const DsevenHomeView({super.key});

  @override
  State<DsevenHomeView> createState() => _DsevenHomeViewState();
}

class _DsevenHomeViewState extends State<DsevenHomeView> {
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
