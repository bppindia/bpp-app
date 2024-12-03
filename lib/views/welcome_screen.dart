// import 'package:flutter/material.dart';
// // import '../views/splash_screen_view.dart';
// import '../controller/screens/dashbaord_screen.dart';
// import '../controller/screens/screen_dashbaord.dart';
// import '../views/intro.dart';
//
// class WelcomeScreen extends StatefulWidget {
//   @override
//   _WelcomeScreenState createState() => _WelcomeScreenState();
// }
//
// class _WelcomeScreenState extends State<WelcomeScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<Offset> _logoAnimation;
//   late Animation<Offset> _welcomeTextAnimation;
//   late Animation<Offset> _partyNameAnimation;
//   late Animation<Offset> _buttonAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Initialize the animation controller
//     _animationController = AnimationController(
//       // duration: const Duration(seconds: 2),
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//
//     // Define animations for each widget
//     _logoAnimation = Tween<Offset>(
//       begin: const Offset(0, -1),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//     ));
//
//     _welcomeTextAnimation = Tween<Offset>(
//       begin: const Offset(1, 0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//     ));
//
//     _partyNameAnimation = Tween<Offset>(
//       begin: const Offset(-1, 0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//     ));
//
//     _buttonAnimation = Tween<Offset>(
//       begin: const Offset(0, 1),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//     ));
//
//     // Start the animation
//     _animationController.forward();
//
//     // Setup auto navigation timer
//     // _setupAutoNavigation();
//   }
//
//   // void _setupAutoNavigation() {
//   //   Future.delayed(const Duration(seconds: 4), () {
//   //     if (mounted) {  // Check if widget is still mounted
//   //       Navigator.pushReplacement(
//   //         context,
//   //         MaterialPageRoute(builder: (context) => SplashScreen()),
//   //       );
//   //     }
//   //   });
//   // }
//
//   void _navigateToIntro() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => IntroScreen()),
//     ).then((_) {
//
//       // _setupAutoNavigation();
//     });
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(  // Handle back button press
//       onWillPop: () async {
//         return false;  // Prevent going back
//       },
//       child: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SlideTransition(
//                 position: _logoAnimation,
//                 child: Image.asset(
//                   'assets/images/bpp_logo2.png',
//                   height: 100,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               SlideTransition(
//                 position: _welcomeTextAnimation,
//                 child: const Text(
//                   'Welcome to',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 5),
//               SlideTransition(
//                 position: _partyNameAnimation,
//                 child: const Text(
//                   'Bharatiya Popular Party',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blueAccent,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 220),
//               SlideTransition(
//                 position: _buttonAnimation,
//                 child: ElevatedButton(
//                   onPressed: _navigateToIntro,
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: const Text(
//                     'Introduction',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../controller/screens/dashbaord_screen.dart';
import '../controller/screens/screen_dashbaord.dart';
import '../views/intro.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _logoAnimation;
  late Animation<Offset> _welcomeTextAnimation;
  late Animation<Offset> _partyNameAnimation;
  late Animation<Offset> _buttonAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    // Define animations for each widget
    _logoAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _welcomeTextAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _partyNameAnimation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _buttonAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Start the animation
    _animationController.forward();
  }

  void _navigateToIntro() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => IntroScreen()),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final isDesktop = size.width > 1200;

    // Set padding, container width, logo size, font sizes based on screen width
    final horizontalPadding = size.width * (isDesktop ? 0.2 : isTablet ? 0.1 : 0.05);
    final containerWidth = isDesktop ? 1000.0 : size.width;
    final logoSize = size.width * (isDesktop ? 0.15 : isTablet ? 0.2 : 0.26);
    final titleFontSize = size.width * (isDesktop ? 0.02 : isTablet ? 0.06 : 0.06);
    final labelFontSize = size.width * (isDesktop ? 0.012 : isTablet ? 0.015 : 0.035);

    return WillPopScope(  // Handle back button press
      onWillPop: () async {
        return false;  // Prevent going back
      },
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SlideTransition(
                  position: _logoAnimation,
                  child: Image.asset(
                    'assets/images/bpp_logo2.png',
                    height: logoSize,
                  ),
                ),
                const SizedBox(height: 8),
                SlideTransition(
                  position: _welcomeTextAnimation,
                  child: Text(
                    'Welcome to',
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                SlideTransition(
                  position: _partyNameAnimation,
                  child: Text(
                    'Bharatiya Popular Party',
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                const SizedBox(height: 220),
                SlideTransition(
                  position: _buttonAnimation,
                  child: ElevatedButton(
                    onPressed: _navigateToIntro,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Introduction',
                      style: TextStyle(
                        fontSize: labelFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
