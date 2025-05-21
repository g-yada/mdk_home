import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:mdk_home/common/index.dart';
import 'package:mdk_home/widgets/button.dart';
import 'package:url_launcher/url_launcher.dart';

class Introduce extends StatelessWidget {
  const Introduce({super.key});

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse(
      'https://drive.usercontent.google.com/download?id=1m_Z_QdDiYhhOjRFiaEj6ueuyBxfnL1Q7',
    );
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

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
          top: 50,
          left: 0,
          right: 0,
          child: Container(
            width: 500,
            child: Center(
              child: SizedBox(
                width: 500,
                height: 500,
                child: Image.asset(
                  'assets/img/logo_big.webp',
                  opacity: const AlwaysStoppedAnimation(0.1),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(right: 28, top: 120, bottom: 120),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
          top: 40,
          left: 0,
          right: 0,
          child: Container(
            width: 300,
            child: Center(
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
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
          top: 65,
          left: 0,
          right: 0,
          child: Container(
            width: 300,
            child: Center(
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
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Media + Design + Knowledge',
          textAlign: TextAlign.center,
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
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Column(
      children: [
        Text(
          '''MDK는 2010년부터 15년간 스튜디오 제작 시스템에서 첨단 교육 시스템까지
1,000건이 넘는 다양한 레퍼런스와 기술 노하우를 축적한 에듀테크 기업입니다.
시대 변화에 발맞춰, 지속적인 연구개발과 기술 혁신을 바탕으로 공간의 한계를 넘어
가능성을 디자인하며 새로운 미래를 열어가고 있습니다.''',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getValueForScreenType(
              context: context,
              mobile: 14,
              tablet: 15,
              desktop: 16,
            ),
            fontFamily: 'Paperlogy',
            fontWeight: FontWeight.w400,
            color: PLAIN_COLOR,
            height: 1.8,
          ),
        ),
        SizedBox(height: 60),
        RedButton(buttonName: '회사소개서 다운로드', path: '', onTap: _launchUrl),
      ],
    );
  }
}
