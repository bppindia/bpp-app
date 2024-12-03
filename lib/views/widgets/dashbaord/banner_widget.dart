import 'dart:async';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final List<String> imagePaths = [
    'assets/images/land.jpg',
    'assets/images/land1.jpg',
    'assets/images/land2.jpg',
    'assets/images/text.png',
    'assets/images/text1.png',
  ];

  final List<String> imageTitles = [
    'Have a direct say in the policies  Decision-Making',
    'We strive to achieve sustainable Decision-Making',
    'Have a direct say in the policies  Decision-Making',
    'Be responsive to the people’s  Decision-Making',
    'Have a direct say in the policies  Decision-Making'
  ];

  int _currentIndex = 0;
  bool _isVisible = true;
  late Timer _imageSliderTimer;
  late Timer _titleSliderTimer;
  int _titleIndex = 0;
  bool _isTitleSliderActive = false;

  @override
  void initState() {
    super.initState();
    _startImageSlider();
  }

  @override
  void dispose() {
    _imageSliderTimer.cancel();
    if (_isTitleSliderActive) {
      _titleSliderTimer.cancel();
    }
    super.dispose();
  }

  void _startImageSlider() {
    _imageSliderTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        if (_isVisible) {
          _currentIndex = (_currentIndex + 1) % imagePaths.length;
        }
      });
    });
  }

  void _startTitleSlider() {
    if (_isTitleSliderActive) return;

    setState(() {
      _isTitleSliderActive = true;
    });

    _titleSliderTimer = Timer.periodic(Duration(seconds: 4), (timer) {
      setState(() {
        if (!_isVisible && _titleIndex < imageTitles.length - 1) {
          _titleIndex++;
        } else if (!_isVisible) {
          _titleIndex = 0; // Loop back to the first title after the last one
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isWideScreen = screenWidth > 600;

    return Padding(
      padding: EdgeInsets.all(isWideScreen ? 16.0 : 8.0),
      child: Material(
        elevation: _isVisible ? 8 : 0,
        borderRadius: BorderRadius.circular(16),
        shadowColor: _isVisible ? Colors.black.withOpacity(0.2) : Colors.transparent,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  // Image displayed with a smooth opacity transition
                  if (_isVisible)
                    AnimatedOpacity(
                      opacity: _isVisible ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 700), // Increase transition time
                      child: Container(
                        width: screenWidth * 1.0, // Increased width (1.0 for full width)
                        height: isWideScreen ? screenHeight * 0.2 : screenHeight * 0.18, // Reduced height
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(imagePaths[_currentIndex]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  // Display title with smooth transitions when image is hidden
                  if (!_isVisible)
                    AnimatedOpacity(
                      opacity: 1.0,
                      duration: Duration(milliseconds: 700),
                      child: Container(
                        width: screenWidth * 0.9,
                        height: isWideScreen ? 100 : 60,
                        alignment: Alignment.center,
                        color: Colors.grey[200]!.withOpacity(0.8),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              // First 40% in blue
                              TextSpan(
                                text: _getBlueText(imageTitles[_titleIndex]) + ' ',
                                style: TextStyle(
                                  fontSize: isWideScreen ? 20 : 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              // Rest in black
                              TextSpan(
                                text: _getBlackText(imageTitles[_titleIndex]),
                                style: TextStyle(
                                  fontSize: isWideScreen ? 20 : 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  // Visibility toggle button with smooth animation
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _isVisible = !_isVisible;
                            if (!_isVisible) {
                              _startTitleSlider(); // Start title slider when image is hidden
                            } else {
                              if (_isTitleSliderActive) {
                                _titleSliderTimer.cancel();
                                _isTitleSliderActive = false;
                              }
                            }
                          });
                        },
                        borderRadius: BorderRadius.circular(30),
                        child: Padding(
                          padding: const EdgeInsets.all(1.2),
                          child: Icon(
                            _isVisible
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Image indicator with smooth transition when visible
                  if (_isVisible)
                    Positioned(
                      bottom: 8,
                      left: 130,
                      child: Row(
                        children: List.generate(imagePaths.length, (index) {
                          return AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentIndex == index
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.5),
                            ),
                          );
                        }),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to get the first 40% of the title
  String _getBlueText(String text) {
    int splitIndex = (text.length * 0.4).toInt();
    return text.substring(0, splitIndex);
  }

  // Helper function to get the remaining text after 40%
  String _getBlackText(String text) {
    int splitIndex = (text.length * 0.4).toInt();
    return text.substring(splitIndex);
  }
}
