import 'package:flutter/material.dart';
import 'package:mdk_home/widgets/index.dart';
import 'breakpoints.dart';
import 'package:mdk_home/common/scroll_service.dart';
import 'package:go_router/go_router.dart';

class LectureroomSection extends StatelessWidget {
  const LectureroomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (Breakpoints.isMobile(context)) {
          return const LectureRoom();
        } else if (Breakpoints.isTablet(context)) {
          return const LectureRoom();
        } else {
          return const LectureRoom();
        }
      },
    );
  }
}

class LectureRoom extends StatelessWidget {
  const LectureRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: Breakpoints.getPadding(context),
          vertical: Breakpoints.getSectionSpacing(context),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth:
                  Breakpoints.isMobile(context)
                      ? Breakpoints.mobileContentWidth
                      : Breakpoints.isTablet(context)
                      ? Breakpoints.tabletContentWidth
                      : Breakpoints.desktopContentWidth,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: SlideInSection(
                    alignment: 'left',
                    children: [
                      Text(
                        '학습자와 교수자 모두를 위한',
                        style: TextStyle(
                          fontSize: Breakpoints.isMobile(context) ? 16 : 18,
                          fontFamily: 'Paperlogy',
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFD4373C),
                        ),
                      ),
                      Text(
                        '첨단 강의공간 구현',
                        style: TextStyle(
                          fontSize: Breakpoints.isMobile(context) ? 32 : 38,
                          fontFamily: 'Paperlogy',
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Breakpoints.isMobile(context) ? 32 : 50),
                LayoutBuilder(
                  builder: (context, constraints) {
                    double maxWidth = constraints.maxWidth;
                    double cardWidth =
                        Breakpoints.isMobile(context)
                            ? maxWidth
                            : Breakpoints.isTablet(context)
                            ? maxWidth * 0.45
                            : maxWidth * 0.3;
                    return Wrap(
                      spacing: Breakpoints.isMobile(context) ? 16 : 30,
                      runSpacing: Breakpoints.isMobile(context) ? 16 : 30,
                      alignment: WrapAlignment.center,
                      children: [
                        _Card(
                          cardTitle: 'HYFLEX',
                          isTitleColorWhite: true,
                          alignmentX: -0.7,
                          cardImage: 'assets/img/business/hyflex.webp',
                          cardWidth: cardWidth,
                          targetKey: ScrollService.hyflexKey,
                        ),
                        _Card(
                          cardTitle: 'PBL',
                          isTitleColorWhite: true,
                          alignmentX: -0.3,
                          cardImage: 'assets/img/business/pbl.webp',
                          cardWidth: cardWidth,
                          targetKey: ScrollService.pblKey,
                        ),
                        _Card(
                          cardTitle: 'CODING',
                          isTitleColorWhite: false,
                          alignmentX: 0,
                          cardImage: 'assets/img/business/coding.webp',
                          cardWidth: cardWidth,
                          targetKey: ScrollService.codingKey,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final String cardTitle;
  final String cardImage;
  final double alignmentX;
  final bool isTitleColorWhite;
  final double cardWidth;
  final GlobalKey targetKey;

  const _Card({
    required this.cardTitle,
    required this.cardImage,
    required this.alignmentX,
    required this.isTitleColorWhite,
    required this.cardWidth,
    required this.targetKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardWidth,
      height: Breakpoints.isMobile(context) ? 300 : 400,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(cardImage),
          fit: BoxFit.cover,
          alignment: Alignment(alignmentX, 0),
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(Breakpoints.isMobile(context) ? 20 : 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            cardTitle,
            style: TextStyle(
              fontSize: Breakpoints.isMobile(context) ? 24 : 28,
              fontFamily: 'Paperlogy',
              color: isTitleColorWhite ? Colors.white : Colors.black,
              fontWeight: FontWeight.w700,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(2, 2),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: double.infinity,
            alignment: Alignment.bottomRight,
            child: WhiteButton(
              buttonName: '자세히 보기',
              path: '/business/smartclass',
              onTap: () {
                context.go('/business/smartclass');
                Future.delayed(const Duration(milliseconds: 300), () {
                  final targetContext = targetKey.currentContext;
                  if (targetContext != null) {
                    Scrollable.ensureVisible(
                      targetContext,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
