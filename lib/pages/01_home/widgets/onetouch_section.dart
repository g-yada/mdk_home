import 'package:flutter/material.dart';
import 'package:mdk_home/widgets/index.dart';
import 'breakpoints.dart';

class OnetouchSection extends StatelessWidget {
  const OnetouchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (Breakpoints.isMobile(context)) {
          return const MobileOneTouch();
        } else if (Breakpoints.isTablet(context)) {
          return const TabletOneTouch();
        } else {
          return const DesktopOneTouch();
        }
      },
    );
  }
}

class DesktopOneTouch extends StatelessWidget {
  const DesktopOneTouch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Breakpoints.getPadding(context),
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/img/onetouch.webp'),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.center,
      child: Align(
        alignment: Alignment.centerRight,
        child: SlideInSection(
          alignment: 'right',
          children: [
            Text(
              '태블릿 하나로 강의환경을 조작하는',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Paperlogy',
                fontWeight: FontWeight.w600,
                color: Color(0xFFD4373C),
              ),
            ),
            Text(
              '원터치 통합 제어 시스템',
              style: TextStyle(
                fontSize: 38,
                fontFamily: 'Paperlogy',
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 32),
            Text(
              '✅  원터치 강의 시작·종료',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Paperlogy',
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '✅  하드웨어/소프트웨어 통합 컨트롤',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Paperlogy',
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '✅  강의실 환경과 목적에 맞춘 커스터마이징',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Paperlogy',
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabletOneTouch extends StatelessWidget {
  const TabletOneTouch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Breakpoints.getPadding(context),
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/img/onetouch.webp'),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.center,
      child: Align(
        alignment: Alignment.centerRight,
        child: SlideInSection(
          alignment: 'right',
          children: [
            Text(
              '태블릿 하나로 강의환경을 조작하는',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Paperlogy',
                fontWeight: FontWeight.w600,
                color: Color(0xFFD4373C),
              ),
            ),
            SizedBox(height: 16),
            Text(
              '원터치 통합 제어 시스템',
              style: TextStyle(
                fontSize: 38,
                fontFamily: 'Paperlogy',
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 32),
            Text(
              '✅  원터치 강의 시작·종료',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Paperlogy',
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '✅  하드웨어/소프트웨어 통합 컨트롤',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Paperlogy',
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '✅  강의실 환경과 목적에 맞춘 커스터마이징',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Paperlogy',
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MobileOneTouch extends StatelessWidget {
  const MobileOneTouch({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 400,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('assets/img/onetouch.webp'),
              fit: BoxFit.cover,
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
            alignment: 'center',
            children: [
              Text(
                '태블릿 하나로 강의환경을 조작하는',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFD4373C),
                ),
              ),
              SizedBox(height: 8),
              Text(
                '원터치 통합 제어 시스템',
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 24),
              Text(
                '✅  원터치 강의 시작·종료',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Paperlogy',
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                '✅  하드웨어/소프트웨어 통합 컨트롤',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Paperlogy',
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12),
              Text(
                '✅  강의실 환경과 목적에 맞춘 커스터마이징',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Paperlogy',
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
