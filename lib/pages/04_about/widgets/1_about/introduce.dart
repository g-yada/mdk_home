import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:mdk_home/common/index.dart';

class Introduce extends StatelessWidget {
  const Introduce({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _buildMobile(context),
      tablet: (context) => _buildTablet(context),
      desktop: (context) => _buildDesktop(context),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 28,
          bottom: 28,
          child: SizedBox(
            width: 400,
            height: 400,
            child: Image.asset(
              'assets/img/logo_big.webp',
              opacity: const AlwaysStoppedAnimation(0.1),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(right: 28, top: 120, bottom: 120),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildTitle(context),
                SizedBox(height: 32),
                _buildDescription(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTablet(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 20,
          bottom: 20,
          child: SizedBox(
            width: 300,
            height: 300,
            child: Image.asset(
              'assets/img/logo_big.webp',
              opacity: const AlwaysStoppedAnimation(0.1),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 500,
            padding: const EdgeInsets.only(right: 40, top: 80, bottom: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildTitle(context),
                SizedBox(height: 24),
                _buildDescription(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 16,
          bottom: 16,
          child: SizedBox(
            width: 200,
            height: 200,
            child: Image.asset(
              'assets/img/logo_big.webp',
              opacity: const AlwaysStoppedAnimation(0.1),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(right: 16, top: 40, bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildTitle(context),
                SizedBox(height: 16),
                _buildDescription(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Media + Design + Knowledge',
          textAlign: TextAlign.end,
          style: TextStyle(
            fontSize: getValueForScreenType(
              context: context,
              mobile: 18,
              tablet: 20,
              desktop: 24,
            ),
            fontFamily: 'Paperlogy',
            fontWeight: FontWeight.w600,
            color: PLAIN_COLOR,
          ),
        ),
        SizedBox(height: 12),
        Text.rich(
          TextSpan(
            text: '디자인과 첨단 기술의 융합으로 ',
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
                text: '공간',
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
                text: '과 ',
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
              TextSpan(
                text: '미래',
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
                text: '를 혁신한다',
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
          textAlign: TextAlign.end,
        ),
      ],
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      '''MDK는 2010년부터 15년간 스튜디오 제작 시스템에서 첨단 교육 시스템까지 1,000건이 넘는 다양한 레퍼런스와 기술 노하우를 축적한 에듀테크 기업입니다.
시대 변화에 발맞추어, 지속적인 연구개발과 기술 혁신을 바탕으로 공간의 한계를 넘어 가능성을 디자인하며 새로운 미래를 열어가고 있습니다.''',
      textAlign: TextAlign.end,
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
