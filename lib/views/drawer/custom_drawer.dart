import 'package:flutter/material.dart';

import '../../controller/screens/screen_dashbaord.dart';
import 'my_drawer_header.dart';

class CustomDrawer extends StatelessWidget {
  final DrawerSections currentPage;
  final Function(DrawerSections) onSectionSelected;

  const CustomDrawer({
    required this.currentPage,
    required this.onSectionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            MyHeaderDrawer(),
            _buildDrawerList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerList(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          _menuItem(context, DrawerSections.dashboard, "Dashboard",
              Icons.dashboard_outlined),
          _menuItem(context, DrawerSections.contacts, "Goals",
              Icons.people_alt_outlined),
          _menuItem(context, DrawerSections.events, "Donate", Icons.event),
          _menuItem(context, DrawerSections.notes, "Profile", Icons.notes),
          const Divider(),
          _menuItem(context, DrawerSections.settings, "Settings",
              Icons.settings_outlined),
          _menuItem(context, DrawerSections.notifications, "Notifications",
              Icons.notifications_outlined),
          const Divider(),
          _menuItem(context, DrawerSections.privacy_policy, "Privacy policy",
              Icons.privacy_tip_outlined),
          _menuItem(context, DrawerSections.membership, "Send feedback",
              Icons.feedback_outlined),
        ],
      ),
    );
  }

  Widget _menuItem(BuildContext context, DrawerSections section, String title,
      IconData icon) {
    final bool isSelected = section == currentPage;

    return Material(
      color: isSelected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          onSectionSelected(section);
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
