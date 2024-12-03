// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
// import '../views/splash_screen_view.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
//   late AnimationController _logoController;
//   late Animation<double> _logoAnimation;
//
//   late AnimationController _welcomeTextController;
//   late Animation<Offset> _welcomeTextAnimation;
//
//   late AnimationController _partyNameController;
//   late Animation<Offset> _partyNameAnimation;
//
//   late AnimationController _buttonController;
//   late Animation<Offset> _buttonAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Logo Animation
//     _logoController = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );
//     _logoAnimation = Tween<double>(begin: -200, end: 60).animate(
//       CurvedAnimation(parent: _logoController, curve: Curves.easeOut),
//     );
//
//     // Welcome Text Animation
//     _welcomeTextController = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );
//     _welcomeTextAnimation = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(
//       CurvedAnimation(parent: _welcomeTextController, curve: Curves.easeOut),
//     );
//
//     // Party Name Animation
//     _partyNameController = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );
//     _partyNameAnimation = Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero).animate(
//       CurvedAnimation(parent: _partyNameController, curve: Curves.easeOut),
//     );
//
//     // Button Animation
//     _buttonController = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );
//     _buttonAnimation = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
//         CurvedAnimation(parent: _buttonController, curve: Curves.easeOut));
//
//     // Start Animations
//     _logoController.forward().then((_) {
//       _welcomeTextController.forward();
//       _partyNameController.forward();
//       _buttonController.forward();
//     });
//   }
//
//   @override
//   void dispose() {
//     _logoController.dispose();
//     _welcomeTextController.dispose();
//     _partyNameController.dispose();
//     _buttonController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           // Logo Animation
//           AnimatedBuilder(
//             animation: _logoController,
//             builder: (context, child) {
//               return Positioned(
//                 top: size.height / 16 + _logoAnimation.value,
//                 left: size.width / 2 - 58,
//                 child: Image.asset(
//                   'assets/images/bpp_logo2.png',
//                   width: 120,
//                   height: 120,
//                 ),
//               );
//             },
//           ),
//
//           // Welcome Text Animation
//           SlideTransition(
//             position: _welcomeTextAnimation,
//             child: Align(
//               alignment: Alignment.center,
//               child: Transform.translate(
//                 offset: const Offset(-2, -120), // Move the text 40 pixels upward
//                 child: Text(
//                   'Welcome to',
//                   styles: TextStyle(
//                     fontSize: 38,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: 'Roboto',
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//
//
//           // Party Name Animation
//           SlideTransition(
//             position: _partyNameAnimation,
//             child: Align(
//               alignment: Alignment.topCenter, // Align text to the top center
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 290.0), // Adjust top padding as needed
//                 child: Text(
//                   'Bharatiya Popular Party',
//                   styles: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: 'Roboto',
//                     color: Colors.lightBlue, // Updated color
//                   ),
//                 ),
//               ),
//             ),
//           ),
//
//
//           // Animated Introduction Button
//           SlideTransition(
//             position: _buttonAnimation,
//             child: Align(
//               alignment: Alignment.bottomCenter,
//               child: Padding(
//                 padding: const EdgeInsets.only(bottom: 60.0,), // Adjust bottom padding to move text up
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>  SplashScreen(),
//                       ),
//                     );
//                   },
//                   styles: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                     backgroundColor: Colors.blueAccent,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(40),
//                     ),
//                   ),
//                   child: Text(
//                     'Introduction',
//                     styles: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }
