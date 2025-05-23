import 'package:flutter/material.dart';
import 'package:mdk_home/widgets/index.dart';
import 'breakpoints.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (Breakpoints.isMobile(context) || Breakpoints.isTablet(context)) {
          return TabletMobileHero();
        } else {
          return DesktopHero();
        }
      },
    );
  }
}

class DesktopHero extends StatelessWidget {
  const DesktopHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Breakpoints.getPadding(context),
      ),
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
                    Text(
                      'Media + Design + Knowledge',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Paperlogy',
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[500],
                      ),
                    ),
                    SizedBox(height: 16),
                    Text.rich(
                      TextSpan(
                        text: '스마트 캠퍼스',
                        style: TextStyle(
                          fontSize: 42,
                          fontFamily: 'Paperlogy',
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFD4373C),
                        ),
                        children: [
                          TextSpan(
                            text: '를 위한\n혁신적 교육 플랫폼',
                            style: TextStyle(
                              fontSize: 42,
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
                      'IoT, AI, 빅데이터, 디지털 트윈 등 최신기술을 바탕으로\n교육 생태계 내 모든 이해관계자를 연결하는 솔루션을 제공합니다',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Paperlogy',
                        height: 1.8,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 28),
                    RedButton(buttonName: '상담/문의하기', path: '/service'),
                  ],
                ),
              ),
              SizedBox(width: 48),
              Expanded(
                child: Container(
                  height: 500,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/hero_img.png'),
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

class TabletMobileHero extends StatelessWidget {
  const TabletMobileHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: Breakpoints.getPadding(context),
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('assets/img/hero_img.png'),
              fit: BoxFit.contain,
              alignment: Alignment.centerRight,
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
                'Media + Design + Knowledge',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[500],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: '스마트 캠퍼스',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Paperlogy',
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFD4373C),
                  ),
                  children: [
                    TextSpan(
                      text: '를 위한\n혁신적 교육 플랫폼',
                      style: TextStyle(
                        fontSize: 32,
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
                'IoT, AI, 빅데이터, 디지털 트윈 등 최신기술을 바탕으로\n교육 생태계 내 모든 이해관계자를 연결하는 솔루션을 제공합니다',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Paperlogy',
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 28),
              RedButton(buttonName: '상담/문의하기', path: '/service'),
            ],
          ),
        ),
      ],
    );
  }
}
