import 'package:flutter/material.dart';
import 'package:mdk_home/widgets/index.dart';
import 'widgets/index.dart';
import 'package:mdk_home/common/index.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      scrollController: scrollController,
      children: [
        Container(key: ScrollService.heroKey, child: HeroSection()),
        Container(key: ScrollService.coreKey, child: ContentSection()),
        LectureroomSection(),
        OnetouchSection(),
        AiotSection(),
        DigitaltwinSection(),
        Footer(),
      ],
    );
  }
}
