import 'package:mdk_home/pages/02_business/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:mdk_home/widgets/index.dart';

class HybridLearningPage extends StatelessWidget {
  const HybridLearningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      children: [
        const SectionTitle(sectionTitle: '사업분야', selectedSub: '복합학습공간'),
        HybridLearningIntro(),
        HybridLearningConference(),
        HybridLearningCube(),
        HybridLearningTranslab(),
        Footer(),
      ],
    );
  }
}
