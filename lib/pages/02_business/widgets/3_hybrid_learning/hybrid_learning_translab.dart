import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:mdk_home/common/color.dart';

class HybridLearningTranslab extends StatelessWidget {
  const HybridLearningTranslab({super.key});

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
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 80),
      constraints: const BoxConstraints(maxWidth: 1500),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
                image: const DecorationImage(
                  image: AssetImage('img/business/translab.webp'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 60),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '디지털 트랜스 랩',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Paperlogy',
                    fontWeight: FontWeight.w700,
                    color: PRIMARY_COLOR,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  '아이디어에서 실현까지, 몰입형 메이커 스페이스',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Paperlogy',
                    fontWeight: FontWeight.w600,
                    color: PLAIN_COLOR,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  '기획부터 공유까지 전 과정을 한 공간 안에서 실현할 수 있는 창작을 위한 복합 공간입니다.\n학습, 토의는 물론 코딩, 3D 프린팅, 영상 촬영 및 편집, VR 콘텐츠 운용과 방송까지 지원하여 지식 습득과 결과물 창출이 연속적으로 이루어지는 실습 기반 환경을 제공합니다.',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Paperlogy',
                    fontWeight: FontWeight.w400,
                    color: PLAIN_COLOR,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 32),
                _buildFeature('기획 → 설계 → 실습 → 발표 → 콘텐츠 제작까지의 통합형 학습 흐름 지원'),
                const SizedBox(height: 16),
                _buildFeature('3D 프린터, VR 장비 등 각종 디지털 창작 인프라 제공'),
                const SizedBox(height: 16),
                _buildFeature('팀 기반 프로젝트 수행에 적합한 공간 구조와 장비 배치'),
                const SizedBox(height: 16),
                _buildFeature(
                  '컴퓨팅 사고력, 미디어 활용, 창의적 표현을 동시에 성장시킬 수 있는 실습 중심 환경',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTablet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 60),
      constraints: const BoxConstraints(maxWidth: 800),
      child: Column(
        children: [
          Container(
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
              image: const DecorationImage(
                image: AssetImage('img/business/translab.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '디지털 트랜스 랩',
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w700,
                  color: PRIMARY_COLOR,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '아이디어에서 실현까지, 몰입형 메이커 스페이스',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w600,
                  color: PLAIN_COLOR,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                '기획부터 공유까지 전 과정을 한 공간 안에서 실현할 수 있는 창작을 위한 복합 공간입니다.\n학습, 토의는 물론 코딩, 3D 프린팅, 영상 촬영 및 편집, VR 콘텐츠 운용과 방송까지 지원하여 지식 습득과 결과물 창출이 연속적으로 이루어지는 실습 기반 환경을 제공합니다.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w400,
                  color: PLAIN_COLOR,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 28),
              _buildFeature('기획 → 설계 → 실습 → 발표 → 콘텐츠 제작까지의 통합형 학습 흐름 지원'),
              const SizedBox(height: 14),
              _buildFeature('3D 프린터, VR 장비 등 각종 디지털 창작 인프라 제공'),
              const SizedBox(height: 14),
              _buildFeature('팀 기반 프로젝트 수행에 적합한 공간 구조와 장비 배치'),
              const SizedBox(height: 14),
              _buildFeature('컴퓨팅 사고력, 미디어 활용, 창의적 표현을 동시에 성장시킬 수 있는 실습 중심 환경'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      constraints: const BoxConstraints(maxWidth: 600),
      child: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
              image: const DecorationImage(
                image: AssetImage('img/business/translab.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '디지털 트랜스 랩',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w700,
                  color: PRIMARY_COLOR,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '아이디어에서 실현까지, 몰입형 메이커 스페이스',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w600,
                  color: PLAIN_COLOR,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                '기획부터 공유까지 전 과정을 한 공간 안에서 실현할 수 있는 창작을 위한 복합 공간입니다.\n학습, 토의는 물론 코딩, 3D 프린팅, 영상 촬영 및 편집, VR 콘텐츠 운용과 방송까지 지원하여 지식 습득과 결과물 창출이 연속적으로 이루어지는 실습 기반 환경을 제공합니다.',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w400,
                  color: PLAIN_COLOR,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              _buildFeature('기획 → 설계 → 실습 → 발표 → 콘텐츠 제작까지의 통합형 학습 흐름 지원'),
              const SizedBox(height: 12),
              _buildFeature('3D 프린터, VR 장비 등 각종 디지털 창작 인프라 제공'),
              const SizedBox(height: 12),
              _buildFeature('팀 기반 프로젝트 수행에 적합한 공간 구조와 장비 배치'),
              const SizedBox(height: 12),
              _buildFeature('컴퓨팅 사고력, 미디어 활용, 창의적 표현을 동시에 성장시킬 수 있는 실습 중심 환경'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeature(String text) {
    return Row(
      children: [
        Icon(Icons.check_circle_outline, color: PRIMARY_COLOR, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Paperlogy',
              color: PLAIN_COLOR,
            ),
          ),
        ),
      ],
    );
  }
}
