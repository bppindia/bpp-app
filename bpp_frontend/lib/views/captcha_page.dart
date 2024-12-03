// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
//
// class CaptchaPage extends StatefulWidget {
//   @override
//   _CaptchaPageState createState() => _CaptchaPageState();
// }
//
// class _CaptchaPageState extends State<CaptchaPage> {
//   InAppWebViewController? webViewController;
//   final String captchaURL = 'https://www.google.com/recaptcha/api2/demo'; // Replace with your CAPTCHA URL
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Captcha Verification"),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Container(
//           margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//           padding: EdgeInsets.all(16.0),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12.0),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 blurRadius: 6.0,
//                 spreadRadius: 2.0,
//                 offset: Offset(0, 4), // Shadow position
//               ),
//             ],
//           ),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 16.0),
//                 child: Image.network(
//                   'https://www.gstatic.com/recaptcha/api2/logo_48.png', // Google reCAPTCHA logo
//                   width: MediaQuery.of(context).size.width * 0.4,
//                   height: 50,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//               Expanded(
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(12.0),
//                   child: InAppWebView(
//                     initialUrlRequest: URLRequest(url: Uri.parse(captchaURL)),
//                     onWebViewCreated: (controller) {
//                       webViewController = controller;
//                     },
//                     onLoadStop: (controller, url) async {
//                       // Check if the CAPTCHA has been successfully completed.
//                       if (url.toString().contains("success")) {
//                         Navigator.pop(context, true); // Go back with success
//                       }
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       backgroundColor: Colors.grey[200], // Subtle background color
//     );
//   }
// }
















