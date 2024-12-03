import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug banner
      theme: ThemeData(
        useMaterial3: true, // Enable Material 3 for adaptive design
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: Scaffold(
        appBar: TopNavigationBar(),
        body: Center(child: Text('Main Content Area')),
      ),
    );
  }
}

class TopNavigationBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _TopNavigationBarState createState() => _TopNavigationBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 20); // Adjusted height for aesthetics
}

class _TopNavigationBarState extends State<TopNavigationBar> {
  bool isExchangeSelected = true;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          _showPopupMenu(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey[300],
            backgroundImage: NetworkImage(""), // Replace with avatar URL if available
            child: Text(
              "CN",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      title: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Allow horizontal scrolling
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Container padding for spacing
            decoration: BoxDecoration(
              color: Colors.grey[200], // Light grey background color for the tab container
              borderRadius: BorderRadius.circular(20), // Rounded corners for the container
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTabButton("National", isExchangeSelected),
                SizedBox(width: 8), // Spacing between buttons
                _buildTabButton("State", !isExchangeSelected),
              ],
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search, color: Colors.black),
          onPressed: () {
            // Implement search functionality
          },
        ),
        IconButton(
          icon: Icon(Icons.notifications, color: Colors.black),
          onPressed: () {
            // Implement notifications functionality
          },
        ),
      ],
    );
  }

  Widget _buildTabButton(String title, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExchangeSelected = title == "National";
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          vertical: 4, // Smaller vertical padding
          horizontal: 15, // Smaller horizontal padding
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent, // White background for selected tab
          borderRadius: BorderRadius.circular(15), // Smaller radius for less rounded corners
          border: Border.all(
            color: isSelected ? Colors.blueAccent : Colors.transparent, // Border for selected tab
            width: isSelected ? 1.0 : 0, // Thinner border width for selected tab
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.grey, // Text color based on selection
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, // Bold text for selected tab
            fontSize: 14, // Slightly smaller font size
          ),
        ),
      ),
    );
  }

  void _showPopupMenu(BuildContext context) {
    showMenu<int>(
      context: context,
      position: RelativeRect.fromLTRB(0.0, 80.0, 0.0, 0.0),
      items: [
        PopupMenuItem<int>(value: 1, child: Text("Profile", style: _popupMenuTextStyle())),
        PopupMenuItem<int>(value: 2, child: Text("Billing", style: _popupMenuTextStyle())),
        PopupMenuItem<int>(value: 3, child: Text("Settings", style: _popupMenuTextStyle())),
        PopupMenuItem<int>(value: 4, child: Text("Keyboard shortcuts", style: _popupMenuTextStyle())),
        PopupMenuDivider(),
        PopupMenuItem<int>(value: 5, child: Text("Log out", style: _popupMenuTextStyle())),
      ],
      elevation: 8.0,
    ).then((value) {
      if (value != null) {
        print("Selected menu item: $value");
      }
    });
  }

  TextStyle _popupMenuTextStyle() {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.grey[800],
    );
  }
}
