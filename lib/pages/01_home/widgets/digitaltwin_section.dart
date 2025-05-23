import 'package:flutter/material.dart';
import 'package:mdk_home/widgets/index.dart';
import 'breakpoints.dart';

class DigitaltwinSection extends StatelessWidget {
  const DigitaltwinSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (Breakpoints.isMobile(context) || Breakpoints.isTablet(context)) {
          return const TabletMobileDtwin();
        } else {
          return const DesktopDtwin();
        }
      },
    );
  }
}

class DesktopDtwin extends StatelessWidget {
  const DesktopDtwin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      padding: EdgeInsets.only(left: Breakpoints.getPadding(context)),
      decoration: const BoxDecoration(color: Colors.white),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Breakpoints.desktopContentWidth,
          ),
          child: Row(
            children: [
              Expanded(
                child: SlideInSection(
                  alignment: 'left',
                  children: [
                    Text.rich(
                      TextSpan(
                        text: '디지털 트윈',
                        style: TextStyle(
                          fontSize: 38,
                          fontFamily: 'Paperlogy',
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFD4373C),
                        ),
                        children: [
                          TextSpan(
                            text: '\n시뮬레이션 설계',
                            style: TextStyle(
                              fontSize: 38,
                              fontFamily: 'Paperlogy',
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '가상 물리엔진을 통해 2D 도면을 3D로 현실에 가깝게 구현하여,\n완성된 공간을 제안 단계에서 미리 체험할 수 있습니다.\n공간구성, 기자재 배치, 연결성을 꼼꼼히 사전 테스트하여 최적화된 공간을 제공합니다.',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Paperlogy',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 48),
              Expanded(
                child: Container(
                  height: 500,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/digital_twin_s.webp'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabletMobileDtwin extends StatelessWidget {
  const TabletMobileDtwin({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 400,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: Breakpoints.getPadding(context),
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('assets/img/digital_twin_s.webp'),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(color: Colors.white.withOpacity(0.8)),
        ),
        Align(
          alignment: Alignment.center,
          child: SlideInSection(
            children: [
              Text(
                '디지털 트윈',
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFD4373C),
                ),
              ),
              Text(
                '시뮬레이션 설계',
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Text(
                '가상 물리엔진을 통해 2D 도면을 3D로 현실에 가깝게 구현하여,\n완성된 공간을 제안 단계에서 미리 체험할 수 있습니다.\n공간구성, 기자재 배치, 연결성을 꼼꼼히 사전 테스트하여\n최적화된 공간을 제공합니다.',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Paperlogy',
                  color: Colors.black,
                  height: 1.8,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
