import 'package:mdk_home/common/color.dart';
import 'package:flutter/material.dart';
import 'package:mdk_home/widgets/index.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HybridLearningIntro extends StatelessWidget {
  const HybridLearningIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _buildMobile(context),
      tablet: (context) => _buildTablet(context),
      desktop: (context) => _buildDesktop(context),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img/studio_intro.webp'),
          fit: BoxFit.fitHeight,
          alignment: Alignment.centerRight,
          colorFilter: ColorFilter.mode(
            Colors.white.withAlpha(100),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 120),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(context),
            SizedBox(height: 32),
            _buildDescription(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTablet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img/studio_intro.webp'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.white.withAlpha(100),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(context),
            SizedBox(height: 24),
            _buildDescription(context),
          ],
        ),
      ),
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(context),
            SizedBox(height: 16),
            Image.asset('assets/img/studio_intro.webp', fit: BoxFit.cover),
            SizedBox(height: 16),
            _buildDescription(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '―  형태를 넘어, 흐름을 설계하다  ― ',
          style: TextStyle(
            fontSize: getValueForScreenType(
              context: context,
              mobile: 18,
              tablet: 20,
              desktop: 24,
            ),
            fontFamily: 'Paperlogy',
            fontWeight: FontWeight.w600,
            color: Colors.white,
            backgroundColor: PLAIN_COLOR,
          ),
        ),
        SizedBox(height: 12),
        Text.rich(
          TextSpan(
            text: '다양한 학습과 협업이 유기적으로 이어지는 ',
            style: TextStyle(
              fontSize: getValueForScreenType(
                context: context,
                mobile: 22,
                tablet: 24,
                desktop: 28,
              ),
              fontFamily: 'Paperlogy',
              fontWeight: FontWeight.w700,
              color: PLAIN_COLOR,
            ),
            children: [
              TextSpan(
                text: '\n복합 학습 공간 ',
                style: TextStyle(
                  fontSize: getValueForScreenType(
                    context: context,
                    mobile: 22,
                    tablet: 24,
                    desktop: 28,
                  ),
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w700,
                  color: PRIMARY_COLOR,
                ),
              ),
              TextSpan(
                text: '구축',
                style: TextStyle(
                  fontSize: getValueForScreenType(
                    context: context,
                    mobile: 22,
                    tablet: 24,
                    desktop: 28,
                  ),
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w700,
                  color: PLAIN_COLOR,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      '''강의, 토론, 발표, 협업 등 다양한 활동이 물리적 제약 없이 하나의 공간 안에서 연결되는 융합형 학습 환경을 설계합니다.
복수의 활동이 동시에 자연스럽고 유기적으로 진행될 수 있도록, 공간을 최적화하고 기술 인프라를 통합합니다.
또한 고객의 교육 목적과 운영 방식, 해당 장소의 물리적 조건과 활용 빈도에 따라 
공간 구성과 기능을 유연하게 조정하여 실제 운용에서의 편의성과 몰입도를 극대화합니다.''',
      style: TextStyle(
        fontSize: getValueForScreenType(
          context: context,
          mobile: 14,
          tablet: 15,
          desktop: 16,
        ),
        fontFamily: 'Paperlogy',
        color: PLAIN_COLOR,
        height: 1.8,
      ),
    );
  }
}
