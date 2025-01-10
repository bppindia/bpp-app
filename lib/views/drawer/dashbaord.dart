// import 'package:flutter/material.dart';
//
// class DashboardPage extends StatefulWidget {
//   @override
//   _DashbaordPageState createState() => _DashbaordPageState();
// }
//
// class _DashbaordPageState extends State<DashboardPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: Text("Dashbaord Page"),
//       ),
//     );
//   }
// }

// dashboard_screen.dart
// import 'package:bpp_frontend/views/component/buttons.dart';
// import 'package:flutter/material.dart';
// import '../../views/component/india_map.dart';
// import '../widgets/dashbaord/banner_widget.dart';
// import '../../views/widgets/footer.dart';
// import '../widgets/dashbaord/summary_section.dart';
// import '../widgets/dashbaord/tab_bar_section.dart';
//
// class DashboardPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isWideScreen = screenWidth > 600;
//
//     // Adjust spacing based on screen width
//     final double padding = isWideScreen ? 16.0 : 8.0;
//     final double verticalSpacing = isWideScreen ? 12.0 : 8.0;
//
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: padding),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               SizedBox(height: verticalSpacing),
//               SummarySection(),
//               SizedBox(height: 3),
//               // ActionButtons(),
//               SizedBox(height: 1),
//               BannerWidget(),
//               SizedBox(height: verticalSpacing),
//               // ButtonsScreen(),
//               // SizedBox(height: 1),
//               IndiaMap(), // Display the India map here
//               SizedBox(height: verticalSpacing),
//               TabBarSection(),
//               // DashboardHeader(),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: Footer(),
//     );
//   }
// }
// import 'package:bpp_frontend/screens1/map_screen.dart';
// import 'package:bpp_frontend/views/drawer/donor.dart';
// import 'package:flutter/material.dart';
// import 'package:bpp_frontend/views/component/buttons.dart';
// import 'package:bpp_frontend/views/widgets/dashbaord/banner_widget.dart';
// import 'package:bpp_frontend/views/widgets/footer.dart';
// import 'package:bpp_frontend/views/widgets/dashbaord/summary_section.dart';
// import 'package:bpp_frontend/views/widgets/dashbaord/tab_bar_section.dart';
//
// class DashboardPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isWideScreen = screenWidth > 600;
//
//     // Adjust spacing based on screen width
//     final double padding = isWideScreen ? 16.0 : 8.0;
//     final double verticalSpacing = isWideScreen ? 12.0 : 8.0;
//
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: padding),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               SizedBox(height: verticalSpacing),
//               SummarySection(),
//               SizedBox(height: 3),
//               BannerWidget(),
//               ButtonsScreen(), // Integrate ButtonsScreen here
//               SizedBox(height: 3.0),
//               DonationScreen(), // Add DonationScreen here
//               SizedBox(height: 5.0),
//
//               TabBarSection(),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: Footer(),
//     );
//   }
// }
//
// class DonationScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.fromLTRB(
//           15, 0, 15, 2), // Added padding on the left and right
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white, // Background color
//           borderRadius: BorderRadius.circular(16.0), // Rounded corners
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.3), // Shadow color
//               blurRadius: 5.0, // Blur radius
//               spreadRadius: 2.0, // Spread radius
//               offset: Offset(0, 3), // Shadow position
//             ),
//           ],
//         ),
//         padding: EdgeInsets.all(16.0), // Padding inside the rectangle
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'Total ad donations',
//               style: TextStyle(
//                 fontSize: 14.0,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.black54,
//               ),
//             ),
//             SizedBox(height: 8.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   '₹1,35,97,39,013.31',
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(width: 4.0),
//                 Icon(
//                   Icons.info_outline,
//                   size: 20.0,
//                   color: Colors.black54,
//                 ),
//               ],
//             ),
//             SizedBox(height: 16.0),
//             SizedBox(
//               width: 200,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12.0),
//                   ),
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => DonorDashboard()),
//                   );
//                   // Add your donation logic here
//                 },
//                 child: Text(
//                   'Donate',
//                   style: TextStyle(fontSize: 16.0, color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:bpp_frontend/models/state_data.dart';
// // import 'package:bpp_frontend/screens1/map_screen.dart'; // Make sure this import is there
// import 'package:bpp_frontend/utils/map_utils.dart';
// import 'package:bpp_frontend/views/drawer/donor.dart';
// import 'package:bpp_frontend/views/goals.dart';
// import 'package:flutter/material.dart';
// import 'package:bpp_frontend/views/component/buttons.dart';
// import 'package:bpp_frontend/views/widgets/dashbaord/banner_widget.dart';
// import 'package:bpp_frontend/views/widgets/footer.dart';
// import 'package:bpp_frontend/views/widgets/dashbaord/summary_section.dart';
// import 'package:bpp_frontend/views/widgets/dashbaord/tab_bar_section.dart';
//
// class DashboardPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isWideScreen = screenWidth > 600;
//
//     // Adjust spacing based on screen width
//     final double padding = isWideScreen ? 16.0 : 8.0;
//     final double verticalSpacing = isWideScreen ? 12.0 : 8.0;
//
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: padding),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               SizedBox(height: verticalSpacing),
//               SummarySection(),
//               SizedBox(height: 3),
//               BannerWidget(),
//               ButtonsScreen(), // Integrate ButtonsScreen here
//               SizedBox(height: 3.0),
//               DonationScreen(), // Add DonationScreen here
//               SizedBox(height: 5.0),
//
//               // Adjusted to use SizedBox to provide a fixed height for the MapScreen
//               // SizedBox(
//               //   height: 400, // Set a fixed height for the map
//               //   child: MapScreen(), // Add MapScreen here
//               // ),
//               // SizedBox(height: 5.0),
//               TabBarSection(),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: Footer(),
//     );
//   }
// }
//
// class DonationScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.fromLTRB(
//           15, 0, 15, 2), // Added padding on the left and right
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white, // Background color
//           borderRadius: BorderRadius.circular(16.0), // Rounded corners
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.3), // Shadow color
//               blurRadius: 5.0, // Blur radius
//               spreadRadius: 2.0, // Spread radius
//               offset: Offset(0, 3), // Shadow position
//             ),
//           ],
//         ),
//         padding: EdgeInsets.all(16.0), // Padding inside the rectangle
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'Total ad donations',
//               style: TextStyle(
//                 fontSize: 14.0,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.black54,
//               ),
//             ),
//             SizedBox(height: 8.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   '₹1,35,97,39,013.31',
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(width: 4.0),
//                 Icon(
//                   Icons.info_outline,
//                   size: 20.0,
//                   color: Colors.black54,
//                 ),
//               ],
//             ),
//             SizedBox(height: 16.0),
//             SizedBox(
//               width: 200,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12.0),
//                   ),
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => DonorDashboard()),
//                   );
//                   // Add your donation logic here
//                 },
//                 child: Text(
//                   'Donate',
//                   style: TextStyle(fontSize: 16.0, color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});
//
//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }
//
// class _MapScreenState extends State<MapScreen> {
//   String selectedState = '';
//   Offset? tapPosition;
//   final GlobalKey _imageKey = GlobalKey();
//
//   void _handleTapUp(TapUpDetails details) {
//     final RenderBox? imageBox =
//         _imageKey.currentContext?.findRenderObject() as RenderBox?;
//     if (imageBox == null) return;
//
//     final Offset localPosition = imageBox.globalToLocal(details.globalPosition);
//
//     if (localPosition.dx >= 0 &&
//         localPosition.dx <= imageBox.size.width &&
//         localPosition.dy >= 0 &&
//         localPosition.dy <= imageBox.size.height) {
//       if (MapUtils.isPointWithinMap(localPosition, imageBox.size)) {
//         final double relativeX = localPosition.dx / imageBox.size.width;
//         final double relativeY = localPosition.dy / imageBox.size.height;
//
//         final String state = getStateFromCoordinates(relativeX, relativeY);
//         if (state != 'State not found') {
//           setState(() {
//             selectedState = state;
//             tapPosition = localPosition;
//
//             Future.delayed(const Duration(seconds: 2), () {
//               if (mounted) {
//                 setState(() {
//                   selectedState = '';
//                   tapPosition = null;
//                 });
//               }
//             });
//           });
//         }
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(3.0),
//         child: Center(
//           child: LayoutBuilder(
//             builder: (context, constraints) {
//               return GestureDetector(
//                 onTapUp: _handleTapUp,
//                 child: Container(
//                   width: double.infinity,
//                   height: double.infinity,
//                   padding: const EdgeInsets.all(16.0),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[100],
//                   ),
//                   child: SizedBox(
//                     width: constraints.maxWidth, // Constrain width
//                     height: constraints.maxHeight, // Constrain height
//                     child: InteractiveViewer(
//                       maxScale: 4.0,
//                       minScale: 0.5,
//                       child: Stack(
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(12),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey.withOpacity(0.3),
//                                   spreadRadius: 2,
//                                   blurRadius: 5,
//                                   offset: const Offset(0, 3),
//                                 ),
//                               ],
//                             ),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(12),
//                               child: Image.asset(
//                                 'assets/images/m3.png',
//                                 key: _imageKey,
//                                 fit: BoxFit.cover,
//                                 height: 400, // Fixed size
//                                 width: 400, // Fixed size
//                               ),
//                             ),
//                           ),
//                           if (selectedState.isNotEmpty && tapPosition != null)
//                             Positioned(
//                               left: tapPosition!.dx - 50,
//                               top: tapPosition!.dy - 30,
//                               child: Container(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 8.0,
//                                   vertical: 4.0,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: Colors.white.withOpacity(0.8),
//                                   borderRadius: BorderRadius.circular(4),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.black.withOpacity(0.1),
//                                       spreadRadius: 1,
//                                       blurRadius: 2,
//                                       offset: const Offset(0, 1),
//                                     ),
//                                   ],
//                                 ),
//                                 child: Text(
//                                   selectedState,
//                                   style: const TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:bpp_frontend/models/state_data.dart';
// import 'package:bpp_frontend/screens1/map_screen.dart'; // Make sure this import is there
import 'package:bpp_frontend/utils/map_utils.dart';
import 'package:bpp_frontend/views/drawer/donor.dart';
import 'package:bpp_frontend/views/drawer/goal10.dart';
import 'package:bpp_frontend/views/drawer/privacy_policy.dart';
import 'package:bpp_frontend/views/goals.dart';
import 'package:flutter/material.dart';
import 'package:bpp_frontend/views/component/buttons.dart';
import 'package:bpp_frontend/views/widgets/dashbaord/banner_widget.dart';
import 'package:bpp_frontend/views/widgets/footer.dart';
import 'package:bpp_frontend/views/widgets/dashbaord/summary_section.dart';
import 'package:bpp_frontend/views/widgets/dashbaord/tab_bar_section.dart';

