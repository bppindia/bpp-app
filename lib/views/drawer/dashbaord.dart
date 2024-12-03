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
import 'package:flutter/material.dart';
import '../../views/component/india_map.dart';
import '../widgets/dashbaord/banner_widget.dart';
import '../../views/widgets/footer.dart';
import '../widgets/dashbaord/summary_section.dart';
import '../widgets/dashbaord/tab_bar_section.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600;

    // Adjust spacing based on screen width
    final double padding = isWideScreen ? 16.0 : 8.0;
    final double verticalSpacing = isWideScreen ? 12.0 : 8.0;

    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: verticalSpacing),
              SummarySection(),
              SizedBox(height: verticalSpacing),
              // ActionButtons(),
              SizedBox(height: verticalSpacing),
              BannerWidget(),
              SizedBox(height: verticalSpacing),
              IndiaMap(), // Display the India map here
              SizedBox(height: verticalSpacing),
              TabBarSection(),
              // DashboardHeader(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
