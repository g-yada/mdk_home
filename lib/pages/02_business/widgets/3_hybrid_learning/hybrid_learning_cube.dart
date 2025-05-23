import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:mdk_home/common/color.dart';

class HybridLearningCube extends StatelessWidget {
  const HybridLearningCube({super.key});

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '커넥티드 큐브',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Paperlogy',
                    fontWeight: FontWeight.w700,
                    color: PRIMARY_COLOR,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  '온·오프라인 소통이 유기적으로 이어지는 하이브리드 협업 환경',
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
                  '온·오프라인 참여자 간의 경계를 최소화하고, 모임·회의·협업에 특화된 상호작용 중심의 학습공간입니다.\n실시간 소통과 아이디어 공유가 원활히 이루어지도록 공간을 설계하고\n첨단 장비와 자동화 시스템을 통합하여 몰입도 높은 협업 경험을 제공합니다.',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Paperlogy',
                    fontWeight: FontWeight.w400,
                    color: PLAIN_COLOR,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 32),
                _buildFeature('대면 및 원격 소통에 최적화 된 공간 구성'),
                const SizedBox(height: 16),
                _buildFeature('올인원 화상회의시스템 지원'),
                const SizedBox(height: 16),
                _buildFeature('오프라인 화이트보드의 판서 내용을 AI카메라로 온라인 공유'),
                const SizedBox(height: 16),
                _buildFeature('IoT 기반 환경 제어'),
              ],
            ),
          ),
          const SizedBox(width: 60),
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
                  image: AssetImage('img/business/cube.webp'),
                  fit: BoxFit.cover,
                ),
              ),
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
                image: AssetImage('img/business/cube.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '커넥티드 큐브',
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w700,
                  color: PRIMARY_COLOR,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '온·오프라인 소통이 유기적으로 이어지는 하이브리드 협업 환경',
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
                '온·오프라인 참여자 간의 경계를 최소화하고, 모임·회의·협업에 특화된 상호작용 중심의 학습공간입니다.\n실시간 소통과 아이디어 공유가 원활히 이루어지도록 공간을 설계하고\n첨단 장비와 자동화 시스템을 통합하여 몰입도 높은 협업 경험을 제공합니다.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w400,
                  color: PLAIN_COLOR,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 28),
              _buildFeature('대면 및 원격 소통에 최적화 된 공간 구성'),
              const SizedBox(height: 14),
              _buildFeature('올인원 화상회의시스템 지원'),
              const SizedBox(height: 14),
              _buildFeature('오프라인 화이트보드의 판서 내용을 AI카메라로 온라인 공유'),
              const SizedBox(height: 14),
              _buildFeature('IoT 기반 환경 제어'),
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
                image: AssetImage('img/business/cube.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '커넥티드 큐브',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w700,
                  color: PRIMARY_COLOR,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '온·오프라인 소통이 유기적으로 이어지는 하이브리드 협업 환경',
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
                '온·오프라인 참여자 간의 경계를 최소화하고, 모임·회의·협업에 특화된 상호작용 중심의 학습공간입니다.\n실시간 소통과 아이디어 공유가 원활히 이루어지도록 공간을 설계하고\n첨단 장비와 자동화 시스템을 통합하여 몰입도 높은 협업 경험을 제공합니다.',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w400,
                  color: PLAIN_COLOR,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              _buildFeature('대면 및 원격 소통에 최적화 된 공간 구성'),
              const SizedBox(height: 12),
              _buildFeature('올인원 화상회의시스템 지원'),
              const SizedBox(height: 12),
              _buildFeature('오프라인 화이트보드의 판서 내용을 AI카메라로 온라인 공유'),
              const SizedBox(height: 12),
              _buildFeature('IoT 기반 환경 제어'),
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
