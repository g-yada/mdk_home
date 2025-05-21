import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:mdk_home/common/index.dart';
import 'package:url_launcher/url_launcher.dart';

class Info extends StatelessWidget {
  const Info({super.key});

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
      padding: const EdgeInsets.fromLTRB(100, 0, 100, 50),
      color: Colors.white,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          child: _buildInfoContent(context),
        ),
      ),
    );
  }

  Widget _buildTablet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(50, 0, 50, 40),
      color: Colors.white,
      child: _buildInfoContent(context),
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
      color: Colors.white,
      child: _buildInfoContent(context),
    );
  }

  Widget _buildInfoContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoSection(
          context,
          '주소',
          '[46206]\n부산광역시 금정구 체육공원로 555 (두구동)',
          Icons.location_on,
        ),
        const SizedBox(height: 30),
        _buildInfoSection(
          context,
          '대표번호',
          '051-508-9975',
          Icons.phone,
          isPhone: true,
        ),
        const SizedBox(height: 30),
        _buildInfoSection(
          context,
          '업무시간',
          '평일 09:00 ~ 18:00\n(점심시간 12:00 ~ 13:00)\n*주말 및 공휴일 휴무',
          Icons.access_time,
        ),
      ],
    );
  }

  Widget _buildInfoSection(
    BuildContext context,
    String title,
    String content,
    IconData icon, {
    bool isPhone = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: PRIMARY_COLOR,
          size: getValueForScreenType(
            context: context,
            mobile: 24,
            tablet: 28,
            desktop: 32,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: getValueForScreenType(
                  context: context,
                  mobile: 60,
                  tablet: 70,
                  desktop: 80,
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: getValueForScreenType(
                      context: context,
                      mobile: 15,
                      tablet: 16,
                      desktop: 18,
                    ),
                    fontFamily: 'Paperlogy',
                    fontWeight: FontWeight.bold,
                    color: PLAIN_COLOR,
                  ),
                ),
              ),
              const SizedBox(width: 80),
              Expanded(
                child:
                    isPhone
                        ? InkWell(
                          onTap: () => _launchPhone(content),
                          child: Text(
                            content,
                            style: TextStyle(
                              fontSize: getValueForScreenType(
                                context: context,
                                mobile: 14,
                                tablet: 15,
                                desktop: 16,
                              ),
                              fontFamily: 'Paperlogy',
                              color: PRIMARY_COLOR,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        )
                        : SelectableText(
                          content,
                          style: TextStyle(
                            fontSize: getValueForScreenType(
                              context: context,
                              mobile: 14,
                              tablet: 15,
                              desktop: 16,
                            ),
                            fontFamily: 'Paperlogy',
                            height: 1.6,
                          ),
                        ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _launchPhone(String phoneNumber) async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phoneNumber.replaceAll('-', ''),
    );
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }
}