class DashboardPage extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String referralCode;

  const DashboardPage({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.referralCode,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600;

    // Adjust spacing based on screen width
    final double padding = isWideScreen ? 16.0 : 8.0;
    final double verticalSpacing = isWideScreen ? 12.0 : 8.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: verticalSpacing),
              SummarySection(
                  // firstName: firstName,
                  // lastName: lastName,
                  // referralCode: '',
                  ),
              SizedBox(height: 3),
              BannerWidget(),
              SizedBox(height: 0),
              GoalsScreen10(),
              SizedBox(height: 1),
              ButtonsScreen(), // Integrate ButtonsScreen here
              SizedBox(height: 3.0),
              DonationScreen(), // Add DonationScreen here
              SizedBox(height: 5.0),
              GoalsScreen1(), // Ensure the GoalsScreen1 widget is available
              SizedBox(height: 1.0),

              // Adjusted to use SizedBox to provide a fixed height for the MapScreen
              // SizedBox(
              //   height: 400, // Set a fixed height for the map
              //   child: MapScreen(), // Add MapScreen here
              // ),
              // SizedBox(height: 5.0),
              TabBarSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}

// class GoalsScreen10 extends StatefulWidget {
//   @override
//   _GoalsScreen10State createState() => _GoalsScreen10State();
// }
//
// class _GoalsScreen10State extends State<GoalsScreen10> {
//   final List<String> goals = [
//     'Goal 1 - National Integrity',
//     'Goal 2 - Equal Opportunity and Gender Equality',
//     'Goal 3 - Good Health and Well being',
//     'Goal 4 - Against Muscle and Money Power',
//     'Goal 5 - Uphold Secularism',
//     'Goal 6 - Industrial Development and Infrastructure',
//     'Goal 7 - Employment and Economic Growth',
//     'Goal 8 - Justice, Peace, Calm and Prosperity',
//     'Goal 9 - Upliftment Farmers',
//     'Goal 10 - Quality Education',
//   ];
//
//   int _currentGoalIndex = 0;
//   Timer? _timer;
//
//   @override
//   void initState() {
//     super.initState();
//     _startGoalTimer();
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }
//
//   void _startGoalTimer() {
//     _timer = Timer.periodic(Duration(seconds: 3), (timer) {
//       setState(() {
//         _currentGoalIndex = (_currentGoalIndex + 1) % goals.length;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SizedBox(
//         width: 330.0, // Fixed width for the card
//         height: 60.0, // Fixed height for the card
//         child: Card(
//           color: Colors.white,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
//             child: AnimatedSwitcher(
//               duration: Duration(milliseconds: 500),
//               transitionBuilder: (Widget child, Animation<double> animation) {
//                 return SlideTransition(
//                   position: animation.drive(
//                     Tween<Offset>(
//                       begin: child.key == ValueKey(_currentGoalIndex)
//                           ? Offset(0, 1) // New goal slides in from below
//                           : Offset(0, -2), // Current goal slides up and out
//                       end: Offset(0, 0), // Stops in place
//                     ),
//                   ),
//                   child: child,
//                 );
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Text(
//                       goals[_currentGoalIndex],
//                       key: ValueKey<int>(
//                           _currentGoalIndex), // Unique key for each goal
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 14.0,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black87,
//                       ),
//                     ),
//                   ),
//                   Icon(
//                     Icons.menu, // Arrow icon
//                     color: Colors.black87,
//                     size: 15.0, // Size of the icon
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class GoalsScreen10 extends StatefulWidget {
  @override
  _GoalsScreen10State createState() => _GoalsScreen10State();
}

class _GoalsScreen10State extends State<GoalsScreen10> {
  final List<String> goals = [
    'Goal 1 - National Integrity',
    'Goal 2 - Equal Opportunity and Gender Equality',
    'Goal 3 - Good Health and Well being',
    'Goal 4 - Against Muscle and Money Power',
    'Goal 5 - Uphold Secularism',
    'Goal 6 - Industrial Development and Infrastructure',
    'Goal 7 - Employment and Economic Growth',
    'Goal 8 - Justice, Peace, Calm and Prosperity',
    'Goal 9 - Upliftment Of Farmers',
    'Goal 10 - Quality Education',
  ];

  int _currentGoalIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startGoalTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startGoalTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        _currentGoalIndex = (_currentGoalIndex + 1) % goals.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 330.0, // Fixed width for the card
        height: 60.0, // Fixed height for the card
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SlideTransition(
                  position: animation.drive(
                    Tween<Offset>(
                      begin: child.key == ValueKey(_currentGoalIndex)
                          ? const Offset(0, 0) // Current goal starts in place
                          : const Offset(
                              0, -1), // New goal slides in from below
                      end: child.key == ValueKey(_currentGoalIndex)
                          ? const Offset(0, 0) // Current goal slides up
                          : const Offset(0, 0), // New goal stops in place
                    ),
                  ),
                  child: child,
                );
              },
              child: Row(
                key: ValueKey<int>(
                    _currentGoalIndex), // Unique key for each goal
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      goals[_currentGoalIndex],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.menu, // Arrow icon
                    color: Colors.black87,
                    size: 15.0, // Size of the icon
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DonationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          15, 0, 15, 2), // Added padding on the left and right
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          borderRadius: BorderRadius.circular(16.0), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // Shadow color
              blurRadius: 5.0, // Blur radius
              spreadRadius: 2.0, // Spread radius
              offset: Offset(0, 3), // Shadow position
            ),
          ],
        ),
        padding: EdgeInsets.all(16.0), // Padding inside the rectangle
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Total ad donations',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '₹1,35,97,39,013.31',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 4.0),
                Icon(
                  Icons.info_outline,
                  size: 20.0,
                  color: Colors.black54,
                ),
              ],
            ),
            SizedBox(height: 16.0),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CommunityContributionScreen()),
                  );
                  // Add your donation logic here
                },
                child: Text(
                  'Community\nContribution',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GoalsScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 130, // Fixed height for the horizontal list
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: goals.length,
          itemBuilder: (context, index) {
            final goal = goals[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: GoalTile(
                number: goal['number']!,
                title: goal['title']!,
                color: goal['color']!,
                icon: goal['icon']!,
              ),
            );
          },
        ),
      ),
    );
  }
}

