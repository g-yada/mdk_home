import 'package:mdk_home/pages/03_service/widgets/service_form.dart';
import 'package:flutter/material.dart';
import 'package:mdk_home/widgets/index.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      children: [
        const SectionTitle(sectionTitle: '고객 지원', hasSubMenu: false),
        ServiceForm(),
        Footer(),
      ],
    );
  }
}
