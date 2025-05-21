import 'package:flutter/material.dart';
import 'package:mdk_home/widgets/index.dart';
import 'package:mdk_home/pages/04_about/widgets/index.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      children: [
        const SectionTitle(sectionTitle: '회사소개', selectedSub: '포트폴리오'),
        const PortfolioItems(),
        const Footer(),
      ],
    );
  }
}