//import 'package:flutter/material.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SplashScreen(),
//     );
//   }
// }
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   int currentGoalIndex = 0;
//   bool showAnimatedText = false;
//   bool showGoalBox = false;
//   bool showGoalTitle = false;
//
//   final List<Map<String, dynamic>> goalData = [
//     {
//       'title': 'Goal1\nNATIONAL INTEGRITY',
//       'color': Colors.red,
//       'icon': Icons.public,
//     },
//     {
//       'title': 'Goal2\nEQUAL OPPORTUNITY',
//       'color': Colors.orange,
//       'icon': Icons.people,
//     },
//     {
//       'title': 'Goal3\nGOOD HEALTH',
//       'color': Colors.green,
//       'icon': Icons.healing,
//     },
//     {
//       'title': 'Goal4\nJUSTICE, PEACE, CALM',
//       'color': Colors.blue,
//       'icon': Icons.balance,
//     },
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _startGoalSequence();
//   }
//
//   void _startGoalSequence() async {
//     while (mounted) {
//       setState(() => showAnimatedText = true);
//
//       await Future.delayed(Duration(seconds: 3));
//       setState(() => showGoalBox = true);
//
//       await Future.delayed(Duration(seconds: 2));
//       setState(() => showGoalTitle = true);
//
//       await Future.delayed(Duration(seconds: 2));
//       setState(() {
//         showGoalTitle = false;
//         showGoalBox = false;
//       });
//
//       await Future.delayed(Duration(seconds: 1));
//       setState(() {
//         showAnimatedText = false;
//         currentGoalIndex = (currentGoalIndex + 1) % goalData.length;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final currentGoal = goalData[currentGoalIndex];
//     return Scaffold(
//       backgroundColor: currentGoal['color'],
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (showAnimatedText)
//               AnimatedTextKit(
//                 animatedTexts: [
//                   TypewriterAnimatedText(
//                     'USE THIS APP TO',
//                     textStyle: TextStyle(
//                       fontSize: 36.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                     speed: Duration(milliseconds: 100),
//                   ),
//                 ],
//                 totalRepeatCount: 1,
//               ),
//             if (showGoalBox)
//               GoalTile(
//                 key: ValueKey<int>(currentGoalIndex),
//                 number: "${currentGoalIndex + 1}",
//                 color: currentGoal['color'],
//                 icon: currentGoal['icon'],
//                 title: currentGoal['title'],
//               ),
//             if (showGoalTitle)
//               Padding(
//                 padding: const EdgeInsets.only(top: 16.0),
//                 child: Text(
//                   currentGoal['title'],
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class GoalTile extends StatelessWidget {
//   final String number;
//   final Color color;
//   final IconData icon;
//   final String title;
//
//   GoalTile({
//     required Key key,
//     required this.number,
//     required this.color,
//     required this.icon,
//     required this.title,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 150,
//       width: 160,
//       child: Card(
//         color: color,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(0),
//           side: BorderSide(color: Colors.white, width: 2),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       number,
//                       style: TextStyle(
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Icon(icon, color: Colors.white, size: 40),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


//////////////////////////Latest//////////////////////



//import 'package:flutter/material.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SplashScreen(),
//     );
//   }
// }
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   int currentGoalIndex = 0;
//   bool showAnimatedText = false;
//   bool showGoalBox = false;
//   bool showGoalTitle = false;
//
//   final List<Map<String, dynamic>> goalData = [
//     {
//       'title': 'Goal1\nNATIONAL INTEGRITY',
//       'color': Colors.red,
//       'icon': Icons.public,
//     },
//     {
//       'title': 'Goal2\nEQUAL OPPORTUNITY',
//       'color': Colors.orange,
//       'icon': Icons.people,
//     },
//     {
//       'title': 'Goal3\nGOOD HEALTH',
//       'color': Colors.green,
//       'icon': Icons.healing,
//     },
//     {
//       'title': 'Goal4\nJUSTICE,PEACE,CALM',
//       'color': Colors.blue,
//       'icon': Icons.balance,
//     },
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _startGoalSequence();
//   }
//
//   void _startGoalSequence() async {
//     while (mounted) {
//       setState(() => showAnimatedText = true);
//
//       await Future.delayed(Duration(seconds: 3));
//       setState(() => showGoalBox = true);
//
//       await Future.delayed(Duration(seconds: 2));
//       setState(() => showGoalTitle = true);
//
//       await Future.delayed(Duration(seconds: 2));
//       setState(() {
//         showGoalTitle = false;
//         showGoalBox = false;
//       });
//
//       await Future.delayed(Duration(seconds: 1));
//       setState(() {
//         showAnimatedText = false;
//         currentGoalIndex = (currentGoalIndex + 1) % goalData.length;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final currentGoal = goalData[currentGoalIndex];
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       backgroundColor: currentGoal['color'],
//       body: Stack(
//         children: [
//           // "USE THIS APP TO" Text Positioned at the Top
//           if (showAnimatedText)
//             Positioned(
//               top: screenHeight * 0.2, // Dynamic position
//               left: 0,
//               right: 35,
//               child: Center(
//                 child: AnimatedTextKit(
//                   animatedTexts: [
//                     TypewriterAnimatedText(
//                       'USE THIS APP TO',
//                       textStyle: TextStyle(
//                         fontSize: 36.0,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                       speed: Duration(milliseconds: 100),
//                     ),
//                   ],
//                   totalRepeatCount: 1,
//                 ),
//               ),
//             ),
//
//           // Main Content Centered
//           Center(
//             child: Container(
//               width: screenWidth * 0.85, // Dynamically adjusted width
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   // Animated rotation for the box
//                   AnimatedSwitcher(
//                     duration: Duration(milliseconds: 500), // Duration for animation
//                     transitionBuilder: (Widget child, Animation<double> animation) {
//                       // Check if the widget is GoalTile
//                       if (child is GoalTile) {
//                         // Apply rotation when showing the GoalTile
//                         return RotationTransition(
//                           turns: Tween<double>(begin: 1.65, end: 1.0).animate(animation), // Rotate from 90° (1.65 turns) to 0° (1.0 turn)
//                           child: child,
//                         );
//                       }
//
//                       // No animation on removal; just return the child directly
//                       return child;
//                     },
//                     child: showGoalBox
//                         ? GoalTile(
//                       key: ValueKey<int>(currentGoalIndex),
//                       number: "${currentGoalIndex + 1}",
//                       color: currentGoal['color'],
//                       icon: currentGoal['icon'],
//                       title: currentGoal['title'],
//                     )
//                         : SizedBox.shrink(), // Placeholder for direct removal
//                   ),
//
//                   // Spacer and animated sliding text
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 14.0),
//                       child: AnimatedSwitcher(
//                         duration: Duration(milliseconds: 500), // Smooth transition
//                         transitionBuilder: (Widget child, Animation<double> animation) {
//                           final slideIn = Tween<Offset>(
//                             begin: Offset(1, 0), // Slide in from the right
//                             end: Offset(0, 0), // Final position
//                           ).animate(animation);
//
//                           return SlideTransition(
//                             position: slideIn,
//                             child: child,
//                           );
//                         },
//                         child: showGoalTitle
//                             ? Text(
//                           currentGoal['title'],
//                           key: ValueKey<int>(currentGoalIndex), // Unique key for each goal
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                             fontSize: 28,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         )
//                             : SizedBox.shrink(), // Placeholder to avoid shifting
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class GoalTile extends StatelessWidget {
//   final String number;
//   final Color color;
//   final IconData icon;
//   final String title;
//
//   GoalTile({
//     required Key key,
//     required this.number,
//     required this.color,
//     required this.icon,
//     required this.title,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start, // Fix box to the left side
//       children: [
//         SizedBox(
//           height: 140,
//           width: 140, // Fixed size
//           child: Card(
//             color: color,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(0),
//               side: BorderSide(color: Colors.white, width: 3),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between number and icon
//                 crossAxisAlignment: CrossAxisAlignment.start, // Align number to top-left
//                 children: [
//                   Text(
//                     number,
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Center(
//                     child: Icon(
//                       icon,
//                       color: Colors.white,
//                       size: 60,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }




































///////////////////////////////
//import 'package:flutter/material.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SplashScreen(),
//     );
//   }
// }
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   int currentGoalIndex = 0;
//   bool showAnimatedText = false;
//   bool showGoalBox = false;
//   bool showGoalTitle = false;
//   bool showGoalDescription = false;
//
//   final List<Map<String, dynamic>> goalData = [
//     {
//       'title': 'Goal1\nNATIONAL INTEGRITY',
//       'color': Colors.red,
//       'icon': Icons.public,
//       'description': 'NATIONAL INTEGRITY.',
//     },
//     {
//       'title': 'Goal2\nEQUAL OPPORTUNITY',
//       'color': Colors.orange,
//       'icon': Icons.people,
//       'description': 'EQUAL OPPORTUNITY AND GENDER EQUALITY',
//     },
//     {
//       'title': 'Goal3\nGOOD HEALTH',
//       'color': Colors.green,
//       'icon': Icons.healing,
//       'description': 'AGAINST MUSCLE AND MONEY POWER',
//     },
//     {
//       'title': 'Goal4\nJUSTICE,PEACE,CALM',
//       'color': Colors.blue,
//       'icon': Icons.balance,
//       'description': 'Ensuring fairness, peace, and calm in society.',
//     },
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _startGoalSequence();
//   }
//
//   void _startGoalSequence() async {
//     while (mounted) {
//       setState(() => showAnimatedText = true);
//
//       await Future.delayed(Duration(seconds: 3));
//       setState(() => showGoalDescription = true);  // Show description first
//
//       await Future.delayed(Duration(seconds: 2));
//       setState(() => showGoalBox = true);
//
//       await Future.delayed(Duration(seconds: 2));
//       setState(() => showGoalTitle = true);
//
//       await Future.delayed(Duration(seconds: 3));
//       setState(() {
//         showGoalDescription = false;
//         showGoalTitle = false;
//         showGoalBox = false;
//       });
//
//       await Future.delayed(Duration(seconds: 1));
//       setState(() {
//         showAnimatedText = false;
//         currentGoalIndex = (currentGoalIndex + 1) % goalData.length;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final currentGoal = goalData[currentGoalIndex];
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       backgroundColor: currentGoal['color'],
//       body: Stack(
//         children: [
//           // "USE THIS APP TO" Text Positioned at the Top
//           if (showAnimatedText)
//             Positioned(
//               top: 180,
//               left: 0,
//               right: 35,
//               child: Center(
//                 child: AnimatedTextKit(
//                   animatedTexts: [
//                     TypewriterAnimatedText(
//                       'USE THIS APP TO',
//                       textStyle: TextStyle(
//                         fontSize: 36.0,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                       speed: Duration(milliseconds: 140),
//                     ),
//                   ],
//                   totalRepeatCount: 1,
//                 ),
//               ),
//             ),
//
//           // Description Below the Animated Text, now sliding in first
//           if (showGoalDescription)
//             Positioned(
//               top: 250,  // Adjust this value for desired position
//               left: 0,
//               right: 0,
//               child: Center(
//                 child: AnimatedOpacity(
//                   opacity: showGoalDescription ? 1.0 : 0.0,
//                   duration: Duration(milliseconds: 500),
//                   child: AnimatedSwitcher(
//                     duration: Duration(milliseconds: 500),
//                     transitionBuilder: (Widget child, Animation<double> animation) {
//                       return SlideTransition(
//                         position: Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(animation),
//                         child: child,
//                       );
//                     },
//                     child: Text(
//                       currentGoal['description'],
//                       key: ValueKey<int>(currentGoalIndex),
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 22.0,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//           // Main Content Centered, with Goal Box and Title after Description
//           Center(
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.8, // Ensure fixed width
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   // Animated rotation for the box
//                   AnimatedSwitcher(
//                     duration: Duration(milliseconds: 500), // Duration for animation
//                     transitionBuilder: (Widget child, Animation<double> animation) {
//                       // Check if the widget is GoalTile
//                       if (child is GoalTile) {
//                         // Apply rotation when showing the GoalTile
//                         return RotationTransition(
//                           turns: Tween<double>(begin: 1.65, end: 1.0).animate(animation), // Rotate from 90° (1.65 turns) to 0° (1.0 turn)
//                           child: child,
//                         );
//                       }
//
//                       // No animation on removal; just return the child directly
//                       return child;
//                     },
//                     child: showGoalBox
//                         ? GoalTile(
//                       key: ValueKey<int>(currentGoalIndex),
//                       number: "${currentGoalIndex + 1}",
//                       color: currentGoal['color'],
//                       icon: currentGoal['icon'],
//                       title: currentGoal['title'],
//                     )
//                         : SizedBox.shrink(), // Placeholder for direct removal
//                   ),
//
//                   // Spacer and animated sliding text
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 14.0),
//                       child: AnimatedSwitcher(
//                         duration: Duration(milliseconds: 500), // Smooth transition
//                         transitionBuilder: (Widget child, Animation<double> animation) {
//                           final slideIn = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(animation);
//
//                           return SlideTransition(position: slideIn, child: child);
//                         },
//                         child: showGoalTitle
//                             ? Text(
//                           currentGoal['title'],
//                           key: ValueKey<int>(currentGoalIndex), // Unique key for each goal
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                             fontSize: 28,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         )
//                             : SizedBox.shrink(), // Placeholder to avoid shifting
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// class GoalTile extends StatelessWidget {
//   final String number;
//   final Color color;
//   final IconData icon;
//   final String title;
//
//   GoalTile({
//     required Key key,
//     required this.number,
//     required this.color,
//     required this.icon,
//     required this.title,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start, // Fix box to the left side
//       children: [
//         SizedBox(
//           height: 140,
//           width: 140, // Fixed size
//           child: Card(
//             color: color,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(0),
//               side: BorderSide(color: Colors.white, width: 3),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between number and icon
//                 crossAxisAlignment: CrossAxisAlignment.start, // Align number to top-left
//                 children: [
//                   Text(
//                     number,
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Center(
//                     child: Icon(
//                       icon,
//                       color: Colors.white,
//                       size: 60,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }