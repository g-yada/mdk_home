import 'package:flutter/material.dart';

class Breakpoints {
  // 모바일 0 ~ 599
  // 태블릿 600 ~ 1023
  // 데스크탑 1024 ~

  static const double mobile = 600;
  static const double tablet = 1024;

  static const double mobilePadding = 24;
  static const double tabletPadding = 48;
  static const double desktopPadding = 80;

  static const double mobileSectionSpacing = 48;
  static const double tabletSectionSpacing = 64;
  static const double desktopSectionSpacing = 80;

  static const double mobileContentWidth = 600;
  static const double tabletContentWidth = 900;
  static const double desktopContentWidth = 1200;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobile;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobile &&
      MediaQuery.of(context).size.width < tablet;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tablet;

  static double getPadding(BuildContext context) {
    if (isMobile(context)) return mobilePadding;
    if (isTablet(context)) return tabletPadding;
    return desktopPadding;
  }

  static double getSectionSpacing(BuildContext context) {
    if (isMobile(context)) return mobileSectionSpacing;
    if (isTablet(context)) return tabletSectionSpacing;
    return desktopSectionSpacing;
  }

  static double getContentWidth(BuildContext context) {
    if (isMobile(context)) return mobileContentWidth;
    if (isTablet(context)) return tabletContentWidth;
    return desktopContentWidth;
  }
}
