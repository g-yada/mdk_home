import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:mdk_home/common/index.dart';

class History extends StatelessWidget {
  const History({super.key});

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
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 100),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            PRIMARY_COLOR.withOpacity(0.02),
            PRIMARY_COLOR.withOpacity(0.04),
            PRIMARY_COLOR.withOpacity(0.02),
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            children: [
              _buildTitle(context),
              const SizedBox(height: 50),
              _buildTimeline(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTablet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            PRIMARY_COLOR.withOpacity(0.02),
            PRIMARY_COLOR.withOpacity(0.04),
            PRIMARY_COLOR.withOpacity(0.02),
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
      child: Column(
        children: [
          _buildTitle(context),
          const SizedBox(height: 50),
          _buildTimeline(context),
        ],
      ),
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            PRIMARY_COLOR.withOpacity(0.02),
            PRIMARY_COLOR.withOpacity(0.04),
            PRIMARY_COLOR.withOpacity(0.02),
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
      child: Column(
        children: [
          _buildTitle(context),
          const SizedBox(height: 50),
          _buildTimeline(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'MDK History',
            style: TextStyle(
              fontSize: getValueForScreenType(
                context: context,
                mobile: 24,
                tablet: 28,
                desktop: 32,
              ),
              fontFamily: 'Paperlogy',
              fontWeight: FontWeight.w700,
              color: PLAIN_COLOR,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: getValueForScreenType(
              context: context,
              mobile: 40,
              tablet: 50,
              desktop: 60,
            ),
            height: 2,
            color: PRIMARY_COLOR,
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline(BuildContext context) {
    final List<Map<String, String>> history = [
      {
        'year': '2025',
        'title': 'AI 기반 지능형 교육공간 구축',
        'content': 'AI 기술을 활용한 맞춤형 교육 환경 구축 및 운영',
      },
      {
        'year': '2024',
        'title': 'IoT 회의실, NDI를 활용한 코딩 PBL 강의실 구축',
        'content': 'NDI+ 솔루션 및 IoT 자동화 분야 확대',
      },
      {
        'year': '2022',
        'title': '기업 부설 연구부서 설립',
        'content': 'VR·AR·XR, IoT, 네트워크 기반 강의·강연·학습 시스템 R&D',
      },
      {
        'year': '2021',
        'title': '(주)엠디케이 법인 설립 · 정보통신공사업 등록',
        'content':
            'NDI와 IoT 자동화의 결합, NDI+ 솔루션 개발, NDI 스튜디오 구축, IoT 통합 컨트롤러 시스템 구축',
      },
      {
        'year': '2020',
        'title': '첨단 연구개발의 확대',
        'content': 'NDI 기술 연구 개발 및 디지털 트윈 설계 적용',
      },
      {
        'year': '2018',
        'title': '첨단 사업영역의 확대',
        'content': '전문 엔지니어링을 기반으로 한 이러닝 사업의 확대',
      },
      {
        'year': '2016',
        'title': '첨단 디지털 사업 강화',
        'content': 'VR 스튜디오, PBL·하이브리드 강의실 등 전문 에듀테크 사업',
      },
      {'year': '2010', 'title': '엠디케이 설립', 'content': ''},
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: history.length,
      itemBuilder: (context, index) {
        return TweenAnimationBuilder(
          duration: Duration(milliseconds: 800 + (index * 200)),
          tween: Tween<double>(begin: 0, end: 1),
          builder: (context, double value, child) {
            return Transform.translate(
              offset: Offset(0, 50 * (1 - value)),
              child: Opacity(opacity: value, child: child),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: getValueForScreenType(
                    context: context,
                    mobile: 80,
                    tablet: 100,
                    desktop: 120,
                  ),
                  child: Text(
                    history[index]['year']!,
                    style: TextStyle(
                      fontSize: getValueForScreenType(
                        context: context,
                        mobile: 20,
                        tablet: 24,
                        desktop: 28,
                      ),
                      fontFamily: 'Paperlogy',
                      fontWeight: FontWeight.w700,
                      color: PRIMARY_COLOR,
                    ),
                  ),
                ),
                Container(
                  width: 2,
                  height: getValueForScreenType(
                    context: context,
                    mobile: 40,
                    tablet: 50,
                    desktop: 60,
                  ),
                  color: PRIMARY_COLOR,
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        history[index]['title']!,
                        style: TextStyle(
                          fontSize: getValueForScreenType(
                            context: context,
                            mobile: 15,
                            tablet: 16,
                            desktop: 18,
                          ),
                          fontFamily: 'Paperlogy',
                          fontWeight: FontWeight.w700,
                          color: PLAIN_COLOR,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        history[index]['content']!,
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
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
