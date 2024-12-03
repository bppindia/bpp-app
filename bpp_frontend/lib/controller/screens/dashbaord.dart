// dashboard_screen.dart
import 'package:flutter/material.dart';
import '../../views/india_map.dart';
import '../../views/widgets/banner_widget.dart';
import '../../views/widgets/footer.dart';
import '../../views/widgets/summary_section.dart';
import '../../views/widgets/tab_bar_section.dart';
import '../../views/widgets/top_navigation_bar.dart';



class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600;

    // Adjust spacing based on screen width
    final double padding = isWideScreen ? 16.0 : 8.0;
    final double verticalSpacing = isWideScreen ? 12.0 : 8.0;

    return Scaffold(
      appBar: TopNavigationBar(),
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
