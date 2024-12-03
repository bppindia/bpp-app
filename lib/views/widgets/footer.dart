import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Footer extends StatefulWidget {
  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  int _selectedIndex = 0;  // Initial index is set to 0

  // Handle navigation when an item is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:  // Home
        Get.toNamed('/dashboard');  // Navigate to ScreenDashboard
        break;
      case 2:  // Goals
        Get.toNamed('/goals');  // Navigate to GoalsScreen
        break;
      case 3:  // Donate
        Get.toNamed('/donor-dashboard');  // Navigate to DonorDashboard
        break;
      case 4:  // Donate
        Get.toNamed('/wallet');  // Navigate to DonorDashboard
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600; // Check for wide screens (Tablet/PC)

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      backgroundColor: Colors.white,
      elevation: 8,
      items: [
        _buildNavItem(
          icon: Icons.home,
          label: 'Home',
          isSelected: _selectedIndex == 0,
          isWideScreen: isWideScreen,
        ),
        _buildNavItem(
          icon: Icons.sync,
          label: 'Update',
          isSelected: _selectedIndex == 1,
          isWideScreen: isWideScreen,
        ),
        _buildCenterItem(),
        _buildNavItem(
          iconAsset: 'assets/images/goal.png',
          label: 'Goals',
          isSelected: _selectedIndex == 2,
          isWideScreen: isWideScreen,
        ),
        _buildNavItem(
          icon: Icons.account_balance_wallet,
          label: 'Wallet',
          isSelected: _selectedIndex == 3,
          isWideScreen: isWideScreen,
        ),
      ],
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      selectedFontSize: isWideScreen ? 14 : 12,
      unselectedFontSize: isWideScreen ? 12 : 10,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
    );
  }

  // Helper function to build navigation items
  BottomNavigationBarItem _buildNavItem({
    IconData? icon,
    String? iconAsset,
    required String label,
    required bool isSelected,
    required bool isWideScreen,
  }) {
    return BottomNavigationBarItem(
      icon: iconAsset != null
          ? Image.asset(
        iconAsset,
        width: isWideScreen ? 30 : 24,
        height: isWideScreen ? 30 : 24,
      )
          : Icon(
        icon,
        size: isWideScreen ? 30 : 24,
        color: isSelected ? Colors.black : Colors.grey,
      ),
      label: label,
    );
  }

  // Special center item (Donate button)
  BottomNavigationBarItem _buildCenterItem() {
    return BottomNavigationBarItem(
      icon: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: _selectedIndex == 2 ? Colors.blue : Colors.transparent,
          shape: BoxShape.circle,
          boxShadow: _selectedIndex == 2
              ? [
            BoxShadow(
              color: Colors.blue.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ]
              : [],
        ),
        child: Icon(
          Icons.volunteer_activism,  // Heart in hand icon for "Donate"
          color: _selectedIndex == 2 ? Colors.white : Colors.blue,
          size: 28,
        ),
      ),
      label: 'Donate',
    );
  }
}