// import 'package:flutter/material.dart';
//
// class GoalsScreen10 extends StatelessWidget {
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
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Goals'),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Wrap(
//           spacing: 4.0, // Horizontal space between text items
//           runSpacing: 4.0, // Vertical space between lines
//           children: goals
//               .map(
//                 (goal) => Text(
//                   goal,
//                   style: TextStyle(
//                     fontSize: 10.0, // Small font size
//                     color: Colors.black87,
//                   ),
//                 ),
//               )
//               .toList(),
//         ),
//       ),
//     );
//   }
// }
