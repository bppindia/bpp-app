// // import 'package:flutter/material.dart';
// // import 'package:flutter_map/flutter_map.dart';
// // import 'package:latlong2/latlong.dart';
// //
// // class IndiaMap extends StatefulWidget {
// //   @override
// //   _IndiaMapState createState() => _IndiaMapState();
// // }
// //
// // class _IndiaMapState extends State<IndiaMap> {
// //   final MapController _mapController = MapController();
// //
// //   // A combined list of states and major cities
// //   final Map<String, LatLng> _locations = {
// //     "Delhi": LatLng(28.6139, 77.2090),
// //     "Mumbai": LatLng(19.0760, 72.8777),
// //     "Kolkata": LatLng(22.5726, 88.3639),
// //     "Bangalore": LatLng(12.9716, 77.5946),
// //     "Chennai": LatLng(13.0827, 80.2707),
// //     "Hyderabad": LatLng(17.3850, 78.4867),
// //     "Jaipur": LatLng(26.9124, 75.7873),
// //     "Ahmedabad": LatLng(23.0225, 72.5714),
// //     "Pune": LatLng(18.5204, 73.8567),
// //     "Chandigarh": LatLng(30.7333, 76.7794),
// //     "Lucknow": LatLng(26.8467, 80.9462),
// //     "Bhopal": LatLng(23.2599, 77.4126),
// //     "Surat": LatLng(21.1702, 72.8311),
// //     "Patna": LatLng(25.5941, 85.1376),
// //     // States with approximate central coordinates
// //     "Maharashtra": LatLng(19.6633, 75.3202),
// //     "Gujarat": LatLng(22.2587, 71.1924),
// //     "Uttar Pradesh": LatLng(26.8467, 80.9462),
// //     "Tamil Nadu": LatLng(11.1271, 78.6569),
// //     "Karnataka": LatLng(15.3173, 75.7139),
// //     "Rajasthan": LatLng(27.0238, 74.2179),
// //     "West Bengal": LatLng(22.9868, 87.8550),
// //     "Andhra Pradesh": LatLng(15.9129, 79.7400),
// //     "Kerala": LatLng(10.8505, 76.2711),
// //     "Bihar": LatLng(25.0961, 85.3131),
// //     // Add other states as needed
// //   };
// //
// //   String _searchQuery = '';
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       elevation: 8.0,
// //       margin: EdgeInsets.all(16.0),
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(20.0),
// //       ),
// //       child: ClipRRect(
// //         borderRadius: BorderRadius.circular(20.0),
// //         child: Container(
// //           height: 400,
// //           decoration: BoxDecoration(
// //             color: Colors.grey[300], // Background color when map is loading
// //           ),
// //           child: Stack(
// //             children: [
// //               FlutterMap(
// //                 mapController: _mapController,
// //                 options: MapOptions(
// //                   center: LatLng(20.5937, 78.9629), // Center on India
// //                   zoom: 5.0, // Initial zoom level
// //                   minZoom: 3.0,
// //                   maxZoom: 10.0,
// //                   interactiveFlags: InteractiveFlag.all,
// //                   bounds: LatLngBounds(
// //                     LatLng(6.0, 68.0), // Southwest corner of India
// //                     LatLng(37.0, 97.0), // Northeast corner of India
// //                   ),
// //                   boundsOptions: FitBoundsOptions(
// //                     padding: EdgeInsets.all(12.0),
// //                   ),
// //                 ),
// //                 children: [
// //                   TileLayer(
// //                     urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
// //                     subdomains: ['a', 'b', 'c'],
// //                   ),
// //                 ],
// //               ),
// //
// //               // Search Bar
// //               Positioned(
// //                 top: 10,
// //                 left: 14,
// //                 right: 60,
// //                 child: Container(
// //                   height: 36, // Reduced height for the container
// //                   padding: EdgeInsets.symmetric(horizontal: 6),
// //                   decoration: BoxDecoration(
// //                     color: Colors.white.withOpacity(0.8),
// //                     borderRadius: BorderRadius.circular(8.0),
// //                   ),
// //                   child: TextField(
// //                     onChanged: (value) {
// //                       setState(() {
// //                         _searchQuery = value;
// //                       });
// //                     },
// //                     decoration: InputDecoration(
// //                       hintText: 'Search place or state...',
// //                       border: InputBorder.none,
// //                       icon: Icon(Icons.search, color: Colors.black, size: 18), // Reduced icon size
// //                       contentPadding: EdgeInsets.symmetric(vertical: 8), // Reduced vertical padding
// //                       isDense: true, // Reduced height of the input field
// //                     ),
// //                     styles: TextStyle(fontSize: 14), // Smaller font size
// //                   ),
// //                 ),
// //               ),
// //
// //               // Displaying search results
// //               if (_searchQuery.isNotEmpty)
// //                 Positioned(
// //                   top: 60,
// //                   left: 10,
// //                   right: 10,
// //                   child: Material(
// //                     elevation: 4,
// //                     borderRadius: BorderRadius.circular(8),
// //                     child: Container(
// //                       padding: EdgeInsets.symmetric(vertical: 8),
// //                       child: Column(
// //                         children: _locations.keys
// //                             .where((place) => place.toLowerCase().contains(_searchQuery.toLowerCase()))
// //                             .map((place) => ListTile(
// //                           title: Text(place),
// //                           onTap: () {
// //                             _onPlaceSelected(place);
// //                           },
// //                         ))
// //                             .toList(),
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //
// //               // Zoom Controls
// //               Positioned(
// //                 top: 10,
// //                 right: 10,
// //                 child: Column(
// //                   children: [
// //                     _buildZoomButton(
// //                       icon: Icons.add,
// //                       onPressed: () {
// //                         _zoomMap(zoomIn: true);
// //                       },
// //                     ),
// //                     SizedBox(height: 8),
// //                     _buildZoomButton(
// //                       icon: Icons.remove,
// //                       onPressed: () {
// //                         _zoomMap(zoomIn: false);
// //                       },
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   // Create rounded buttons for zooming
// //   Widget _buildZoomButton({required IconData icon, required VoidCallback onPressed}) {
// //     return Material(
// //       color: Colors.white,
// //       shape: CircleBorder(),
// //       elevation: 4.0,
// //       child: InkWell(
// //         onTap: onPressed,
// //         customBorder: CircleBorder(),
// //         child: Padding(
// //           padding: const EdgeInsets.all(10.0),
// //           child: Icon(icon, color: Colors.black87, size: 18),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   // Zoom function without animation
// //   void _zoomMap({required bool zoomIn}) {
// //     double currentZoom = _mapController.zoom;
// //     double newZoom = zoomIn ? currentZoom + 1 : currentZoom - 1;
// //     _mapController.move(_mapController.center, newZoom); // Update the map zoom
// //   }
// //
// //   // Handle place or state selection from search suggestions
// //   void _onPlaceSelected(String place) {
// //     if (_locations.containsKey(place)) {
// //       _mapController.move(_locations[place]!, 7.0); // Zoom into the place (state or city)
// //     }
// //
// //     setState(() {
// //       _searchQuery = ''; // Clear search query after selection
// //     });
// //   }
// // }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// ///////////////////////////Latest/////////////
// //import 'package:flutter/material.dart';
// // import 'package:animated_text_kit/animated_text_kit.dart';
// //
// // void main() {
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: SplashScreen(),
// //     );
// //   }
// // }
// //
// // class SplashScreen extends StatefulWidget {
// //   @override
// //   _SplashScreenState createState() => _SplashScreenState();
// // }
// //
// // class _SplashScreenState extends State<SplashScreen> {
// //   int currentGoalIndex = 0;
// //   bool showAnimatedText = false;
// //   bool showGoalBox = false;
// //   bool showGoalTitle = false;
// //   bool showGoalDescription = false;
// //
// //   final List<Map<String, dynamic>> goalData = [
// //     {
// //       'title': 'Goal1',
// //       'color': Colors.red,
// //       'icon': Icons.public,
// //       'description': 'NATIONAL\nINTEGRITY.',
// //       'note': 'NATIONAl INTEGRITY',
// //     },
// //     {
// //       'title': 'Goal2',
// //       'color': Colors.orange,
// //       'icon': Icons.people,
// //       'description': 'EQUAL OPPORTUNITY\nGENDER EQUALITY',
// //       'note': 'EQUAL OPPORTUNITY',
// //     },
// //     {
// //       'title': 'Goal3',
// //       'color': Colors.green,
// //       'icon': Icons.healing,
// //       'description': 'GOOD HEALTH\nWELL-BEING',
// //       'note': 'GOOD HEALTH',
// //     },
// //     {
// //       'title': 'Goal4',
// //       'color': Colors.blue,
// //       'icon': Icons.balance,
// //       'description': 'JUSTICE, PEACE,CLAM\nPROSPERITY',
// //       'note': 'JUSTICE & PEACE',
// //     },
// //   ];
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _startGoalSequence();
// //   }
// //
// //   void _startGoalSequence() async {
// //     while (mounted) {
// //       setState(() => showAnimatedText = true);
// //
// //       await Future.delayed(Duration(seconds: 3));
// //       setState(() => showGoalDescription = true);  // Show description first
// //
// //       await Future.delayed(Duration(seconds: 2));
// //       setState(() => showGoalBox = true);
// //
// //       await Future.delayed(Duration(seconds: 2));
// //       setState(() => showGoalTitle = true);
// //
// //       await Future.delayed(Duration(seconds: 3));
// //       setState(() {
// //         showGoalDescription = false;
// //         showGoalTitle = false;
// //         showGoalBox = false;
// //       });
// //
// //       await Future.delayed(Duration(seconds: 1));
// //       setState(() {
// //         showAnimatedText = false;
// //         currentGoalIndex = (currentGoalIndex + 1) % goalData.length;
// //       });
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final currentGoal = goalData[currentGoalIndex];
// //
// //     return Scaffold(
// //       backgroundColor: currentGoal['color'],
// //       body: Stack(
// //         children: [
// //           if (showAnimatedText && showGoalDescription)
// //             Positioned(
// //               top: 180,
// //               left: 0,
// //               right: 0,
// //               child: Padding(
// //                 padding: EdgeInsets.only(left: 14.0),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     // Animated Text "USE THIS APP TO"
// //                     AnimatedTextKit(
// //                       animatedTexts: [
// //                         TypewriterAnimatedText(
// //                           'USE THIS APP TO',
// //                           textStyle: TextStyle(
// //                             fontSize: 50.0,
// //                             fontWeight: FontWeight.w900,
// //                             fontFamily: 'BebasNeue',
// //                             color: Color.fromRGBO(214, 214, 214, 0.8),
// //                             letterSpacing: 0.5,
// //                             height: 1.2,
// //                           ),
// //                           speed: Duration(milliseconds: 140),
// //                         ),
// //                       ],
// //                       totalRepeatCount: 1,
// //                     ),
// //                     SizedBox(height: 20.0),
// //                     // Goal Description Text
// //                     Text(
// //                       currentGoal['description'] ?? '',
// //                       key: ValueKey<int>(currentGoalIndex),
// //                       textAlign: TextAlign.left,
// //                       styles: TextStyle(
// //                         fontSize: 40.0,
// //                         fontWeight: FontWeight.bold,
// //                         fontFamily: 'BebasNeue',
// //                         color: Colors.white,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           // Main Content Centered, with Goal Box and Title after Description
// //           Center(
// //             child: Padding(
// //               padding: const EdgeInsets.only(right: 120.0), // Add padding to shift left
// //               child: Container(
// //                 width: MediaQuery.of(context).size.width * 0.8,
// //                 child: Row(
// //                   crossAxisAlignment: CrossAxisAlignment.center,
// //                   children: [
// //                     // Animated rotation for the box
// //                     AnimatedSwitcher(
// //                       duration: Duration(milliseconds: 500),
// //                       transitionBuilder: (Widget child, Animation<double> animation) {
// //                         if (child is GoalTile) {
// //                           return AnimatedBuilder(
// //                             animation: animation,
// //                             child: child,
// //                             builder: (BuildContext context, Widget? child) {
// //                               final flipAngle = Tween<double>(begin: 3.14, end: 0.0).animate(animation).value;
// //                               return Transform(
// //                                 alignment: Alignment.centerLeft,
// //                                 transform: Matrix4.identity()
// //                                   ..setEntry(3, 2, 0.001)
// //                                   ..rotateY(flipAngle),
// //                                 child: animation.value < 0.5
// //                                     ? Opacity(opacity: 0.0)
// //                                     : child,
// //                               );
// //                             },
// //                           );
// //                         }
// //                         return child;
// //                       },
// //                       child: showGoalBox
// //                           ? Padding(
// //                         padding: const EdgeInsets.only(left: 40.0),
// //                         child: GoalTile(
// //                           key: ValueKey<int>(currentGoalIndex),
// //                           number: "${currentGoalIndex + 1}",
// //                           color: currentGoal['color'],
// //                           icon: currentGoal['icon'],
// //                           title: currentGoal['title'],
// //                         ),
// //                       )
// //                           : SizedBox.shrink(),
// //                     ),
// //
// //                     // Spacer and animated sliding text
// //                     Expanded(
// //                       child: Padding(
// //                         padding: const EdgeInsets.only(left: 6.0),
// //                         child: AnimatedSwitcher(
// //                           duration: Duration(milliseconds: 500),
// //                           transitionBuilder: (Widget child, Animation<double> animation) {
// //                             final slideIn = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(animation);
// //                             return SlideTransition(position: slideIn, child: child);
// //                           },
// //                           child: showGoalTitle
// //                               ? Padding(
// //                             padding: const EdgeInsets.only(top: 0.0),
// //                             child: Text(
// //                               currentGoal['title'],
// //                               key: ValueKey<int>(currentGoalIndex),
// //                               textAlign: TextAlign.left,
// //                               styles: TextStyle(
// //                                 fontSize: 50,
// //                                 fontWeight: FontWeight.bold,
// //                                 fontFamily: 'BebasNeue',
// //                                 color: Color.fromRGBO(214, 214, 214, 0.8),
// //                               ),
// //                             ),
// //                           )
// //                               : SizedBox.shrink(),
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           )
// //
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // class GoalTile extends StatelessWidget {
// //   final String number;
// //   final Color color;
// //   final IconData icon;
// //   final String title;
// //
// //   GoalTile({
// //     required Key key,
// //     required this.number,
// //     required this.color,
// //     required this.icon,
// //     required this.title,
// //   }) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       mainAxisAlignment: MainAxisAlignment.start,
// //       children: [
// //         Padding(
// //           padding: const EdgeInsets.only(left: 0.0),
// //           child: SizedBox(
// //             height: 140,
// //             width: 140,
// //             child: Card(
// //               color: color,
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(0),
// //                 side: BorderSide(color: Colors.white, width: 3),
// //               ),
// //               child: Padding(
// //                 padding: const EdgeInsets.all(16.0),
// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       number,
// //                       styles: TextStyle(
// //                         fontSize: 28,
// //                         fontWeight: FontWeight.bold,
// //                         color: Colors.white,
// //                       ),
// //                     ),
// //                     Center(
// //                       child: Icon(
// //                         icon,
// //                         color: Colors.white,
// //                         size: 60,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// /////import 'package:flutter/material.dart';
// // import 'package:animated_text_kit/animated_text_kit.dart';
// //
// // void main() {
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: SplashScreen(),
// //     );
// //   }
// // }
// //
// // class SplashScreen extends StatefulWidget {
// //   @override
// //   _SplashScreenState createState() => _SplashScreenState();
// // }
// //
// // class _SplashScreenState extends State<SplashScreen> {
// //   int currentGoalIndex = 0;
// //   bool showAnimatedText = false;
// //   bool showGoalTitleAndNote = false; // Track when to show the title and note
// //
// //   final List<Map<String, dynamic>> goalData = [
// //     {
// //       'title': 'Goal1',
// //       'color': Colors.red,
// //       'icon': Icons.public,
// //       'description': 'NATIONAL\nINTEGRITY.',
// //       'note': 'NATIONAL INTEGRITY',
// //     },
// //     {
// //       'title': 'Goal2',
// //       'color': Colors.orange,
// //       'icon': Icons.people,
// //       'description': 'EQUAL OPPORTUNITY\nGENDER EQUALITY',
// //       'note': 'EQUAL OPPORTUNITY',
// //     },
// //     {
// //       'title': 'Goal3',
// //       'color': Colors.green,
// //       'icon': Icons.healing,
// //       'description': 'GOOD HEALTH\nWELL-BEING',
// //       'note': 'GOOD HEALTH',
// //     },
// //     {
// //       'title': 'Goal4',
// //       'color': Colors.blue,
// //       'icon': Icons.balance,
// //       'description': 'JUSTICE, PEACE,CLAM\nPROSPERITY',
// //       'note': 'JUSTICE & PEACE',
// //     },
// //   ];
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _startGoalSequence();
// //   }
// //
// //   void _startGoalSequence() async {
// //     while (mounted) {
// //       setState(() => showAnimatedText = true);
// //
// //       await Future.delayed(Duration(seconds: 3));
// //       setState(() => showGoalTitleAndNote = true);  // Show title and note
// //
// //       await Future.delayed(Duration(seconds: 3));
// //       setState(() {
// //         showGoalTitleAndNote = false; // Hide title and note after some time
// //         currentGoalIndex = (currentGoalIndex + 1) % goalData.length;
// //       });
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final currentGoal = goalData[currentGoalIndex];
// //
// //     return Scaffold(
// //       backgroundColor: currentGoal['color'],
// //       body: Stack(
// //         children: [
// //           if (showAnimatedText)
// //             Positioned(
// //               top: 180,
// //               left: 0,
// //               right: 0,
// //               child: Padding(
// //                 padding: EdgeInsets.only(left: 14.0),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     // Animated Text "USE THIS APP TO"
// //                     AnimatedTextKit(
// //                       animatedTexts: [
// //                         TypewriterAnimatedText(
// //                           'USE THIS APP TO',
// //                           textStyle: TextStyle(
// //                             fontSize: 50.0,
// //                             fontWeight: FontWeight.w900,
// //                             fontFamily: 'BebasNeue',
// //                             color: Color.fromRGBO(214, 214, 214, 0.8),
// //                             letterSpacing: 0.5,
// //                             height: 1.2,
// //                           ),
// //                           speed: Duration(milliseconds: 140),
// //                         ),
// //                       ],
// //                       totalRepeatCount: 1,
// //                     ),
// //                     SizedBox(height: 20.0),
// //                     // Goal Description Text
// //                     Text(
// //                       currentGoal['description'] ?? '',
// //                       key: ValueKey<int>(currentGoalIndex),
// //                       textAlign: TextAlign.left,
// //                       styles: TextStyle(
// //                         fontSize: 40.0,
// //                         fontWeight: FontWeight.bold,
// //                         fontFamily: 'BebasNeue',
// //                         color: Colors.white,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           // Goal Title and Note Displayed After Animated Text
// //           if (showGoalTitleAndNote)
// //             Center(
// //               child: Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       currentGoal['title'],
// //                       key: ValueKey<int>(currentGoalIndex),
// //                       textAlign: TextAlign.left,
// //                       styles: TextStyle(
// //                         fontSize: 50,
// //                         fontWeight: FontWeight.bold,
// //                         fontFamily: 'BebasNeue',
// //                         color: Color.fromRGBO(214, 214, 214, 0.8),
// //                       ),
// //                     ),
// //                     SizedBox(height: 10),
// //                     Text(
// //                       currentGoal['note'],
// //                       textAlign: TextAlign.left,
// //                       styles: TextStyle(
// //                         fontSize: 28.0,
// //                         fontWeight: FontWeight.bold,
// //                         fontFamily: 'BebasNeue',
// //                         color: Colors.white,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// //
// // class GoalTile extends StatelessWidget {
// //   final String number;
// //   final Color color;
// //   final IconData icon;
// //   final String title;
// //
// //   GoalTile({
// //     required Key key,
// //     required this.number,
// //     required this.color,
// //     required this.icon,
// //     required this.title,
// //   }) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       mainAxisAlignment: MainAxisAlignment.start,
// //       children: [
// //         Padding(
// //           padding: const EdgeInsets.only(left: 0.0),
// //           child: SizedBox(
// //             height: 140,
// //             width: 140,
// //             child: Card(
// //               color: color,
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(0),
// //                 side: BorderSide(color: Colors.white, width: 3),
// //               ),
// //               child: Padding(
// //                 padding: const EdgeInsets.all(16.0),
// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       number,
// //                       styles: TextStyle(
// //                         fontSize: 28,
// //                         fontWeight: FontWeight.bold,
// //                         color: Colors.white,
// //                       ),
// //                     ),
// //                     Center(
// //                       child: Icon(
// //                         icon,
// //                         color: Colors.white,
// //                         size: 60,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// /////////////////////11/18/2024/////
// //import 'package:flutter/material.dart';
// // import 'package:animated_text_kit/animated_text_kit.dart';
// //
// // void main() {
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: SplashScreen(),
// //     );
// //   }
// // }
// //
// // class SplashScreen extends StatefulWidget {
// //   @override
// //   _SplashScreenState createState() => _SplashScreenState();
// // }
// //
// // class _SplashScreenState extends State<SplashScreen> {
// //   int currentGoalIndex = 0;
// //   bool showAnimatedText = false;
// //   bool showGoalBox = false;
// //   bool showGoalTitle = false;
// //   bool showGoalDescription = false;
// //
// //   final List<Map<String, dynamic>> goalData = [
// //     {
// //       'title': 'Goal1',
// //       'color': Colors.red,
// //       'icon': Icons.public,
// //       'description': 'NATIONAL\nINTEGRITY.',
// //       'note': 'NATIONAL INTEGRITY',
// //     },
// //     {
// //       'title': 'Goal2',
// //       'color': Colors.orange,
// //       'icon': Icons.people,
// //       'description': 'EQUAL OPPORTUNITY\nGENDER EQUALITY',
// //       'note': 'EQUAL OPPORTUNITY',
// //     },
// //     {
// //       'title': 'Goal3',
// //       'color': Colors.green,
// //       'icon': Icons.healing,
// //       'description': 'GOOD HEALTH\nWELL-BEING',
// //       'note': 'GOOD HEALTH',
// //     },
// //     {
// //       'title': 'Goal4',
// //       'color': Colors.blue,
// //       'icon': Icons.balance,
// //       'description': 'JUSTICE, PEACE,CLAM\nPROSPERITY',
// //       'note': 'JUSTICE,PEACE',
// //     },
// //   ];
// //
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _startGoalSequence();
// //   }
// //
// //   void _startGoalSequence() async {
// //     while (mounted) {
// //       setState(() => showAnimatedText = true);
// //
// //       await Future.delayed(Duration(seconds: 3));
// //       setState(() => showGoalDescription = true);  // Show description first
// //
// //       await Future.delayed(Duration(seconds: 2));
// //       setState(() => showGoalBox = true);
// //
// //       await Future.delayed(Duration(seconds: 2));
// //       setState(() => showGoalTitle = true);
// //
// //       await Future.delayed(Duration(seconds: 3));
// //       setState(() {
// //         showGoalDescription = false;
// //         showGoalTitle = false;
// //         showGoalBox = false;
// //       });
// //
// //       await Future.delayed(Duration(seconds: 1));
// //       setState(() {
// //         showAnimatedText = false;
// //         currentGoalIndex = (currentGoalIndex + 1) % goalData.length;
// //       });
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final currentGoal = goalData[currentGoalIndex];
// //
// //     return Scaffold(
// //       backgroundColor: currentGoal['color'],
// //       body: Stack(
// //         children: [
// //           if (showAnimatedText && showGoalDescription)
// //             Positioned(
// //               top: 180,
// //               left: 0,
// //               right: 0,
// //               child: Padding(
// //                 padding: EdgeInsets.only(left: 14.0),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     // Animated Text "USE THIS APP TO"
// //                     AnimatedTextKit(
// //                       animatedTexts: [
// //                         TypewriterAnimatedText(
// //                           'USE THIS APP TO',
// //                           textStyle: TextStyle(
// //                             fontSize: 50.0,
// //                             fontWeight: FontWeight.w900,
// //                             fontFamily: 'BebasNeue',
// //                             color: Color.fromRGBO(214, 214, 214, 0.8),
// //                             letterSpacing: 0.5,
// //                             height: 1.2,
// //                           ),
// //                           speed: Duration(milliseconds: 140),
// //                         ),
// //                       ],
// //                       totalRepeatCount: 1,
// //                     ),
// //                     SizedBox(height: 20.0),
// //                     // Goal Description Text
// //                     Text(
// //                       currentGoal['description'] ?? '',
// //                       key: ValueKey<int>(currentGoalIndex),
// //                       textAlign: TextAlign.left,
// //                       styles: TextStyle(
// //                         fontSize: 40.0,
// //                         fontWeight: FontWeight.bold,
// //                         fontFamily: 'BebasNeue',
// //                         color: Colors.white,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           // Main Content Centered, with Goal Box and Title after Description
// //           Center(
// //             child: Padding(
// //               padding: const EdgeInsets.only(right: 120.0), // Add padding to shift left
// //               child: Container(
// //                 width: MediaQuery.of(context).size.width * 0.8,
// //                 child: Row(
// //                   crossAxisAlignment: CrossAxisAlignment.center,
// //                   children: [
// //                     // Animated rotation for the box
// //                     AnimatedSwitcher(
// //                       duration: Duration(milliseconds: 500),
// //                       transitionBuilder: (Widget child, Animation<double> animation) {
// //                         if (child is GoalTile) {
// //                           return AnimatedBuilder(
// //                             animation: animation,
// //                             child: child,
// //                             builder: (BuildContext context, Widget? child) {
// //                               final flipAngle = Tween<double>(begin: 3.14, end: 0.0).animate(animation).value;
// //                               return Transform(
// //                                 alignment: Alignment.centerLeft,
// //                                 transform: Matrix4.identity()
// //                                   ..setEntry(3, 2, 0.001)
// //                                   ..rotateY(flipAngle),
// //                                 child: animation.value < 0.5
// //                                     ? Opacity(opacity: 0.0)
// //                                     : child,
// //                               );
// //                             },
// //                           );
// //                         }
// //                         return child;
// //                       },
// //                       child: showGoalBox
// //                           ? Padding(
// //                         padding: const EdgeInsets.only(left: 40.0),
// //                         child: GoalTile(
// //                           key: ValueKey<int>(currentGoalIndex),
// //                           number: "${currentGoalIndex + 1}",
// //                           color: currentGoal['color'],
// //                           icon: currentGoal['icon'],
// //                           title: currentGoal['title'],
// //                         ),
// //                       )
// //                           : SizedBox.shrink(),
// //                     ),
// //
// //                     // Spacer and animated sliding text
// //                     Expanded(
// //                       child: Padding(
// //                         padding: const EdgeInsets.only(left: 6.0),
// //                         child: AnimatedSwitcher(
// //                           duration: Duration(milliseconds: 500),
// //                           transitionBuilder: (Widget child, Animation<double> animation) {
// //                             final slideIn = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(animation);
// //                             return SlideTransition(position: slideIn, child: child);
// //                           },
// //                           child: showGoalTitle
// //                               ? Padding(
// //                             padding: const EdgeInsets.only(top: 420),
// //                             child: Column(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 Text(
// //                                   currentGoal['title'],
// //                                   key: ValueKey<int>(currentGoalIndex),
// //                                   textAlign: TextAlign.left,
// //                                   styles: TextStyle(
// //                                     fontSize: 48,
// //                                     fontWeight: FontWeight.bold,
// //                                     fontFamily: 'BebasNeue',
// //                                     color: Color.fromRGBO(214, 214, 214, 0.8),
// //                                   ),
// //                                 ),
// //                                 Text(
// //                                   currentGoal['note'],
// //                                   textAlign: TextAlign.left,
// //                                   softWrap: false,
// //                                   overflow: TextOverflow.ellipsis, // Text will show '...' when too long
// //                                   styles: TextStyle(
// //                                     fontSize: 28.0, // Adjust font size
// //                                     fontWeight: FontWeight.bold,
// //                                     fontFamily: 'BebasNeue',
// //                                     color: Colors.white,
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           )
// //                               : SizedBox.shrink(),
// //                         ),
// //                       ),
// //                     ),
// //
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           )
// //
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // class GoalTile extends StatelessWidget {
// //   final String number;
// //   final Color color;
// //   final IconData icon;
// //   final String title;
// //
// //   GoalTile({
// //     required Key key,
// //     required this.number,
// //     required this.color,
// //     required this.icon,
// //     required this.title,
// //   }) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       mainAxisAlignment: MainAxisAlignment.start,
// //       children: [
// //         Padding(
// //           padding: const EdgeInsets.only(left: 0.0),
// //           child: SizedBox(
// //             height: 140,
// //             width: 140,
// //             child: Card(
// //               color: color,
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(0),
// //                 side: BorderSide(color: Colors.white, width: 3),
// //               ),
// //               child: Padding(
// //                 padding: const EdgeInsets.all(16.0),
// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       number,
// //                       styles: TextStyle(
// //                         fontSize: 28,
// //                         fontWeight: FontWeight.bold,
// //                         color: Colors.white,
// //                       ),
// //                     ),
// //                     Center(
// //                       child: Icon(
// //                         icon,
// //                         color: Colors.white,
// //                         size: 60,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }
//
//
//
//
// import 'package:flutter/material.dart';
//
// class GoalScreen extends StatefulWidget {
//   @override
//   _GoalScreenState createState() => _GoalScreenState();
// }
//
// class _GoalScreenState extends State<GoalScreen> {
//   final List<Map<String, dynamic>> goalData = [
//     {
//       'color': Colors.blueAccent,
//       'description': 'Achieve your dreams with this app!',
//       'title': 'Personal Growth',
//       'note': 'Set daily goals and track progress',
//       'icon': Icons.star,
//     },
//   ];
//   int currentGoalIndex = 0;
//   bool showAnimatedText = true;
//   bool showGoalDescription = true;
//   bool showGoalBox = true;
//   bool showGoalTitle = true;
//
//   @override
//   Widget build(BuildContext context) {
//     final currentGoal = goalData[currentGoalIndex];
//
//     return Scaffold(
//       backgroundColor: currentGoal['color'],
//       body: Stack(
//         children: [
//           if (showAnimatedText && showGoalDescription)
//             Positioned(
//               top: 180,
//               left: 0,
//               right: 0,
//               child: Padding(
//                 padding: EdgeInsets.only(left: 14.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     AnimatedTextKit(
//                       animatedTexts: [
//                         TypewriterAnimatedText(
//                           'USE THIS APP TO',
//                           textStyle: TextStyle(
//                             fontSize: 50.0,
//                             fontWeight: FontWeight.w900,
//                             fontFamily: 'BebasNeue',
//                             color: Color.fromRGBO(214, 214, 214, 0.8),
//                             letterSpacing: 0.5,
//                             height: 1.2,
//                           ),
//                           speed: Duration(milliseconds: 140),
//                         ),
//                       ],
//                       totalRepeatCount: 1,
//                     ),
//                     SizedBox(height: 20.0),
//                     Text(
//                       currentGoal['description'] ?? '',
//                       key: ValueKey<int>(currentGoalIndex),
//                       textAlign: TextAlign.left,
//                       styles: TextStyle(
//                         fontSize: 40.0,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'BebasNeue',
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 AnimatedSwitcher(
//                   duration: Duration(milliseconds: 500),
//                   transitionBuilder: (Widget child, Animation<double> animation) {
//                     final slideIn = Tween<Offset>(
//                         begin: Offset(1, 0), end: Offset(0, 0))
//                         .animate(animation);
//                     return SlideTransition(position: slideIn, child: child);
//                   },
//                   child: showGoalBox
//                       ? GoalTile(
//                     key: ValueKey<int>(currentGoalIndex),
//                     number: "${currentGoalIndex + 1}",
//                     color: currentGoal['color'],
//                     icon: currentGoal['icon'],
//                     title: currentGoal['title'],
//                   )
//                       : SizedBox.shrink(),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: 50,
//             left: 0,
//             right: 0,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 CustomButton(
//                   text: 'Sign In',
//                   backgroundColor: Colors.white,
//                   textColor: currentGoal['color'],
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => SignInScreenView()),
//                     );
//                   },
//                 ),
//                 CustomButton(
//                   text: 'Sign Up',
//                   backgroundColor: Colors.white,
//                   textColor: currentGoal['color'],
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => SignUpScreenView()),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class CustomButton extends StatelessWidget {
//   final String text;
//   final Color backgroundColor;
//   final Color textColor;
//   final VoidCallback onPressed;
//
//   CustomButton({
//     required this.text,
//     required this.backgroundColor,
//     required this.textColor,
//     required this.onPressed,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       styles: ElevatedButton.styleFrom(
//         primary: backgroundColor,
//         onPrimary: textColor,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       ),
//       onPressed: onPressed,
//       child: Text(
//         text,
//         styles: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
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
//     required this.number,
//     required this.color,
//     required this.icon,
//     required this.title,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: color,
//       child: ListTile(
//         leading: Icon(icon, color: Colors.white),
//         title: Text(
//           title,
//           styles: TextStyle(color: Colors.white),
//         ),
//         subtitle: Text(
//           "Goal #$number",
//           styles: TextStyle(color: Colors.white70),
//         ),
//       ),
//     );
//   }
// }
//
// class SignInScreenView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Sign In')),
//       body: Center(
//         child: Text('Sign In Screen'),
//       ),
//     );
//   }
// }
//
// class SignUpScreenView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Sign Up')),
//       body: Center(
//         child: Text('Sign Up Screen'),
//       ),
//     );
//   }
// }















/////Leatest/////
//import 'package:flutter/material.dart';
// import './login_screen_view.dart';
// import './sign_up_screen_view.dart';
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
//       home: IntroScreen(),
//     );
//   }
// }
//
// class IntroScreen extends StatefulWidget {
//   @override
//   _IntroScreenState createState() => _IntroScreenState();
// }
//
// class _IntroScreenState extends State<IntroScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _logoAnimation;
//   late Animation<Offset> _welcomeTextAnimation;
//   late Animation<Offset> _partyNameAnimation;
//
//   bool showText1 = false;
//   bool showText2 = false;
//   bool showText3 = false;
//   bool showText4 = false;
//   bool showText6 = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 1500),
//     );
//
//     // Logo slides from top
//     _logoAnimation = Tween<Offset>(
//       begin: Offset(0, -1),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Interval(0.0, 0.8, curve: Curves.easeOutCubic),
//     ));
//
//     // Welcome text slides from left
//     _welcomeTextAnimation = Tween<Offset>(
//       begin: Offset(-1, 0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Interval(0.3, 1.0, curve: Curves.easeOutCubic),
//     ));
//
//     // Party name slides from right
//     _partyNameAnimation = Tween<Offset>(
//       begin: Offset(1, 0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Interval(0.5, 1.0, curve: Curves.easeOutCubic),
//     ));
//
//     _startSequence();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   Future<void> _startSequence() async {
//     await _controller.forward();
//     await Future.delayed(Duration(milliseconds: 500));
//
//     setState(() {
//       showText1 = true;
//     });
//     await Future.delayed(Duration(milliseconds: 500));
//
//     setState(() {
//       showText2 = true;
//     });
//     await Future.delayed(Duration(milliseconds: 500));
//
//     setState(() {
//       showText3 = true;
//     });
//     await Future.delayed(Duration(milliseconds: 500));
//
//     setState(() {
//       showText4 = true;
//     });
//     await Future.delayed(Duration(milliseconds: 500));
//
//     setState(() {
//       showText6 = true;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       body: Container(
//         color: Colors.white,
//         child: Stack(
//           children: [
//             if (showText1)
//               Positioned(
//                 top: 46,
//                 right: 20,
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => LoginScreenView()),
//                     );
//                   },
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                     decoration: BoxDecoration(
//                       color: Colors.grey.withOpacity(0.4),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Text(
//                       'Skip',
//                       styles: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         // color: Colors.blueAccent,
//                         color: Color(0xFF1D4ED8),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             if (showText1)
//               Positioned(
//                 bottom: 70,
//                 left: 0,
//                 right: 0,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => LoginScreenView()),
//                         );
//                       },
//                       child: Container(
//                         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                         decoration: BoxDecoration(
//                           color: Colors.grey.withOpacity(0.8),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Text(
//                           'Sign In',
//                           styles: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             // color: Colors.blueAccent,
//                             color: Color(0xFF1D4ED8),
//                           ),
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => SignUpScreenView()),
//                         );
//                       },
//                       child: Container(
//                         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                         decoration: BoxDecoration(
//                           color: Colors.grey.withOpacity(0.8),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Text(
//                           'Sign Up',
//                           styles: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             // color: Colors.blueAccent,
//                             color: Color(0xFF1D4ED8),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             SlideTransition(
//               position: _logoAnimation,
//               child: Padding(
//                 padding: EdgeInsets.only(top: screenHeight * 0.16),
//                 child: Align(
//                   alignment: Alignment.topCenter,
//                   child: Image.asset(
//                     'assets/images/bpp_logo2.png',
//                     height: screenHeight * 0.14,
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               top: screenHeight * 0.31,
//               left: 0,
//               right: 0,
//               child: SlideTransition(
//                 position: _welcomeTextAnimation,
//                 child: Center(
//                   // child: Text(
//                   //   'Welcome to',
//                   //   styles: TextStyle(
//                   //     fontSize: 30,
//                   //     // fontFamily: 'Anton',
//                   //     // fontWeight: FontWeight.w400,
//                   //     fontFamily: 'Oswald',
//                   //     fontWeight: FontWeight.bold,
//                   //   ),
//                   // ),
//                 ),
//               ),
//             ),
//             Positioned(
//               top: screenHeight * 0.32,
//               left: 0,
//               right: 0,
//               child: SlideTransition(
//                 position: _partyNameAnimation,
//                 child: Center(
//                   child: Text(
//                     'Bharatiya Popular Party',
//                     styles: TextStyle(
//                       fontSize: 30,
//                       fontFamily: 'Oswald',
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blueAccent,
//                       // color: Color(0xFF1D4ED8),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             if (showText1) _buildCascadingText("India's 1st Political App", 0, 0),
//             // if (showText2) _buildCascadingText("1st", 0.9, 66),
//             // if (showText3) _buildCascadingText("Political App", 1.7, 90),
//             if (showText2) _buildCascadingText("Seamless, Impactful", 0.5, 0),
//             if (showText3) _buildCascadingText("Community Contribution", 1.1, 0),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCascadingText(String text, double lineIndex, double baseIndent) {
//     return Positioned(
//       top: MediaQuery.of(context).size.height * 0.46 + (lineIndex * 50.0),
//       left: MediaQuery.of(context).size.width * 0.10 + baseIndent,
//       child: Text(
//         text,
//         styles: TextStyle(
//           fontSize: MediaQuery.of(context).size.width * 0.08,
//           // fontFamily: 'Anton',
//           // fontWeight: FontWeight.w400,
//           // fontFamily: 'Oswald',
//           fontWeight: FontWeight.bold,
//           letterSpacing: -1.1,
//           //   fontSize: 32, // Equivalent to text-4xl in Tailwind
//           // color: Colors.blueAccent,
//           color: Color(0xFF1D4ED8),
//         ),
//       ),
//     );
//   }
// }
