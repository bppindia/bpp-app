// import 'package:flutter/material.dart';
// // import '../views/splash_screen..dart';
// import '../controller/screens1/dashbaord_screen.dart';
// import '../controller/screens1/screen_dashbaord.dart';
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

//original code
// import 'package:flutter/material.dart';
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
//       duration: Duration(milliseconds: 750),
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
//   }
//
//   void _navigateToIntro() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => IntroScreen()),
//     );
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
//     // Get screen size
//     final size = MediaQuery.of(context).size;
//     final isTablet = size.width > 600;
//     final isDesktop = size.width > 1200;
//
//     // Set padding, container width, logo size, font sizes based on screen width
//     final horizontalPadding = size.width *
//         (isDesktop
//             ? 0.2
//             : isTablet
//                 ? 0.1
//                 : 0.05);
//     final containerWidth = isDesktop ? 1000.0 : size.width;
//     final logoSize = size.width *
//         (isDesktop
//             ? 0.15
//             : isTablet
//                 ? 0.2
//                 : 0.26);
//     final titleFontSize = size.width *
//         (isDesktop
//             ? 0.02
//             : isTablet
//                 ? 0.06
//                 : 0.06);
//     final labelFontSize = size.width *
//         (isDesktop
//             ? 0.012
//             : isTablet
//                 ? 0.015
//                 : 0.035);
//
//     return WillPopScope(
//       // Handle back button press
//       onWillPop: () async {
//         return false; // Prevent going back
//       },
//       child: Scaffold(
//         body: Center(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SlideTransition(
//                   position: _logoAnimation,
//                   child: Image.asset(
//                     'assets/images/bpp_logo2.png',
//                     height: 150,
//                   ),
//                 ),
//                 // const SizedBox(height: 8),
//                 SlideTransition(
//                   position: _welcomeTextAnimation,
//                   child: Text(
//                     'Welcome',
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ),
//
//                 SlideTransition(
//                   position: _welcomeTextAnimation,
//                   child: Text(
//                     'To',
//                     style: TextStyle(
//                       fontSize: titleFontSize,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ),
//                 //SizedBox(height: 8),
//                 //const SizedBox(height: 10),
//                 SlideTransition(
//                   position: _partyNameAnimation,
//                   child: Text(
//                     'Bharatiya Popular Party',
//                     style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blueAccent,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 60),
//                 SlideTransition(
//                   position: _buttonAnimation,
//                   child: ElevatedButton(
//                     onPressed: _navigateToIntro,
//                     style: ElevatedButton.styleFrom(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                       backgroundColor: Colors.blue,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ), // Set the solid color here
//                       // or use a gradient background
//                       // gradient: LinearGradient(
//                       //   colors: [Colors.blue, Colors.green],
//                       //   begin: Alignment.topLeft,
//                       //   end: Alignment.bottomRight,
//                       // ),
//                     ),
//                     child: Text(
//                       'Introduction',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white, // Set text color here
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:bpp_frontend/views/intro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const WelcomeScreen());
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    // Wait for 3 seconds and navigate to IntroPage
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => IntroScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/images/bpp_logo2.png',
                // Add your logo image in the assets folder
                height: 130,
              ),
              const SizedBox(height: 10),
              // Welcome Text
              const Text(
                'WELCOME TO',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Impact',
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 5),
              // Party Name
              const Text(
                'BHARATIYA POPULAR PARTY',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Impact',
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 15),
              // Badge and App Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Badge Image
                  Image.asset(
                    'assets/images/no1.png',
                    // Add your badge image in the assets folder
                    height: 80,
                  ),
                  const SizedBox(width: 10),
                  // Political Party App Text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'POLITICAL',
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Impact',
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                          letterSpacing: 2,
                        ),
                      ),
                      const Text(
                        'PARTY APP',
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Impact',
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                          letterSpacing: 2,
                        ),
                      ),
                      // Divider below "Party App" text
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        color: Colors.purple,
                        height: 5,
                        width: 110, // Width of the divider
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'SEAMLESS. IMPACTFUL.',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Impact',
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                          letterSpacing: 2,
                        ),
                      ),
                      const Text(
                        'COMMUNITY CONTRIBUTION',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Impact',
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50),
              // Footer Divider Image
              Image.asset(
                'assets/images/wh1.png', // Optional footer divider image
                height: 45,
                color: Colors.purple, // Adjust size as necessary
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
