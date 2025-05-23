import 'package:mdk_home/pages/04_about/widgets/index.dart';
import 'package:mdk_home/pages/04_about/widgets/1_about/introduce.dart';
import 'package:flutter/material.dart';
import 'package:mdk_home/widgets/index.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      children: [
        const SectionTitle(sectionTitle: '회사소개', selectedSub: '회사개요'),
        Introduce(),
        History(),
        Partners(),
        SizedBox(height: 20),
        Footer(),
      ],
    );
  }
}