class GoalTile extends StatelessWidget {
  final String number;
  final String title;
  final Color color;
  final IconData icon;

  const GoalTile({
    required this.number,
    required this.title,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final titleParts = title.split('\n');

    return Container(
      width: screenWidth * 0.30,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black26,
        //     blurRadius: 4,
        //     offset: Offset(0, 2),
        //   ),
        // ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row for number and title on the same line
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                number,
                style: TextStyle(
                  fontFamily: 'Oswald',
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 4),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // First part of the title (before '\n')
                    Text(
                      titleParts[0],
                      style: TextStyle(
                        fontFamily: 'Oswald',
                        color: Colors.white,
                        fontSize: 16, // Adjusted size for title
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Second part of the title (after '\n')
                    if (titleParts.length > 1)
                      Text(
                        titleParts[1],
                        style: TextStyle(
                          fontFamily: 'Oswald',
                          color: Colors.white,
                          fontSize: 16, // Adjusted size for subtitle
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 4),

          Center(
            child: Icon(
              icon,
              size: 45,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

// Goals data
final List<Map<String, dynamic>> goals = [
  {
    'number': "1",
    'title': "NATIONAL\nINTEGRITY",
    'color': Colors.red,
    'icon': Icons.public,
  },
  {
    'number': "2",
    'title': "GENDER\nEQUALITY",
    'color': Colors.orange,
    'icon': Icons.people,
  },
  {
    'number': "3",
    'title': "GOOD\nHEALTH",
    'color': Colors.pink,
    'icon': Icons.favorite,
  },
  {
    'number': "4",
    'title': "AGAINST \n MUSCLE\nMONEY POWER",
    'color': Colors.blue,
    'icon': Icons.security,
  },
  {
    'number': "5",
    'title': "UPHOLD\nSECULARISM",
    'color': Colors.red,
    'icon': Icons.brightness_6,
  },
  {
    'number': "6",
    'title': "INDUSTRIAL\nDEVELOPMENT",
    'color': Colors.green,
    'icon': Icons.agriculture,
  },
  {
    'number': "7",
    'title': "EMPLOYMENT\nGROWTH",
    'color': Colors.lightGreen,
    'icon': Icons.trending_up,
  },
  {
    'number': "8",
    'title': "JUSTICE AND\nPEACE",
    'color': Colors.deepOrange,
    'icon': Icons.balance,
  },
  {
    'number': "9",
    'title': "UPLIFTMENT\nOF FARMERS",
    'color': Colors.purple,
    'icon': Icons.agriculture,
  },
  {
    'number': "10",
    'title': "QUALITY\nEDUCATION",
    'color': Colors.teal,
    'icon': Icons.school,
  },
];

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String selectedState = '';
  Offset? tapPosition;
  final GlobalKey _imageKey = GlobalKey();

  void _handleTapUp(TapUpDetails details) {
    final RenderBox? imageBox =
        _imageKey.currentContext?.findRenderObject() as RenderBox?;
    if (imageBox == null) return;

    final Offset localPosition = imageBox.globalToLocal(details.globalPosition);

    if (localPosition.dx >= 0 &&
        localPosition.dx <= imageBox.size.width &&
        localPosition.dy >= 0 &&
        localPosition.dy <= imageBox.size.height) {
      if (MapUtils.isPointWithinMap(localPosition, imageBox.size)) {
        final double relativeX = localPosition.dx / imageBox.size.width;
        final double relativeY = localPosition.dy / imageBox.size.height;

        final String state = getStateFromCoordinates(relativeX, relativeY);
        if (state != 'State not found') {
          setState(() {
            selectedState = state;
            tapPosition = localPosition;

            Future.delayed(const Duration(seconds: 2), () {
              if (mounted) {
                setState(() {
                  selectedState = '';
                  tapPosition = null;
                });
              }
            });
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return GestureDetector(
                onTapUp: _handleTapUp,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  ),
                  child: SizedBox(
                    width: constraints.maxWidth, // Constrain width
                    height: constraints.maxHeight, // Constrain height
                    child: InteractiveViewer(
                      maxScale: 4.0,
                      minScale: 0.5,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/images/m3.png',
                                key: _imageKey,
                                fit: BoxFit.cover,
                                height: 400, // Fixed size
                                width: 400, // Fixed size
                              ),
                            ),
                          ),
                          if (selectedState.isNotEmpty && tapPosition != null)
                            Positioned(
                              left: tapPosition!.dx - 50,
                              top: tapPosition!.dy - 30,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                  vertical: 4.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(4),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  selectedState,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
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
            },
          ),
        ),
      ),
    );
  }
}
