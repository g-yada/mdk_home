import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:mdk_home/common/index.dart';
import 'dart:async';

class Partners extends StatefulWidget {
  const Partners({super.key});

  @override
  State<Partners> createState() => _PartnersState();
}

class _PartnersState extends State<Partners> {
  final ScrollController _scrollController = ScrollController();
  bool _showLeftArrow = false;
  bool _showRightArrow = true;
  Timer? _autoScrollTimer;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateArrowVisibility);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _updateArrowVisibility();
        _startAutoScroll();
      }
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _scrollController.removeListener(_updateArrowVisibility);
    _scrollController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _autoScrollTimer?.cancel();
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      _autoScrollNext();
    });
  }

  void _autoScrollNext() {
    if (!_scrollController.hasClients) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    final itemWidth = getValueForScreenType(
      context: context,
      mobile: 120.0,
      tablet: 180.0,
      desktop: 240.0,
    );
    const itemMargin = 20.0;

    double targetOffset = _scrollController.offset + (itemWidth + itemMargin);

    if (targetOffset >= maxScroll) {
      _scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    } else {
      _scrollController.animateTo(
        targetOffset,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  void _updateArrowVisibility() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    setState(() {
      _showLeftArrow = currentScroll > 0;
      _showRightArrow = currentScroll < maxScroll;
    });
  }

  void _scrollLeft() {
    _autoScrollTimer?.cancel();
    if (!_scrollController.hasClients) return;
    _scrollController.animateTo(
      _scrollController.offset - 300,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    _startAutoScroll();
  }

  void _scrollRight() {
    _autoScrollTimer?.cancel();
    if (!_scrollController.hasClients) return;
    _scrollController.animateTo(
      _scrollController.offset + 300,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    _startAutoScroll();
  }

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
      color: Colors.white,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            children: [
              _buildTitle(context),
              const SizedBox(height: 50),
              _buildCarousel(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTablet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
      color: Colors.white,
      child: Column(
        children: [
          _buildTitle(context),
          const SizedBox(height: 50),
          _buildCarousel(context),
        ],
      ),
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      color: Colors.white,
      child: Column(
        children: [
          _buildTitle(context),
          const SizedBox(height: 50),
          _buildCarousel(context),
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
            'MDK Partners',
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

  Widget _buildCarousel(BuildContext context) {
    final List<Map<String, String>> partners = List.generate(
      19,
      (index) => {
        'name': 'Partner ${index + 1}',
        'logo': 'img/partners/${index + 1}.webp',
      },
    );

    return Stack(
      children: [
        Container(
          height: getValueForScreenType(
            context: context,
            mobile: 100,
            tablet: 150,
            desktop: 200,
          ),
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: partners.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  width: getValueForScreenType(
                    context: context,
                    mobile: 120,
                    tablet: 180,
                    desktop: 240,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      partners[index]['logo']!,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        if (_showLeftArrow)
          Positioned(
            left: 10,
            top: 0,
            bottom: 0,
            child: Center(
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: _scrollLeft,
                  color: PRIMARY_COLOR,
                ),
              ),
            ),
          ),
        if (_showRightArrow)
          Positioned(
            right: 10,
            top: 0,
            bottom: 0,
            child: Center(
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: _scrollRight,
                  color: PRIMARY_COLOR,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
