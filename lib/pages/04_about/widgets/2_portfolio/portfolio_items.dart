import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:mdk_home/common/index.dart';

class PortfolioItems extends StatefulWidget {
  const PortfolioItems({super.key});

  @override
  State<PortfolioItems> createState() => _PortfolioItemsState();
}

class _PortfolioItemsState extends State<PortfolioItems> {
  List<Map<String, dynamic>> _portfolioData = [];
  String _selectedYear = '전체';
  List<String> _availableYears = ['전체'];

  @override
  void initState() {
    super.initState();
    _loadPortfolioData();
  }

  Future<void> _loadPortfolioData() async {
    try {
      final String jsonString = await DefaultAssetBundle.of(
        context,
      ).loadString('assets/file/portfolio_data.json');
      final List<dynamic> jsonData = json.decode(jsonString);
      List<Map<String, dynamic>> loadedData =
          jsonData.cast<Map<String, dynamic>>();
      loadedData.sort(
        (a, b) => (b['id'] as String).compareTo(a['id'] as String),
      );

      setState(() {
        _portfolioData = loadedData;
        _availableYears.addAll(
          _portfolioData.map((item) => item['year'].toString()).toSet().toList()
            ..sort((a, b) => b.compareTo(a)),
        );
      });
    } catch (e) {
      print('Error loading portfolio data: $e');
    }
  }

  List<Map<String, dynamic>> get _filteredPortfolioData {
    if (_selectedYear == '전체') {
      return _portfolioData;
    }
    return _portfolioData
        .where((item) => item['year'].toString() == _selectedYear)
        .toList();
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
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildYearFilter(context),
              const SizedBox(height: 50),
              _buildPortfolioGrid(context),
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
          const SizedBox(height: 20),
          _buildYearFilter(context),
          const SizedBox(height: 40),
          _buildPortfolioGrid(context),
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
          const SizedBox(height: 10),
          _buildYearFilter(context),
          const SizedBox(height: 30),
          _buildPortfolioGrid(context),
        ],
      ),
    );
  }

  Widget _buildYearFilter(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            _availableYears.map((year) {
              final isSelected = year == _selectedYear;
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: FilterChip(
                  label: Text(year),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      _selectedYear = year;
                    });
                  },
                  backgroundColor: Colors.grey[200],
                  selectedColor: PRIMARY_COLOR.withOpacity(0.2),
                  labelStyle: TextStyle(
                    fontFamily: 'Paperlogy',
                    color: isSelected ? PRIMARY_COLOR : Colors.black87,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _buildPortfolioGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: getValueForScreenType(
          context: context,
          mobile: 1,
          tablet: 2,
          desktop: 3,
        ),
        childAspectRatio: 1.2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: _filteredPortfolioData.length,
      itemBuilder: (context, index) {
        final item = _filteredPortfolioData[index];
        return _buildPortfolioCard(context, item);
      },
    );
  }

  Widget _buildPortfolioCard(BuildContext context, Map<String, dynamic> item) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      child: InkWell(
        onTap: () => _showPortfolioModal(context, item),
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: MouseRegion(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    child: Image.asset(item['images'][0], fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['year'].toString(),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      fontFamily: 'Paperlogy',
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item['projectName'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Paperlogy',
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPortfolioModal(BuildContext context, Map<String, dynamic> item) {
    final double imageSliderHeight = getValueForScreenType(
      context: context,
      mobile: 200.0,
      tablet: 300.0,
      desktop: 400.0,
    );

    // 16:9 비율에 따른 이미지 슬라이더의 너비 계산 (이미지 자체의 너비)
    final double imageSliderWidth = imageSliderHeight * (16 / 9);

    // 모달의 최대 너비 계산 (이미지 슬라이더 너비 + 좌우 패딩/마진 고려)
    final double modalMaxWidth = getValueForScreenType(
      context: context,
      mobile: MediaQuery.of(context).size.width * 0.9,
      tablet: imageSliderWidth + 40,
      desktop: imageSliderWidth + 60,
    );

    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.symmetric(
              horizontal: getValueForScreenType(
                context: context,
                mobile: 30,
                tablet: 30,
                desktop: 50,
              ),
              vertical: 40,
            ),
            child: ConstrainedBox(
              // 모달 내용의 최대 너비를 제한합니다.
              constraints: BoxConstraints(maxWidth: modalMaxWidth),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // 모달의 높이가 내용에 맞게 조절되도록 함
                  children: [
                    _buildModalHeader(context, item), // 모달 헤더
                    _buildModalContent(
                      context,
                      item,
                    ), // 모달 본문 (이미지 슬라이더 및 설명 포함)
                  ],
                ),
              ),
            ),
          ),
    );
  }

  Widget _buildModalHeader(BuildContext context, Map<String, dynamic> item) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['projectName'],
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Paperlogy',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item['year'].toString(),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                    fontFamily: 'Paperlogy',
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  Widget _buildModalContent(BuildContext context, Map<String, dynamic> item) {
    return Flexible(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildImageSlider(context, item['images']),
            if (item['description'] != null && item['description'].isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  item['description'],
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.6,
                    fontFamily: 'Paperlogy',
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSlider(BuildContext context, List<dynamic> images) {
    return _ImageSlider(images: images);
  }
}

class _ImageSlider extends StatefulWidget {
  final List<dynamic> images;

  const _ImageSlider({required this.images});

  @override
  State<_ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<_ImageSlider> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    if (widget.images.length > 1) {
      _startAutoSlide();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < widget.images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: getValueForScreenType(
            context: context,
            mobile: 200,
            tablet: 300,
            desktop: 400,
          ),
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(widget.images[index], fit: BoxFit.cover),
                ),
              );
            },
          ),
        ),
        if (widget.images.length > 1) ...[
          // Left arrow
          if (_currentPage > 0)
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
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    color: PRIMARY_COLOR,
                  ),
                ),
              ),
            ),
          // Right arrow
          if (_currentPage < widget.images.length - 1)
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
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    color: PRIMARY_COLOR,
                  ),
                ),
              ),
            ),
          // Page indicator
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.images.length,
                (index) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentPage == index
                            ? PRIMARY_COLOR
                            : Colors.grey.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
