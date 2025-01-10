// import 'dart:async';
// import 'package:flutter/material.dart';
//
// class BannerWidget extends StatefulWidget {
//   @override
//   _BannerWidgetState createState() => _BannerWidgetState();
// }
//
// class _BannerWidgetState extends State<BannerWidget> {
//   final List<String> imagePaths = [
//     'assets/images/land.jpg',
//     'assets/images/land1.jpg',
//     'assets/images/land2.jpg',
//     'assets/images/text.png',
//     'assets/images/text1.png',
//   ];
//
//   final List<String> imageTitles = [
//     'Have a direct say in the policies  Decision-Making',
//     'We strive to achieve sustainable Decision-Making',
//     'Have a direct say in the policies  Decision-Making',
//     'Be responsive to the people’s  Decision-Making',
//     'Have a direct say in the policies  Decision-Making'
//   ];
//
//   int _currentIndex = 0;
//   bool _isVisible = true;
//   late Timer _imageSliderTimer;
//   late Timer _titleSliderTimer;
//   int _titleIndex = 0;
//   bool _isTitleSliderActive = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _startImageSlider();
//   }
//
//   @override
//   void dispose() {
//     _imageSliderTimer.cancel();
//     if (_isTitleSliderActive) {
//       _titleSliderTimer.cancel();
//     }
//     super.dispose();
//   }
//
//   void _startImageSlider() {
//     _imageSliderTimer = Timer.periodic(Duration(seconds: 3), (timer) {
//       setState(() {
//         if (_isVisible) {
//           _currentIndex = (_currentIndex + 1) % imagePaths.length;
//         }
//       });
//     });
//   }
//
//   void _startTitleSlider() {
//     if (_isTitleSliderActive) return;
//
//     setState(() {
//       _isTitleSliderActive = true;
//     });
//
//     _titleSliderTimer = Timer.periodic(Duration(seconds: 4), (timer) {
//       setState(() {
//         if (!_isVisible && _titleIndex < imageTitles.length - 1) {
//           _titleIndex++;
//         } else if (!_isVisible) {
//           _titleIndex = 0; // Loop back to the first title after the last one
//         }
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     final isWideScreen = screenWidth > 600;
//
//     return Padding(
//       padding: EdgeInsets.all(isWideScreen ? 16.0 : 8.0),
//       child: Material(
//         elevation: _isVisible ? 8 : 0,
//         borderRadius: BorderRadius.circular(16),
//         shadowColor:
//             _isVisible ? Colors.black.withOpacity(0.2) : Colors.transparent,
//         child: Column(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(16),
//               child: Stack(
//                 children: [
//                   // Image displayed with a smooth opacity transition
//                   if (_isVisible)
//                     AnimatedOpacity(
//                       opacity: _isVisible ? 1.0 : 0.0,
//                       duration: Duration(
//                           milliseconds: 700), // Increase transition time
//                       child: Container(
//                         width: screenWidth *
//                             1.0, // Increased width (1.0 for full width)
//                         height: isWideScreen
//                             ? screenHeight * 0.2
//                             : screenHeight * 0.18, // Reduced height
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage(imagePaths[_currentIndex]),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                   // Display title with smooth transitions when image is hidden
//                   if (!_isVisible)
//                     AnimatedOpacity(
//                       opacity: 1.0,
//                       duration: Duration(milliseconds: 700),
//                       child: Container(
//                         width: screenWidth * 0.9,
//                         height: isWideScreen ? 100 : 60,
//                         alignment: Alignment.center,
//                         color: Colors.grey[200]!.withOpacity(0.8),
//                         padding: EdgeInsets.symmetric(horizontal: 16),
//                         child: RichText(
//                           textAlign: TextAlign.center,
//                           text: TextSpan(
//                             children: [
//                               // First 40% in blue
//                               TextSpan(
//                                 text: _getBlueText(imageTitles[_titleIndex]) +
//                                     ' ',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.normal,
//                                   color: Colors.blue,
//                                 ),
//                               ),
//                               // Rest in black
//                               TextSpan(
//                                 text: _getBlackText(imageTitles[_titleIndex]),
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.normal,
//                                   color: Colors.blue,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   // Visibility toggle button with smooth animation
//                   Positioned(
//                     top: 8,
//                     right: 8,
//                     child: Material(
//                       color: Colors.transparent,
//                       child: InkWell(
//                         onTap: () {
//                           setState(() {
//                             _isVisible = !_isVisible;
//                             if (!_isVisible) {
//                               _startTitleSlider(); // Start title slider when image is hidden
//                             } else {
//                               if (_isTitleSliderActive) {
//                                 _titleSliderTimer.cancel();
//                                 _isTitleSliderActive = false;
//                               }
//                             }
//                           });
//                         },
//                         borderRadius: BorderRadius.circular(30),
//                         child: Padding(
//                           padding: const EdgeInsets.all(1.2),
//                           child: Icon(
//                             _isVisible
//                                 ? Icons.keyboard_arrow_up
//                                 : Icons.keyboard_arrow_down,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   // Image indicator with smooth transition when visible
//                   if (_isVisible)
//                     Positioned(
//                       bottom: 8,
//                       left: 130,
//                       child: Row(
//                         children: List.generate(imagePaths.length, (index) {
//                           return AnimatedContainer(
//                             duration: Duration(milliseconds: 500),
//                             margin: EdgeInsets.symmetric(horizontal: 4),
//                             width: 8,
//                             height: 8,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: _currentIndex == index
//                                   ? Colors.white
//                                   : Colors.white.withOpacity(0.5),
//                             ),
//                           );
//                         }),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Helper function to get the first 40% of the title
//   String _getBlueText(String text) {
//     int splitIndex = (text.length * 0.4).toInt();
//     return text.substring(0, splitIndex);
//   }
//
//   // Helper function to get the remaining text after 40%
//   String _getBlackText(String text) {
//     int splitIndex = (text.length * 0.4).toInt();
//     return text.substring(splitIndex);
//   }
// }

