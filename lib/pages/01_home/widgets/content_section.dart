import 'package:flutter/material.dart';
import 'package:mdk_home/widgets/index.dart';
import 'breakpoints.dart';

class ContentSection extends StatelessWidget {
  const ContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (Breakpoints.isMobile(context)) {
          return const MobileContents();
        } else {
          return const DesktopContents();
        }
      },
    );
  }
}

class DesktopContents extends StatelessWidget {
  const DesktopContents({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Breakpoints.isTablet(context) ? 600 : 800,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/content.webp'),
              fit: BoxFit.cover,
              alignment: Alignment(0, -0.5),
            ),
          ),
        ),
        Container(
          height: Breakpoints.isTablet(context) ? 200 : 250,
          padding: EdgeInsets.fromLTRB(
            Breakpoints.getPadding(context),
            Breakpoints.isTablet(context) ? 50 : 70,
            Breakpoints.getPadding(context),
            10,
          ),
          width: double.infinity,
          decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.8)),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth:
                    Breakpoints.isTablet(context)
                        ? Breakpoints.tabletContentWidth
                        : Breakpoints.desktopContentWidth,
              ),
              child: SlideInSection(
                children: [
                  Text(
                    '영상 네트워크 기술을 활용한',
                    style: TextStyle(
                      fontSize: Breakpoints.isTablet(context) ? 16 : 18,
                      fontFamily: 'Paperlogy',
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFD4373C),
                    ),
                  ),
                  Text(
                    '콘텐츠 제작 공간의 혁신',
                    style: TextStyle(
                      fontSize: Breakpoints.isTablet(context) ? 32 : 38,
                      fontFamily: 'Paperlogy',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(2, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Breakpoints.isTablet(context) ? 20 : 24),
                  RedButton(buttonName: '자세히 보기', path: '/business/studio'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MobileContents extends StatelessWidget {
  const MobileContents({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 400,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/content.webp'),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ),
        Container(
          height: 400,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: Breakpoints.getPadding(context),
          ),
          decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.7)),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: Breakpoints.mobileContentWidth,
              ),
              child: SlideInSection(
                children: [
                  Text(
                    '영상 네트워크 기술을 활용한',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Paperlogy',
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFD4373C),
                    ),
                  ),
                  Text(
                    '콘텐츠 제작 공간의 혁신',
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'Paperlogy',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(2, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  RedButton(buttonName: '자세히 보기', path: '/business/studio'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