// import 'dart:async';
// import 'package:flutter/material.dart';
//
// class BannerWidget extends StatefulWidget {
//   @override
//   _BannerWidgetState createState() => _BannerWidgetState();
// }
//
// class _BannerWidgetState extends State<BannerWidget> {
//   final List<String> imagePaths = [
//     'assets/images/land.jpg',
//     'assets/images/land1.jpg',
//     'assets/images/land2.jpg',
//     'assets/images/text.png',
//     'assets/images/text1.png',
//   ];
//
//   final List<String> imageTitles = [
//     'Have a direct say in the policies  Decision-Making',
//     'We strive to achieve sustainable Decision-Making',
//     'Have a direct say in the policies  Decision-Making',
//     'Be responsive to the people’s  Decision-Making',
//     'Have a direct say in the policies  Decision-Making'
//   ];
//
//   int _currentIndex = 0;
//   bool _isVisible = true;
//   late Timer _imageSliderTimer;
//   late Timer _titleSliderTimer;
//   int _titleIndex = 0;
//   bool _isTitleSliderActive = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _startImageSlider();
//   }
//
//   @override
//   void dispose() {
//     _imageSliderTimer.cancel();
//     if (_isTitleSliderActive) {
//       _titleSliderTimer.cancel();
//     }
//     super.dispose();
//   }
//
//   void _startImageSlider() {
//     _imageSliderTimer = Timer.periodic(Duration(seconds: 3), (timer) {
//       setState(() {
//         if (_isVisible) {
//           _currentIndex = (_currentIndex + 1) % imagePaths.length;
//         }
//       });
//     });
//   }
//
//   void _startTitleSlider() {
//     if (_isTitleSliderActive) return;
//
//     setState(() {
//       _isTitleSliderActive = true;
//     });
//
//     _titleSliderTimer = Timer.periodic(Duration(seconds: 4), (timer) {
//       setState(() {
//         if (!_isVisible && _titleIndex < imageTitles.length - 1) {
//           _titleIndex++;
//         } else if (!_isVisible) {
//           _titleIndex = 0; // Loop back to the first title after the last one
//         }
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Padding(
//       padding: EdgeInsets.all(4.0), // Adjusted padding for smaller screens1
//       child: Material(
//         // elevation: _isVisible ? 8 : 0,
//         borderRadius:
//             BorderRadius.zero, // Removed borderRadius for sharp corners
//         shadowColor:
//             _isVisible ? Colors.black.withOpacity(0.2) : Colors.transparent,
//         child: Column(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.zero, // No border radius
//               child: Stack(
//                 children: [
//                   // Image displayed with smooth opacity transition
//                   if (_isVisible)
//                     AnimatedOpacity(
//                       opacity: _isVisible ? 1.0 : 0.0,
//                       duration: Duration(
//                           milliseconds: 700), // Increase transition time
//                       child: Container(
//                         width: screenWidth *
//                             0.9, // Reduced width for small screens
//                         height: screenHeight * 0.10, // Reduced height
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage(imagePaths[_currentIndex]),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                   // Display title with smooth transitions when image is hidden
//                   if (!_isVisible)
//                     AnimatedOpacity(
//                       opacity: 1.0,
//                       duration: Duration(milliseconds: 700),
//                       child: Container(
//                         width: screenWidth * 0.90, // Reduced width
//                         height: screenHeight * 0.06, // Reduced height for text
//                         alignment: Alignment.center,
//                         color: Colors.grey[200]!.withOpacity(0.8),
//                         padding: EdgeInsets.symmetric(horizontal: 16),
//                         child: RichText(
//                           textAlign: TextAlign.center,
//                           text: TextSpan(
//                             children: [
//                               // First 40% in blue
//                               TextSpan(
//                                 text: _getBlueText(imageTitles[_titleIndex]) +
//                                     ' ',
//                                 style: TextStyle(
//                                   fontSize: 10, // Reduced font size
//                                   fontWeight: FontWeight.normal,
//                                   color: Colors.blue,
//                                 ),
//                               ),
//                               // Rest in black
//                               TextSpan(
//                                 text: _getBlackText(imageTitles[_titleIndex]),
//                                 style: TextStyle(
//                                   fontSize: 10, // Reduced font size
//                                   fontWeight: FontWeight.normal,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   // Visibility toggle button with smooth animation
//                   Positioned(
//                     top: 8,
//                     right: 8,
//                     child: Material(
//                       color: Colors.transparent,
//                       child: InkWell(
//                         onTap: () {
//                           setState(() {
//                             _isVisible = !_isVisible;
//                             if (!_isVisible) {
//                               _startTitleSlider(); // Start title slider when image is hidden
//                             } else {
//                               if (_isTitleSliderActive) {
//                                 _titleSliderTimer.cancel();
//                                 _isTitleSliderActive = false;
//                               }
//                             }
//                           });
//                         },
//                         borderRadius: BorderRadius.circular(30),
//                         child: Padding(
//                           padding: const EdgeInsets.all(1.2),
//                           child: Icon(
//                             _isVisible
//                                 ? Icons.keyboard_arrow_up
//                                 : Icons.keyboard_arrow_down,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   // Image indicator with smooth transition when visible
//                   if (_isVisible)
//                     Positioned(
//                       bottom: 8,
//                       left: 130,
//                       child: Row(
//                         children: List.generate(imagePaths.length, (index) {
//                           return AnimatedContainer(
//                             duration: Duration(milliseconds: 500),
//                             margin: EdgeInsets.symmetric(horizontal: 4),
//                             width: 8,
//                             height: 8,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: _currentIndex == index
//                                   ? Colors.white
//                                   : Colors.white.withOpacity(0.5),
//                             ),
//                           );
//                         }),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Helper function to get the first 40% of the title
//   String _getBlueText(String text) {
//     int splitIndex = (text.length * 0.4).toInt();
//     return text.substring(0, splitIndex);
//   }
//
//   // Helper function to get the remaining text after 40%
//   String _getBlackText(String text) {
//     int splitIndex = (text.length * 0.4).toInt();
//     return text.substring(splitIndex);
//   }
// }
// import 'dart:async';
// import 'package:flutter/material.dart';
//
// class BannerWidget extends StatefulWidget {
//   @override
//   _BannerWidgetState createState() => _BannerWidgetState();
// }
//
// class _BannerWidgetState extends State<BannerWidget> {
//   final List<String> imagePaths = [
//     'assets/images/1.png',
//     'assets/images/2.png',
//     'assets/images/3.png',
//     'assets/images/4.png',
//     'assets/images/5.png',
//     'assets/images/6.png',
//     'assets/images/7.png',
//     'assets/images/8.png',
//     'assets/images/9.png',
//     'assets/images/10.png',
//   ];
//
//   // final List<String> imageTitles = [
//   //   'Goal 1 - National Integrity',
//   //   'Goal 2 - Equal Opportunity and Gender Equality',
//   //   'Goal 3 - Good Health and Well being',
//   //   'Goal 4 - Against Muscle and Money Power',
//   //   'Goal 5 - Uphold Secularism',
//   //   'Goal 6 - Industrial Development and Infrastructure',
//   //   'Goal 7 - Employement and Economic Growth',
//   //   'Goal 8 -Justice, Peace, Calm and Prosperity',
//   //   'Goal 9 - Upliftment Farmers',
//   //   'Goal 10 -Quality Education',
//   // ];
//
//   late Timer _imageTimer;
//   String _currentImage = '';
//   String _currentTitle = '';
//   int _imageIndex = 0;
//   bool _isVisible = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _currentImage = imagePaths[0];
//     // _currentTitle = imageTitles[0];
//     _startImageSlider();
//   }
//
//   @override
//   void dispose() {
//     _imageTimer.cancel();
//     super.dispose();
//   }
//
//   void _startImageSlider() {
//     _imageTimer = Timer.periodic(Duration(seconds: 3), (timer) {
//       setState(() {
//         _imageIndex = (_imageIndex + 1) % imagePaths.length;
//         _currentImage = imagePaths[_imageIndex];
//         // _currentTitle = imageTitles[_imageIndex];
//       });
//     });
//   }
//
//   void _toggleVisibility() {
//     setState(() {
//       _isVisible = !_isVisible;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Material(
//         borderRadius: BorderRadius.circular(20),
//         shadowColor: Colors.black.withOpacity(0.2),
//         child: Column(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: Stack(
//                 children: [
//                   // Image or title displayed based on visibility
//                   AnimatedOpacity(
//                     opacity: 1.0,
//                     duration: Duration(milliseconds: 700),
//                     child: Container(
//                       width: screenWidth * 0.9,
//                       height:
//                           _isVisible ? screenHeight * 0.10 : screenHeight * 0.1,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: _isVisible
//                             ? null
//                             : Colors.grey[200]!.withOpacity(0.8),
//                         image: _isVisible
//                             ? DecorationImage(
//                                 image: AssetImage(_currentImage),
//                                 fit: BoxFit.cover,
//                               )
//                             : null,
//                       ),
//                       alignment: Alignment.center,
//                       padding: !_isVisible
//                           ? EdgeInsets.symmetric(horizontal: 8)
//                           : null,
//                       child: !_isVisible
//                           ? Text(
//                               _currentTitle,
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.blue,
//                               ),
//                             )
//                           : null,
//                     ),
//                   ),
//
//                   // Visibility toggle button
//                   Positioned(
//                     top: 0,
//                     right: 8,
//                     child: Material(
//                       color: Colors.transparent,
//                       child: InkWell(
//                         onTap: _toggleVisibility, // Add onTap handler
//                         borderRadius: BorderRadius.circular(30),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Icon(
//                             _isVisible
//                                 ? Icons.keyboard_arrow_down
//                                 : Icons.keyboard_arrow_up,
//                             color: Colors.green,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final List<String> imagePaths = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/6.png',
    'assets/images/7.png',
    'assets/images/8.png',
    'assets/images/9.png',
    'assets/images/10.png',
  ];

  final List<String> imageTitles = [
    'Goal 1 - National Integrity',
    'Goal 2 - Equal Opportunity and Gender Equality',
    'Goal 3 - Good Health and Well being',
    'Goal 4 - Against Muscle and Money Power',
    'Goal 5 - Uphold Secularism',
    'Goal 6 - Industrial Development and Infrastructure',
    'Goal 7 - Employment and Economic Growth',
    'Goal 8 - Justice, Peace, Calm and Prosperity',
    'Goal 9 - Upliftment Farmers',
    'Goal 10 - Quality Education',
  ];

  late Timer _imageTimer;
  String _currentImage = '';
  String _currentTitle = '';
  int _imageIndex = 0;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _currentImage = imagePaths[0];
    _currentTitle = imageTitles[0];
    _startImageSlider();
  }

  @override
  void dispose() {
    _imageTimer.cancel();
    super.dispose();
  }

  void _startImageSlider() {
    _imageTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_isVisible) {
        setState(() {
          _imageIndex = (_imageIndex + 1) % imagePaths.length;
          _currentImage = imagePaths[_imageIndex];
          _currentTitle = imageTitles[_imageIndex];
        });
      }
    });
  }

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        shadowColor: Colors.black.withOpacity(0.2),
        child: Container(
          height: _isVisible
              ? screenHeight * 0.1
              : 40, // Dynamic height based on visibility
          width: screenWidth * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200]!.withOpacity(0.8),
          ),
          child: Stack(
            children: [
              // Display the image and title when visible
              if (_isVisible)
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: screenHeight * 0.1,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(_currentImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    // child: Text(
                    //   _currentTitle,
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontSize: 16, // Regular font size when expanded
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.white,
                    //     shadows: [
                    //       Shadow(
                    //         offset: Offset(1, 1),
                    //         blurRadius: 3,
                    //         color: Colors.black.withOpacity(0.7),
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ),
                ),

              // Display title when collapsed
              if (!_isVisible)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      _currentTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12, // Smaller font size when collapsed
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Different color to differentiate
                      ),
                    ),
                  ),
                ),

              // Toggle button (up/down arrow)
              Positioned(
                top: 0,
                right: 8,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: _toggleVisibility,
                    borderRadius: BorderRadius.circular(30),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(
                        _isVisible
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up,
                        color: Colors.green,
                      ),
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
